<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1177#issuecomment-6437513844 -->
Red team round 1 pass a (codex) of 60448fc

Verdict: needs_changes

1. **F01** (P2) The algebraic-to-Witt comparison loses its minuscule restriction

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:606: “For the quasi-tame prime-to-p polynomial model ... identify its perfection with the admissible Witt locus.”

   **Claim:** The comparison applies to the polynomial models of §1.2, which now allow every dominant bound.

   **Witness:** AGLR line 1356 requires depth zero; line 1394 specializes to minuscule bounds. For hyperspecial GL₂, μ=(2,0), (1+pE₁₂)e₂=e₂+pe₁ does not preserve p²We₁⊕We₂: depth zero fails.

   **Exact repair text:** “For a minuscule bound and the quasi-tame prime-to-p polynomial model, identify its special fibre with the reduced companion admissible locus and its perfection with the Witt admissible locus. Use the minuscule comparison, retaining its group-model identifications. General-bound v-special-fibre identification remains the separate GS0 theorem.” Cite AGLR Lemma 3.15 and the minuscule comparison following it, in addition to Theorem 6.16. Propagate this restriction to the §3.4 references in §§5.1, 7.8 and 8.2. The GL₂ bound (2,0) no longer claims this comparison; (1,0) has depth zero and remains included.

2. **F02** (P2) One gap combines coherence and Cohen–Macaulayness

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:113: “prove two statements”; packages/GeometricSatakeAndFusionPartII/design/plan.json, gap algebraic-coherence.

   **Claim:** One supplier contract requests both general parahoric coherence for Weil-restricted tame groups and an Iwahori Cohen–Macaulay theorem for split groups.

   **Witness:** §1.3 consumes (i); §7.3 consumes (ii). Their hypotheses and conclusions differ: the GL₂ Iwahori node has depth 1, whereas equality of the two ample-line Hilbert functions is a different assertion.

   **Exact repair text:** Retain `gap:algebraic-coherence` with exactly sentence (i). Add `gap:algebraic-admissible-cohen-macaulay`, supplier GeometricSatakeAndFusion, section “GS0, algebraic Schubert prefix”, with exactly sentence (ii). Declare both in README and plan.json. Replace the §7.3 dependency by the new slug; keep §1.3 on coherence. This separates the node's depth assertion from the Hilbert-function comparison without removing either target.

3. **F03** (P3) Two early assertions precede their prerequisites

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:486: “*Needs:* ... §2.6”; :310: “good iff its period-total embedding is good”.

   **Claim:** The displayed order places §2.5 before the chain-model flatness it consumes, and §0.6 asserts the period-total equivalence before the closed embedding of §2.7.

   **Witness:** §2.5 needs §2.6; §2.6 needs §1.2 and suppliers, not §2.5. The rank-two target is the incidence scheme xy=π; its flat-closure identification is only established in §2.6.

   **Exact repair text:** Place “Standard GL and GSp chain incidence models” before “The tame symplectic lattice-chain embedding”, renumber these two sections, and update their cross-references. The order becomes chain-model flatness → symplectic embedding → period-total embedding. The rank-two incidence calculation is then available before it is used. Move the chain/period-total goodness equivalence from §0.6 to a corollary of §2.7, keeping only the two definitions in §0.6. For r=2,h=2,d=1 the needed closed map is P¹×P¹→Gr(2,4); the equivalence then follows after this map is constructed.

4. **F04** (P2) “Stable Weyl lattices” does not specify scheme-theoretic stability

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:69: “Give uniqueness of stable minuscule Weyl lattices up to the representation centralizer”.

   **Claim:** The gap requests uniqueness without specifying the DVR, characteristic-zero fraction field, split reductive model, or meaning of stability.

   **Witness:** KPZ lines 977–984 require extensions to group-scheme representations. Over ℤ₃, weights (0,2,1) of Gₘ preserve Λ=ℤ₃e₁+ℤ₃(e₁+e₂)/3+ℤ₃e₃ on ℤ₃-points, but Λ is not split by weights.

   **Exact repair text:** “For a split reductive ℤ_p-group H₀, a DVR R over ℤ_p with characteristic-zero fraction field L, and a finite-dimensional minuscule H₀,L-representation V, prove that any two full R-lattices on which the representation extends to H₀,R are conjugate by Cent_GL(V)(H₀,L), allowing repeated highest weights (KPZ Lemma 3.3.10, pp. 22–23).” Put this sentence in both gap declarations. In the countermodel, a unit u acts on (e₁+e₂)/3 by u²(e₁+e₂)/3+(1−u²)e₁/3; this is integral for every u∈ℤ₃×, but (1−T²)/3 is not in ℤ₃[T,T⁻¹]. Thus the repaired hypothesis excludes it. Diagonal centralizers send split lattices to split lattices, so the missing distinction is substantive.

