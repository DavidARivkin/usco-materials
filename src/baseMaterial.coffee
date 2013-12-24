

class BaseMaterial_future #TODO: all these properties will be used in the future, for now see BaseMaterial class, keeping it simple
  constructor:->
    #TODO: brainstorm : http://en.wikipedia.org/wiki/List_of_materials_properties
    #some properties would be calculated obviously
    #TODO: also see phyiscal based shading/ rendering http://seblagarde.wordpress.com/2011/08/17/feeding-a-physical-based-lighting-mode/
    #http://seblagarde.wordpress.com/2012/04/30/dontnod-specular-and-glossiness-chart/
    #TODO: http://hyperphysics.phy-astr.gsu.edu/hbase/thermo/spht.html
    #and http://reprap.org/wiki/PLA
    
    #optical : #hmm all of these depend not only on the raw material used, but on how the material is structured
    #within an object
    @absorbtion = ""
    @color = ""#color : RGBA
    @luminosity = ""
    @reflectivity = "" #http://gamedev.stackexchange.com/questions/19963/where-can-i-get-a-list-or-data-base-of-light-reflectance-values-for-different-ma
    @refractivity = ""
    @scatering = ""
    @transmitance = ""
    #@specular = "" #color + texture + shader ??
    
    
    
    #physical/mecanical
    @restitution = "" #elasticity
    @friction    = ""
    @conductivity = ""
    @permeability = ""
    @compressiveStrenght = ""
    @hardness = ""
    
    @weight = "" #atomic mass, specific weight ?
    
    
    #critical temperatures
    @Tg = 60  #glassTransition temperature Celsius #http://en.wikipedia.org/wiki/Glass_transition
    @Tm = 100 #melting temperature Celsius

    shine= 1500
    spec= 1000
    opacity = 1
    @_threeJsMaterial = new THREE.MeshPhongMaterial({color:  0xFFFFFF , shading: THREE.SmoothShading,  shininess: shine, specular: spec, metal: false}) 


class BaseMaterial
  constructor:->
    #optical :
    @color = ""#color : RGBA
    @reflectivity = 0.5
    @refractivity = 1.46 #PLA
    
    #physical/mecanical
    @restitution = 0.2 #elasticity
    
    #electrical
    @conductivity = 10e−14#hard rubber (as per wikipedia)
    @resistivity = 10e13 #hard rubber (as per wikipedia)ohm m−1
    
    @_threeJsMaterial = new THREE.MeshPhongMaterial({color:  @color , shading: THREE.SmoothShading}) 

  ###*
  *Necessary to recalculate values of the three.js material used for display (color etc)
  ###    
  getTHreeMaterial:->
    @_threeJsMaterial = new THREE.MeshPhongMaterial({color:  @color , shading: THREE.SmoothShading}) 
    return @_threeJsMaterial

module.exports = BaseMaterial