5. **F05** (P1) The Weyl-module input cites the wrong supplier layer

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:738 and :755: “Use the specified integral Weyl-module tensor functors”; “ReductiveGroupsPartII RG2.1”.

   **Claim:** The FM construction has its rational Weyl representations, integral forms, duality and weight bounds available from its named inputs.

   **Witness:** TauCetiRoadmap/ReductiveGroups/README.md:1759, §10B, owns precisely Δ(ν)=∇(−w₀ν)* and its base change. RG2.1 owns valued root data; its supplier list stops at ReductiveGroups layers 0–9.

   **Exact repair text:** Add an Exact supplier contract: “ReductiveGroups §10B, ‘Induction, Weyl modules and simple heads’, supplies the rational induced and Weyl modules, their arbitrary-field base change, integral Weyl lattices and extremal-weight equations. Retain Δ(ν)=∇(−w₀ν)* and distinguish ordinary and contravariant duality.” Add this owner to §4.6 and Layer 4 dependencies, and to the integral-representation contracts where these modules are inputs. This supplies V(ω)=k² for SL₂ and keeps Δ(pω) distinct from ∇(pω) in characteristic p, exactly as §4.6 requires.

6. **F06** (P1) General-bound normality still uses a generic flag

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:373: “apply ... trait normality ... to the normal generic flag”.

   **Claim:** The proof establishes §1.3 for every dominant bound and after every finite reflex-field extension.

   **Witness:** README :362 computes dim Gr_≤(2,0)=2 but dim GL₂/P_(2,0)=1. LEV line 1029 explicitly uses normality of the generic affine Schubert variety. The declared algebraic-normality gap only covers the companion range.

   **Exact repair text:** Replace the quoted phrase by “apply trait normality using geometric normality of the generic algebraic Schubert bound Gr_≤μ.” Add `gap:generic-algebraic-schubert-normality`, supplier GeometricSatakeAndFusion, section “GS0, algebraic Schubert prefix”, to README and plan.json: “For every connected reductive group over a characteristic-zero field and every geometric dominant bound defined over its reflex field, prove geometric normality of the algebraic affine Schubert bound.” Add this gap to §1.3's Needs. For GL₂ and (2,0), the input is now normality of the two-dimensional Schubert surface, not smoothness of P¹; the general-bound conclusion is retained.

7. **F07** (P1) Reducedness uses an unowned smooth open of the scheme model

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:1074: “the dense smooth maximal strata give R₀”.

   **Claim:** After obtaining normality, the proof has a dense relatively smooth open in the unperfected scheme representative, including every generic point of its special fibre.

   **Witness:** AGLR lines 2848–2854 uses Lemma 7.6, lines 2405–2407. Normal O[t]/(t²−π) has nonreduced special fibre k[t]/t² although its perfected reduction is a smooth point. Perfect Schubert smoothness cannot supply R₀.

   **Exact repair text:** Insert before §7.6 a local-model target: “For minuscule μ, the weakly normal representative has an O_E-smooth open whose geometric special fibre is the union of the maximal admissible orbits. Over O_C its charts are 𝒢_(O_C)/P⁻_λ, where P⁻_λ is the smooth affine connected schematic closure of the generic repeller parabolic and is the stabilizer of [λ].” Give AGLR Lemma 7.6, Remark 7.7 and (7.55) as locators; prove the stabilizer calculation using RG2.1 root-group models and RG2.3.1 “Big-cell criteria”. Construct the quotients over finite splitting extensions using RG2.3.1 “Quotients of group schemes over a DVR”, then base change and glue the charts. Name these inputs explicitly; this is a new local-model target, not a new general quotient theorem. Add this target to §7.6's Needs and use its scheme-level smoothness for R₀. The ramified DVR counterexample has no such relatively smooth open meeting its special generic point, so the repaired argument excludes it.

8. **F08** (P3) Two cocharacter Checks repeat their definition

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:703–705: “In C_n the tests use ω₁”; “The D^H family includes both spin coweights”.

   **Claim:** These are discriminating Checks of the mod-p abelian family and its finite detecting sets.

   **Witness:** Both simply repeat the defining lists at :690. They compute no dominance decision. In C₂, μ=(1,1), ν=(2,0) give ω₁-test −1; in D₄, opposite doubled spin endpoints give tests (0,−1,1).

   **Exact repair text:** Replace those two bullets by: “For C₂, μ=2ω₂∨=(1,1) admits ν=0 (test 1), but rejects ν=(2,0) (test −1); both differences are in the coroot lattice.” And: “For D₄, μ=2ω₄∨=(1,1,1,1), ν=2ω₃∨=(1,1,1,−1) give S_(Dᴴ)-tests (0,−1,1), so ν is rejected; interchanging the endpoints gives (0,1,−1), detecting the other spin weight.” Keep the B₃ integrality Check. These calculations distinguish the detecting sets from the wrong singleton {ω₁}.

9. **F09** (P2) The generic flag notation assumes an E-rational parabolic

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:627: “a unique flat projective weakly normal O_E-model M^wn of G/P_μ”; also :284 and :1072.

   **Claim:** For every connected reductive G and geometric minuscule conjugacy class with reflex field E, the generic flag is the quotient by P_μ over E.

   **Witness:** Take G=PGL₁(D) for a quaternion division algebra over F and the fundamental geometric class. E=F, but its flag is the pointless Severi–Brauer conic; G/P for an F-parabolic has a rational coset. KP lines 1253–1260 distinguishes these.

   **Exact repair text:** Add to §0.1: “Write ℱ_(G,{μ}) for the reflex-field descent of the geometric flag attached to {μ}. Over a splitting field it is the indicated parabolic quotient; no E-rational representative of μ or E-parabolic is assumed. If such a representative exists, identify ℱ_(G,{μ}) with the corresponding quotient using the fixed subspace/opposite-parabolic convention.” Replace the unconditional E-scheme notation G/P_μ by ℱ_(G,{μ}) in §§0.5, 3.6 and 7.6 and the corresponding generic-fibre specifications. In the §6.6 Check and Layer 6 example qualify P¹ as the geometric flag; over the reflex field use its descended form. Add the quaternion-division example as a Check: E=F and ℱ(F)=∅, while ℱ over a splitting field is P¹. This preserves all inner forms and removes the nonexistent rational base point.

10. **F10** (P1) The Drinfeld comparison assumes an unassigned flat Eisenstein model

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:987: “Use ... the flat normal Eisenstein model with reduced special fibre”.

   **Claim:** The algebraization argument can use the specified RZ17 scheme as a flat normal representative with reduced special fibre.

   **Witness:** §3.6 only constructs a weakly normal representative; gap:ramified-local-pel-data supplies orders and chains. Neither supplies the RZ17 Eisenstein locus or its flatness. RZ17 lines 1112–1114 derives normality from separate flatness and reducedness results.

   **Exact repair text:** Before applying full faithfulness in §6.5, add the named target “Flat Drinfeld and Eisenstein models”: “For F, D, n and the embedding-wise rank function r of §6.5, construct the RZ17 rank-and-Eisenstein closed quotient scheme. Prove its projectivity, flatness over O_E and geometrically reduced special fibre, identify its generic fibre with the descended μ-flag, and deduce normality. Include the distinguished Drinfeld rank function and arbitrary finite reflex-base extensions.” State the rank and Eisenstein equations explicitly, with RZ17 §5, Lemma 5.1 and Corollaries 5.2, 5.4, 5.6 as locators; give the special-fibre comparison and generic-point lifting route. Make §§6.5–6.6 consume this target, rather than treating those geometric properties as furnished by §3.6. For n=2, after an unramified splitting base change, the target supplies the chart xy=π; after a further ramified base change xy=ϖ² is flat with reduced special fibre and normal, exactly the properties the subsequent comparison uses.

11. **F11** (P2) The acceptable embedding consumes a standard-range normalization theorem

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:1084 and :1088 use §3.2; :586 begins “For a standard datum”.

   **Claim:** §3.2 supplies normalization of the scheme image for all acceptable Hodge data covered by §7.7.

   **Witness:** At p=5, a tame trialitarian simply connected D₄ factor with central μ can have the Galois-stable sum of its three minuscule representations. It is acceptable, but §0.3 explicitly excludes triality from “standard”.

   **Exact repair text:** State §3.2 conditionally at its actual proof generality: “For a minuscule datum equipped with a normal flat projective scheme representative and an integral Hodge embedding, the induced scheme map identifies that representative with the normalization of its schematic image.” Obtain the representative from §3.1 for the early application and from §7.6 for §7.7; do not make §3.2 depend on §7.6. For the witness take G=G_m×H, ρ the scalar twist of the 24-dimensional sum and μ(z)=(z,1). Its bound is a point and its normalization map is the identity. The reformulated theorem applies without wrongly asserting that H has classical nontrialitarian type.

12. **F12** (P3) Three geometric Checks give no discriminating model

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:294, :363 and :967: “does not satisfy this specification”; “not the schematic closure”; “need not be flat”.

   **Claim:** These bullets test reducedness, schematic closure and the naive determinant construction.

   **Witness:** The first repeats a defining requirement; the others name no instance. For ramified quadratic K/F, rank-two K-space and embedding-wise quotient ranks (2,0), generic determinant locus is a point but its special fibre contains a line of quotients.

   **Exact repair text:** Replace :294 by: “The flat projective conic x²=πyz has generic fibre P¹ (it has [0:1:0]) and double-line special fibre x²=0; it fails the reduced-fibre specification.” Replace :363 and :967 by the explicit EL control: “Let K/F be ramified quadratic, p odd, V=K², and quotient multiplicities (2,0), with reflex field K. On the special fibre write A=k[ε]/ε². The quotients A²→A, (u,v)↦u+cv, c∈k, are distinct rank-two k-quotients satisfying every determinant condition: multiplication by a₀+a₁ε has characteristic polynomial (T−a₀)². They form an A¹-family, whereas the generic quotient locus is one point. Thus this projective naive model is not flat and is larger than its flat closure.” The calculations exhibit the required nilpotent special fibre and vertical excess, rather than restating the definitions.

## Verified sound

Read all 1,220 README lines and all 52 Suggested.lean lines, together with the repository README and CONTRIBUTING rules. The audit inventory is **0 Lean declarations**, **60 numbered target sections**, **4 bold worked examples**, **84 subsidiary API assertions**, **92 labelled Checks**, **149 distinct source-line locators across 21 works**, **42 declared gaps**, **11 roadmap supplier subsections**, and **8 explicitly cited pinned declarations**. The sampled table below records computations, including failed controls; these counts do not mean every assertion passed.

Suggested.lean contains no section variables, instances, definitions, theorems, admitted examples or padding. Its 15 grouped headline entries name the missing geometric carriers. The native scheme and tangent types do not construct those moduli spaces. In particular, the quotient-rank `Module.Grassmannian` is not a represented Grassmannian scheme. The elementary trace-pairing argument is supporting algebra, not an omitted geometric headline. No duplicate fully qualified name can arise from this empty namespace.

The eight library citations resolve at Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The finite-dimensional and separable hypotheses of `traceForm_nondegenerate` are present in the intended application; the zero-ring rank convention is expressly acknowledged. The polynomial/v-model distinction, inverse-cocharacter lattice calculation, subspace/quotient ranks, node incidence equation, curve-span obstruction, prime-to-p central-kernel restriction, and negative half-Tate exponent survive the recorded tests.

The 42 gap slugs occur in both README and plan.json, with named suppliers; neither set has an extra slug. Their present nonimplementation is not a finding. R02 concerns an independent pair of assertions grouped into one contract; R04 concerns missing hypotheses in a contract. No other absence of a declared contract is counted as an ownership defect.

The read-only diff against origin/main contains changes only under packages/GeometricSatakeAndFusionPartII. No source file was changed during this pass. No computational algorithm, `set_option`, `lemma`, sorry'd data, process narrative or pull-request number was found in README or Suggested.lean.

Dependency checker output for the unedited package:

```text
depcheck: 56 roadmaps, 650 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This does not check the within-roadmap forward references in R03. Findings previously marked outside this package, including the parent's independent Gelfand/metaplectic direction and placement of supplier continuations, are not re-raised.

### Supplier resolution and ownership

All supplier families below were resolved to the main copy or current available new-roadmap head/design, not to remembered section numbers. The three semisimple-trace resolver leads are target names in the cited LPV section, not claims that those names are pinned library declarations. RootSystemsPartII and DiamondsAndVStacksPartII are available board designs; their absence from the resolver's main/open index is not a missing supplier.

| Supplier | Current target resolved and boundary checked |
|---|---|
| ModularCurves | §0G represented relative Grassmannians; quotient rank h−d versus d is retained |
| SchemeAndStackFoundations | §§0.8, 0.17–0.21, 0.26, 0.28, 0.30, 1.1, 4.6–4.14; characteristic-p weak normalization does not silently supply mixed characteristic |
| ReductiveGroupsPartII | RG2.0a–RG2.4 integral restriction, roots, buildings, parahorics, jets and admissible order; integral Weyl modules require the additional owner in R05 |
| RootSystemsPartII | packages/RootSystemsPartII/design/README.md:472, :501, :519, :526: RS2.4 existential orbit step, central directions and coinvariant lift |
| GeometricSatakeAndFusion | GS0 generic bounds, algebraic comparison prefix, Witt flags, integral ind-properness, bounded admissible loci and flag correspondences; bounded nearby-cycle comparison is distinct from the declared central convolution extension |
| DiamondsAndVStacksPartII | packages/DiamondsAndVStacksPartII/design/README.md:1243, :1259, :1754, :1790: D10.12–D10.13 and D11.18–D11.20; finite-type, properness and normalization hypotheses retained |
| PELModuli | M0 basic data; ramified data is explicitly a gap, not an asserted good-reduction theorem |
| EtaleDualityAndPerverseSheaves | Perverse/IC inputs; local-model modular perversity is separately declared |
| LefschetzPencilsAndVanishingCycles | LPV.1 §1.10 semisimple trace and its additivity/refinement; semisimple proper pushforward remains a separate gap |
| ClassicalAdicEtaleCohomology | Classical nearby-cycle comparison, retaining algebraicity and properness conditions |
| SmoothRepresentationsOfLocalGroups | SR.3.2 and SR.4.1; general parahoric-centre extensions are declared rather than substituted by an Iwahori-only theorem |

Object searches used the roadmap index tools and the supplied main, Completed, board-package and sibling-head trees. Hits in GlobalShtukasAndFunctionFieldLanglands concern global equal-characteristic shtukas; those in LocalGaloisDeformationRings concern its particular maximal-parahoric deformation model. They do not own the general minuscule p-adic scheme theorem here. The general Weyl-module object already has the main owner identified in R05. Other open revisions of existing roadmaps were not substituted for their main versions. No additional ownership collision was established from the inspected hits.

### Sampled adversarial instances

The 31 rows below retain computed controls across conventions, target layers and all four bold worked examples. The exhaustive per-target, gap, Check and API ledgers are omitted from this comment-length report. A concrete calculation tests the asserted formula; it does not certify a general theorem. No Lean execution was performed.

| Suggested.lean declaration | Context and instances | Values | Result |
|---|---|---|---|
| None | File has one import, one module docstring, and an empty namespace; no variables, instances, definitions or theorems | declaration count = 0; sorry count = 0 | No elaborated signatures to compare; no padding |

| README target | Instances tried and computed values on the two sides | Result / change |
|---|---|---|
| Conventions: dominance | PGL₂: coroot lattice 2ℤ; μ−λ=2 lies in 2ℕ, but 1 does not, despite 1≥0 in ℝ | Integral component restriction essential |
| Conventions: translations | diag(t,t⁻¹): cocharacter (1,−1); apartment displacement (−1,1); determinant valuation 0 | Signs consistent |
| Conventions: ranks | h=3,d=1: subspace dimension 1, Mathlib quotient rank 2, SW quotient rank 1 and kernel rank 2; h=d=0 gives 0 throughout | Opposite conventions explicitly distinguished |
| Conventions: Cartan | With u=((1,0),(1,1)), uEu⁻¹=((-1,1),(-1,1))=E−H−F; in characteristic 2 the same equality becomes E+H+F | Printed source sign corrected |
| Conventions: Frobenius | q=9,d=1: eigenvalue 1/3 and degree −1 give τ=−1/3; (−1)^d q^(−d/2)φ=−1/3 for φ=1; d=0 gives 1=1 | Sign and Tate factor consistent |
| Conventions: fields/ranks | Finite residue field has q≥2; q=1 and zero coefficient field excluded; zero vector space has dual 0 and its zero pairing induces 0≃0 | No zero denominator; zero symplectic space allowed |
| 0.5 Scheme specification | P¹_O special fibre has one component; blowing up a special closed point produces two; exceptional points e≠e′ map to the same point | Reduced fibre alone does not characterize model; marked v-isomorphism excludes blowup |
| 1.2 Schematic closure | GL₂ μ=(2,0): affine Schubert dimension 2 versus finite flag dimension 1; μ=0: closure Spec O_E | Correct general-bound definition |
| 1.3 Normality | GL₂ Iwahori μ=(1,0): special node k[x,y]/xy has two normal components, dimension=depth=1, whole local ring nonnormal; μ=(2,0) generic dimension 2 | Components/whole fibre distinguished; generic flag proof input requires R06 |
| 2.2 Weyl lattice | Standard SL₂ lattice is ℤ_p²; two equal copies have centralizer GL₂ on multiplicities, not merely scalars; torus weights (0,2,1) admit nonsplit point-stable ℤ₃ lattice | R04 distinguishes group-scheme stability |
| 2.6 GL incidence | Lattice maps diag(1,π),diag(π,1) both give πad−bc=0; π=0 gives bc=0; at a=d=1 cotangent has basis b,c and tangent dimension 2 | Closed incidence and reduced special fibre agree |
| 2.8 Trace pairing | K=F, one standard plane: Ψ(e₁,e₂)=1; zero sum gives 0≃0; inseparable degree p extension has trace 0 and degenerate nonzero plane; over Q₂ two multipliers 1,2 are nonzero and disagree | Separability and common multiplier essential |
| 3.4 Special fibres | GL₂ μ=(1,0): first congruence acts trivially on lines modulo p; μ=(2,0): (1+pE₁₂)e₂=e₂+pe₁∉p²We₁⊕We₂ | R01: general bound is not depth zero |
| 4.1 Curve span | A¹: derivative of a↦a is 1, span dimension 1; dual numbers: every map to k[[a]] kills ε, span 0 while tangent dimension 1; node xy=0: axis derivatives span 2, (1,1) not derivative | Three discriminating checks; set of derivatives differs from span |
| 4.2 Tangent obstruction | x(x+yz)=0: domain forces f=0 or f=−gh, hence linear x coefficient 0; y,z axes span dimension 2 while tangent dimension 3 | Correct reduced, nonnormal counterexample |
| 4.4 Minuscule tests | B₃ μ=2e₁,ν=e₁+e₂: spin difference 0, other fundamental pairings 1,0; μ=e₁,ν=0 differ by odd coordinate sum and leave coroot lattice | Spin test alone insufficient; integral component test retained |
| 4.6 FM bounds | Standard SL₂ t^μ lattice diag(t,t⁻¹): tL⊂L₀ and L₀⊂t⁻¹L; replacing μ by 2μ violates first containment against μ-bound; μ=0 forces L=L₀ | Two bounds needed; R05 supplies actual modules |
| 4.9 Cartan upper bound | SL₂ λ=0,μ=α∨ gives min(1,1)=1; λ=μ gives min(0,2)=0; Dᴴ coefficient −2m with m=1 is 1 mod3, 0 mod2 | p≠2 restriction excludes failed coefficient |
| 5.1 Orbit step | A₂ reversal: distinct orbit α₁+α₂ once; D₄ orbit of α₁+α₂ has coefficients (1,3,1,1), exceeding θ=(1,2,1,1); θ itself reaches μ | Existential supplier avoids invalid orbit addition |
| 6.3 Quotient model | h=3,d=1 gives quotient rank1 and kernel rank2; scalar a acts with characteristic polynomial T−a on quotient versus (T−a)² on wrong kernel | Determinant convention discriminates |
| 6.4 de Rham kernel | Projection B_dR⁺³→C on first coordinate: kernel ξB_dR⁺e₁⊕B_dR⁺e₂⊕B_dR⁺e₃; determinant ideal (ξ); uξ yields same ideal | Weight and dual determinant line consistent |
| 6.6 Unitary Drinfeld | Signature (1,1) yields actual GL₂ cocharacter (1,0), flag dimension1; erroneous central (1,1) gives dimension0; ramified base node xy=ϖ² has dimension2, embedding dimension3 | Nonregular normal base change is allowed; the P¹ identification is geometric (R09) |
| 7.3 S₂ | Node k[x,y]/xy: dimension1, depth1; component graph has 2 vertices and 1 edge; point dimension0 and depth0 satisfies S₂ | General connectedness contract requires all geometric strict local points |
| 7.6 Normal model | Ramified node xy=ϖ²: normal surface dimension2, special fibre xy=0 reduced; normal DVR extension O[t]/(t²−π) has special t²=0 nonreduced | R07: reducedness needs a scheme-level relatively smooth open |
| 7.7 Wild embedding | Cusp normalization is finite universal homeomorphism but not closed because t absent; finite module cokernel C with C/πC=0 has C=0 by Nakayama | Wild deperfected closedness explicitly declared, not inferred from perfection |
| 8.2 Semisimple trace | q=9 block graded eigenvalues (1/9,1): semisimple trace10/9; raw invariants trace1/9 | Difference1 refutes invariants substitute |
| 8.4 Satake/Bernstein | q=9,d=1: z spherical value1/3 and q^(d/2)z=1=φ; τ=−1/3; trivial V has character1 | Positive exponent belongs to φ=q^(d/2)z, not Tate twist |
| Bold two-lattice example | Matrices diag(1,π),diag(π,1) each give πad−bc; π=0 gives bc=0; intersection ([1:0],[0:1]); local equation bc=π | Both chain relations identical; total node regular |
| Bold reduced-surface example | Minimal primes (x),(x+yz); formal derivatives have x coefficient0; tangent dimensions full3, span2 | Statement correct, source normality claim false |
| Bold orbit-budget example | Three triality roots sum (1,3,1,1), budget (1,2,1,1); invariant highest root uses exact budget | Arbitrary orbit sum excluded |
| Bold trace example | q9: −1·(1/3)=−1/3, not−3; Bernstein1/3 times3=1 | Source positive Tate exponent corrected |

## Not verifiable

- Lean execution was prohibited. No elaboration or build was run. There are zero declarations for a scratch `#check @name` comparison; the worker's unsuccessful signature extraction supplies no evidence and was not treated as one.
- The geometric headlines depend on the declared, presently unimplemented supplier contracts. Acceptance of their future availability is conditional; this report does not certify completed formal proofs of those contracts.
- The 149 source-line anchors and their theorem neighborhoods were read in the supplied legal versions. This is not a verification of every proof in all 21 works, nor of alternative published numbering where the README explicitly uses a preprint version. No cited text required a new missing-reference request.
- Ownership searches covered the supplied sibling checkouts, main/Completed, board packages and the roadmap index. They do not certify unlisted or inaccessible private work. The recorded computations test concrete cases; they do not replace proofs of the general statements.

## Source issues

- **Misprint** in KPZ at §3.3.1, p. 20 (KPZ line 904): the source says H and G have integral models over O_F and O_K respectively; it should be O_K and O_F respectively; affects nothing.
- **Error** in KPZ at Remark 4.1.5(2), p. 31 (KPZ line 1354): the source says the surface x(x+yz)=0 is normal; it should be reduced and nonnormal at the origin, with two components; affects a stated result.
- **Misprint** in KPZ at Remark 4.1.5(2), p. 31 (KPZ line 1354): the source says its polynomial ring has variables x,y,x; it should be x,y,z; affects nothing.
- **Misprint** in KPZ at §4.1.7, p. 32 (KPZ line 1378): the source says negative-loop evaluation sends t to zero; it should be evaluation of t⁻¹ at zero; affects a stated result.
- **Error** in KPZ at Remark 4.2.8(3), p. 34 (KPZ line 1497): the source says ordinary duality replaces a Weyl module by the oppositely indexed Weyl module in arbitrary characteristic; it should be the corresponding induced module, retaining both FM bounds; affects the proof.
- **Misprint** in KPZ at §4.2.15, p. 37 (KPZ line 1614): the source says the B_n weight lattice is Zⁿ in the displayed coordinates; it should be Zⁿ+Z(1/2,…,1/2); affects the proof.
- **Misprint** in KPZ at §4.2.15, pp. 37–38 (KPZ line 1622 and KPZ line 1665): the source says the partial sums defining fundamental weights repeatedly add e_i; it should be sums of e_j over the displayed index j; affects the proof.
- **Misprint** in KPZ at §4.2.15, p. 38 (KPZ line 1661): the source says the final D_n root is e_(n−1)+e_(n−1); it should be e_(n−1)+e_n; affects the proof.
- **Misprint** in KPZ at §4.2.15, p. 38 (KPZ line 1675): the source says the sum indexed by j repeatedly uses ν_i; it should be ν_j; affects the proof.
- **Misprint** in KPZ at §4.2.15, p. 39 (KPZ line 1685): the source says q=s−t gives last coordinate q/2 for sω_(n−1)∨+tω_n∨; it should be q=t−s under the displayed spin-weight convention; affects the proof.
- **Misprint** in KPZ at §4.3.1, p. 40 (KPZ line 1743): the source says lower-root conjugation gives E+H+F for its sl₂ triple; it should be E−H−F with the displayed standard root coordinates; affects the proof.
- **Misprint** in KPZ at Proposition 4.3.9, p. 43 (KPZ line 1895): the source says the first choice of detecting weight includes j=n, also covered by the second choice; it should be j=1,…,n−1 in the first case; affects the proof.
- **Misprint** in KPZ at Proposition 4.3.10, p. 43 (KPZ line 1903): the source says both summands of the Dᴴ bound use ω_(n−1); it should be sω_(n−1)∨+tω_n∨ with the coordinate sign corrected consistently; affects the proof.
- **Gap** in KPZ at Proposition 4.3.10, Case (2), p. 45 (KPZ line 1968): the source says −2m is nonzero without excluding characteristic two; it should be restricted to odd characteristic or supplied with a different detecting argument at two; affects the proof.
- **Misprint** in KPZ at §4.3.13, p. 45 (KPZ line 1977): the source says the induction subtracts m_βt⁻ˡH_α from H; it should be H−m_αH_α before applying the common factor t⁻ˡ; affects the proof.
- **Misprint** in KP at §2.3.4, p. 157 (KP line 1524): the source says z=s(y); it should be y=s(z), with s directed from the symplectic building to the linear building; affects the proof.
- **Misprint** in KP at §2.3.15, p. 162 (KP line 1765): the source says the symplectic Hodge subbundle has full ambient rank; it should be half the ambient rank; affects a stated result.
- **Error** in LEV at the introduction and proof of Theorem 4.2.7, p. 25 (LEV line 1022 and LEV line 1030): the source says the entire admissible special fibre is normal; it should be reduced with normal irreducible components, while the total local model is normal; affects the proof.
- **Misprint** in GORSP at §2, p. 4 (GORSP line 115): the source says Λ_i* equals πΛ_(2r−1) for every indicated i; it should be πΛ_(2r−i); affects a stated result.
- **Gap** in KZ at the proof of Proposition 5.2.3, pp. 49–50 (KZ line 2197): the source says individually admissible conjugate coroot increments may all be added; it should justify a joint dominance budget or choose an admissible invariant increment existentially; affects the proof.
- **Misprint** in KZ at Lemma 5.2.5, p. 52 (KZ line 2317): the source says the translation lift belongs to the positive loop group; it should belong to the Laurent loop group, with its conjugator in the positive loop group; affects the proof.
- **Gap** in KZ at Lemma 3.1.10, p. 20 (KZ line 912): the source says FHLR Lemma 5.27 supplies a closed immersion; it should add an argument proving surjectivity on structure sheaves beyond the finite universal homeomorphism onto the image; affects the proof.
- **Error** in SW at Remark 21.4.2, p. 195 (SW line 7494): the source says flatness and reduced special fibre alone imply normality; it should also require normal generic fibre, as the local-model application has; affects a stated result.
- **Misprint** in SW at §21.8, p. 205 (SW line 7856): the source says the adjointness condition for the F₀-valued pairing only quantifies a∈F₀; it should quantify a∈F and use the F₀-valued pairing on both sides; affects nothing.
- **Misprint** in SW at §21.8, p. 205 (SW line 7867): the source says the split and nonsplit forms under discussion are alternating; it should say Hermitian; affects nothing.
- **Error** in SW at §21.8, p. 206 (SW line 7901): the source says the GL₂ cocharacter components are (1,1) and (0,0)/(2,2); it should use weights (1,0) at the distinguished embeddings and (0,0)/(1,1) elsewhere; affects a stated result.
- **Misprint** in PZ at §9.d.3(a), p. 76 (PZ line 3127): the source says the normalized smooth minuscule trace has factor q^〈ρ,μ〉; it should have q^(−〈ρ,μ〉), as required by its half-Tate twist; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "60448fceeff185148191a0b26e42bb3b3f438447", "job": "RT-GeometricSatakeAndFusionPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
