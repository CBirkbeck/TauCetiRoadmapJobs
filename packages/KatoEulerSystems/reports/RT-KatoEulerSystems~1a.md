<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/163#issuecomment-6429713288 -->
Red team round 1 pass a (codex) of 0ff66a0

Verdict: needs_changes

1. **F01** (P2) The torsion evaluation uses fractional coordinates on a torsion basis

   Location: `packages/KatoEulerSystems/README.md:442`, “along `αe₁ + βe₂`”.

   Claim: the index `(α,β) ∈ ((1/N)ℤ/ℤ)²` defines that section of the universal elliptic curve.

   Witness: Kato2004 line 243–247 writes `α=a/N`, `β=b/N` and evaluates at `ae₁+be₂`. For `α=1/N`, multiplication of the order-N basis vector by `1/N` is not defined.

   Exact repair: “Write `α=a/N`, `β=b/N` with `a,b ∈ ℤ/N`; evaluate the theta unit along `ae₁+be₂`.” For `(1/N,0)` this gives exactly `e₁`, independent of representatives, since `Ne₁=Ne₂=0`.

2. **F02** (P3) The adapter Check evaluates a component outside its domain

   Location: `packages/KatoEulerSystems/README.md:766`, “At `m = 1` the component”.

   Claim: the adapter defined in §2.1 has a component at `m=1`.

   Witness: the domain at line 716 requires `prime(m) ∩ Σ = {p}`. At `m=1` the left side is `∅`, not `{p}`.

   Exact repair: “At `m=p`, the first admitted component is the projected geometric class over `ℚ(ζ_p)`; its next p-power transition has identity factor. Define the class over ℚ separately by corestriction from this component when it is used in §6.6.” The domain test becomes `{p}∩Σ={p}`. If the intended carrier instead includes `m=1`, change the domain and state/prove the additional conductor transitions explicitly.

3. **F03** (P3) The claimed distinction between Λ-span and Λ[1/p]-span is false

   Location: `packages/KatoEulerSystems/README.md:1617`, “which a Λ-span of the values need not contain”.

   Claim: the Λ-span of all values of the E-linear map may omit `p⁻¹x`.

   Witness: if `x=z(γ)`, E-linearity gives `p⁻¹x=z(p⁻¹γ)`, already another value. Thus both spans of all values coincide, even for the identity map `E→E`.

   Exact repair: “For a lattice `T ⊂ V_E(f)`, distinguish the Λ-span of `z(T)` from the Λ[1/p]-span of `z(V_E(f))`: for the identity on E and `T=O`, they are O and E.” Both the example and the integral comparison now use restricted lattice inputs.

4. **F04** (P1) Transfer of a unit class is not always its determinant norm

   Location: `packages/KatoEulerSystems/README.md:633`, “`f_*{s, r} = {N_(S/R)(s), r}`”.

   Claim: this identity holds for every finite projective extension of commutative rings.

   Witness: Weibel2013 line 295–315 gives nonzero rotation class `[A]∈SK₁(B)` for `B=ℝ[x,y]/(x²+y²−1)`. Put `R=B[t,t⁻¹]`, `S=R[i]`, `s=x+iy`, `r=t`: the two Laurent boundaries are `−[A]≠0` and `0`.

   The extension is free of rank two and étale; multiplication by s is `A=[[x,−y],[y,x]]`, with determinant 1. Normalize the Laurent boundary by `∂([t]·x)=x`; graded commutativity then gives `∂(x·[t])=−x` for `x∈K₁`. Transfer compatibility with that boundary gives `∂f_*{s,t}=−[A]`; the claimed right side is `{1,t}=0`. This is a counterexample even among regular rings, not an issue confined to nonreduced bases. Weibel's Exercise III.5.6 repeats the excessive norm claim; Corollary III.1.7.1 constructs transfer but identifies it with the classical norm only for fields (Weibel2013 line 395–412).

   Exact repair: “For finite projective `R→S`, use the product projection formula `f_*([s]·f^*[r])=f_*[s]·[r]`. Replacing `f_*[s]` by `[N(s)]` requires a proved equality in `K₁(R)`, not merely equality after determinant. For the modular-unit transfers, state and prove the required equality for those specific unit classes, or retain the full transferred `K₁` class throughout the K₂ argument.” Import the general product projection formula from `SchemeKTheoryOperations` §2.4 rather than re-plan it. On the example the repaired formula has boundary `−[A]` on both sides and makes no false norm replacement.

5. **F05** (P1) The crystalline regulator supplier has a restricted, different comparison

   Location: `packages/KatoEulerSystems/README.md:367` and `:1853`, “its extension to all of weight space for crystalline modules” and “namely that of … §9.35 (all p)”.

   Claim: `PadicHodgeRegulators` §9.35 supplies the unrestricted global crystalline regulator used here.

   Witness: `TauCetiRoadmap/PadicHodgeRegulators/README.md:2648–2670` requires `(1−φ)z∈(ℛ⁺)^(ψ=0)⊗D_cris`, extends `𝔐_z`, and gives `Λ_(D,z)(θ)=φ^(−n)𝔐_z(θ)`. Its rank-one Check gives `2^(−n)d` versus the constant `d`.

   Exact repair: “From §9.35 import only the global distribution `𝔐_z` on its stated range and the conductor-stratum identity `Λ_(D,z)(θ)=φ^(−n)𝔐_z(θ)`. Target 6.1 constructs Kato's map by the dual big exponential, including the all-prime crystalline case, and separately proves its comparison with `𝔐_z` with the twists, range and Frobenius factors explicit.” At `p=5`, `φ(d)=2d`, the corrected supplier contract retains `2^(−n)d` and does not identify it with `d`.

6. **F06** (P1) Conductor components are identified with field components without the correction factors

   Location: `packages/KatoEulerSystems/README.md:717–739`, “whose class at `ℚ(ζ_m)` is the projection”.

   Claim: the raw conductor-indexed modular class is the evaluation of a field-indexed Euler system at every admitted m.

   Witness: `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:1658` inserts Euler factors for conductor primes unramified in the actual field. For odd m, `ℚ(ζ_2m)=ℚ(ζ_m)`; field evaluation is identical, whereas the conductor relation inserts `P₂`.

   For example, at weight two, level 11, `a₂=−2`, p=3 and c=5,d=7, both m=3ⁿ and 2·3ⁿ are admitted. The asserted identification would imply `(P₂(σ₂⁻¹)−1)c_m=0`, with `P₂(X)−1=X(1+X/2)`. This is invertible on every characteristic-zero finite cyclotomic character component: its possible nonzero root is −2, not a root of unity. Thus it forces all these classes to vanish. The nonzero conductor classes used to construct the canonical map cannot satisfy that identification. The simpler source control is Kato2004 line 4197–4206: the cyclotomic classes at conductors 3 and 6 have respective unit values 3 and 1 in the same field.

   Exact repair: “First form the conductor-indexed family of §2.4 of EulerSystemsAndKolyvaginSystems. Transport it through that section's conductor-to-field equivalence, including its Euler factors at primes unramified in the resulting field, and the cofinal corestrictions to all finite subfields. The raw modular class is the conductor component, not generally the field evaluation.” On the m,2m test, the two field evaluations agree and the two conductor components differ by exactly `P₂`, as required.

7. **F07** (P1) The imported theta unit requires c invertible on the base

   Location: `packages/KatoEulerSystems/README.md:439–444`, “an integral unit on the open curve because that section avoids `E[c]`”.

   Claim: the cited theta construction already supplies this unit over `ℤ[1/N]` for every allowed c.

   Witness: `TauCetiRoadmap/PadicFamilies/README.md:2355` constructs thetaUnit only with c invertible. For N=7,c=5, the base `ℤ[1/7]` does not invert 5. Avoiding the divisor does not supply the missing theta function.

   Exact repair: “In §0.1 initially evaluate the supplied theta unit over `ℤ[1/Nc]` and form the rationalized identities over ℚ. Target §0.3 proves extension of each smoothed unit to `ℤ[1/N]`; no integral evaluation at a noninvertible c is imported from PadicFamilies.” Move the integral conclusion of §0.1 after that descent. On N=7,c=5, the imported function is used only over `ℤ[1/35]`, and the characteristic-five extension becomes an explicit obligation of §0.3. Alternatively declare the precise general-base theta extension as a supplier gap in both required places.

8. **F08** (P2) The analytic product loses a phase needed for equality of integral smoothed units

   Location: `packages/KatoEulerSystems/README.md:534–537`, “agreement of the smoothed product with the algebraic c-unit”.

   Claim: smoothing the displayed phase-free product recovers the actual algebraic c-unit.

   Witness: Kato2004 line 231 and line 362 include `(-t)^((c−c²)/2)` in theta. At `(α,β)=(0,1/7)`, c=5, the algebraic unit divided by the displayed smoothed product is `ζ₇^(−10)=ζ₇⁴≠1`.

   Exact repair: “The displayed product represents the rationalized Siegel unit. Equality after smoothing holds in the tensor product with ℚ. For an equality of actual analytic units, include the phase from the normalized theta expansion before evaluation and reduction of torsion indices.” Add the N=7,c=5 example as a Check: the missing phase is `ζ₇⁴`, which becomes zero in additive rationalized units but is not one as an analytic function. Cusp exponents remain unchanged.

9. **F09** (P1) The conductor-n canonical map used in the twist-one definition has no construction target

   Location: `packages/KatoEulerSystems/README.md:1687–1690`, “`z_n = φ_k ∘ z^Ka_n(f*) ∘ φ_(1−k)`”.

   Claim: §§5.1 and 5.3 supply the middle map at every n prime to Σ_f.

   Witness: §5.1 only constructs the conductor-one map into cyclotomic Iwasawa cohomology over ℚ. Nakamura2023 line 3768–3795 separately constructs the n-level map, divides by μ_n, and proves membership before defining the twist-one map.

   Exact repair: “Before §5.4, construct `z^Ka_n(f):V_E(f)→H¹_Iw(ℤ[1/Σ_(f,n),ζ_n],V_E(f))` for every n prime to Σ_f. State its μ_n smoothing formula, auxiliary independence, denominator removal, interpolation and conductor transition laws; recover §5.1 at n=1. Then define the twist-one map over the same conductor-n base.” Carry precisely the admissibility hypotheses used for injectivity and denominator removal. At n=5 the codomain is over `ℚ(ζ₅)`, rather than the conductor-one codomain; twisting coefficients alone never changes that base field.

10. **F10** (P1) Full-level uniqueness uses a zeta operator and Betti class that §3.4 does not define

   Location: `packages/KatoEulerSystems/README.md:1772` and `:1796`, “`Z_(Σ,np^m)(k−1)`” and “`3.4 (operator-valued zeta)`”.

   Claim: §3.4 provides the operator and smoothed coefficient-valued Betti vector in the characterization.

   Witness: §3.4 acts on constant-coefficient `H¹(Y(M,N),ℂ)`. Nakamura2023 line 1782–1811 defines the different operator on `H¹(Y(N),V_k)⊗ℂ[Gal(ℚ(ζ_n)/ℚ)]`; line 1856–1890 separately constructs δ_N(k,−) and its smoothing.

   Exact repair: “Extend §3.4 with named construction targets for `Z_(Σ,n)(s)` on the weight-k coefficient cohomology tensored with the conductor-n group ring, its meromorphic continuation and trace compatibility, and for `c-δ_(N,n)(k,v)` obtained from the coefficient-valued relative path by duality and the two smoothing operators. State their source and target and cite Nakamura §3.1.5, pp. 40–43.” At k=4,n=5, the coefficient fiber has rank three and the conductor group ring rank four; neither can be replaced by the rank-one constant coefficient system in the present §3.4. At k=2,n=1 the added construction recovers the existing specialization.

11. **F11** (P3) Three identity-map Checks do not test the constructed maps

   Location: `packages/KatoEulerSystems/README.md:853`, `:1718`, `:1912`, “identity Chern map”, “all three maps the identity on ℚ”, and “identity regulator … on ℚ”.

   Claim: these computations exclude zero full-level moments, twist-one morphisms and scalar regulators.

   Witness: replace each actual geometric construction by zero while keeping the unrelated toy identity `ℚ→ℚ`. Every stated computation still gives `1=1`. No Chern map or regulator in the roadmap has the asserted identity source and target.

   Exact repair: “Delete these three toy identity Checks. For each constructed map, add a Check on its actual source and target: choose an actual literal-dual input and an eigenform projection whose coefficient-valued path period is nonzero, together with a nonzero edge critical value, compute its image using the stated reciprocity formula, and check the resulting nonzero period or distribution evaluation. For the twist-one map, retain both actual Tate twists and the conductor base.” The nonzero check is `C·L·γ^±≠0` with each factor explicitly chosen nonzero; the zero construction gives 0 and fails. Keep the other sign, coefficient-extension and conductor Checks, and ensure three discriminating Checks remain for each definition.

12. **F12** (P2) Serre's open-image headline is statable at the pins but absent

   Location: `packages/KatoEulerSystems/README.md:1509` and `packages/KatoEulerSystems/Suggested.lean:14–26`.

   Claim: the Lean acceptance test includes every statable headline and identifies the unavailable ones. The deep theorem `serre_openImage` of §4.7 is neither stated nor identified as unavailable.

   Witness: `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean:71` defines the actual representation; `Isogeny/Basic.lean:139` and `Isogeny/MulByInt/MapsInfinity.lean:103` supply geometric self-isogenies and multiplication isogenies. `Mathlib/RepresentationTheory/Basic.lean:512` gives its group homomorphism.

   Exact repair: “State the §4.7 open-image theorem in Suggested.lean on `W.tateModuleGaloisRepresentation`, including surjectivity for all but finitely many primes. Define non-CM by the simple native-carrier predicate that every self-isogeny of W over `AlgebraicClosure ℚ` is multiplication by a nonzero integer, using `TauCeti.Isogeny` and `mulByIntIsogeny`. Express the first conclusion as finite index of the range in the automorphism group of the Tate module; for this continuous compact image it is equivalent to openness.” This needs only those individual Tau Ceti imports and a genuine predicate on existing isogenies, not a replacement representation. At the CM negative control `y²=x³−x`, `(x,y)↦(−x,iy)` is not `[±1]` (the only degree-one integer multiplications), so the predicate correctly fails. Primes 2 and 3 remain in the first conclusion. No elaboration was run in this read-only pass.

13. **F13** (P2) The finite-coefficient twisting target is already supplied

   Location: `packages/KatoEulerSystems/README.md:1471–1483`, “Prove … twist_specialize”.

   Claim: the diagonal finite-coefficient construction and specialization formula are new targets here.

   Witness: `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:1477–1494`, §3.7, already specifies the same diagonal cup product, coefficient-reduction/corestriction compatibility, inverse twist, and the `κ(γ)=4` normalization Check.

   Exact repair: “Import the finite-coefficient specialization description and its diagonal-limit compatibility from SelmerIwasawaCohomology §3.7. Retain only the global-to-semilocal localization compatibility needed here as a target, if that naturality is not already among the supplier's maps.” At p=3,j=1 both imported and consumed twists multiply the Γ-action by `1/4`, and reduction sends `ζ₉` to `ζ₃`; no second construction is needed. Move the repeated construction/proof into the supplier contract and keep its application Checks in the README.

14. **F14** (P2) Full-level zeta is called Hecke linear without a Hecke module source

   Location: `packages/KatoEulerSystems/README.md:828`, “It is Hecke linear before any f-quotient”.

   Claim: `fullLevelZeta : Sym^(k−2)(ℤ_p²)^* → H¹_Iw(… )` is a Hecke-linear map.

   Witness: the source is only a literal-dual coefficient representation; no Hecke action is specified. At k=2 it is rank one. A vector with nonzero components of distinct Hecke eigenvalues cannot be the image of a Hecke eigenline.

   Exact repair: “The map is ℤ_p-linear in the literal-dual input. Its conductor relation is an identity in the full cohomology with the stated Hecke operators acting on the target, before projection to an eigenform quotient.” Remove “Hecke linear” from this target's title and associated scope claims. The test `(a,b)↦(λa,μb)` with `a,b≠0` and `λ≠μ` then requires no impossible scalar Hecke action on the rank-one source; the displayed conductor relation remains meaningful. If a Hecke-linear morphism is intended, it needs a different, explicitly supplied Hecke-module source.

15. **F15** (P2) The ramification sets are not required to be finite

   Location: `packages/KatoEulerSystems/README.md:714–716` and `:1312`, “Let Σ contain” and “`Σ ⊇ {p, ∞}`”.

   Claim: the conductor adapter and the finite-S Poitou–Tate proof accept any such Σ.

   Witness: Σ equal to all rational primes satisfies §2.1's written conditions, but no nonzero modulus N in the supplier's §2.2 has all those prime divisors. Kato2004 line 4180 explicitly requires a finite set.

   Exact repair: “In §2.1 let Σ be a finite set of rational primes containing the listed primes. In §4.2a let Σ be a finite set of places containing p, infinity and every ramified place.” Retain that finite-set parameter in all maps and limits. The all-primes instance is then excluded, while the union of the finitely many specified ramification and auxiliary primes remains admitted. In particular the local error comparison is a finite sum of finite groups, as the proof requires.

16. **F16** (P3) Several unavailable headlines are omitted from the module docstring

   Location: `packages/KatoEulerSystems/Suggested.lean:14–26`; compare `packages/KatoEulerSystems/README.md:1099`, `:1393`, `:1623`, `:1653`, `:1822`.

   Claim: the module docstring identifies the remaining headline theorems and their missing carriers.

   Witness: it does not name the real-regulator formula (§3.4), Iwasawa structure (§4.4), finite-index theorem (§5.2), critical interpolation (§5.3), or Perrin-Riou construction (§6.1), although these are separate deep targets in the README.

   Exact repair: “The real-regulator formula (§3.4) lacks the modular-curve K₂ class and its regulator; the structure, finite-index and critical-interpolation theorems (§§4.4, 5.2–5.3) lack modular Iwasawa cohomology and zeta classes; the de Rham Perrin-Riou construction (§6.1) lacks the period-ring realization and big-exponential carriers.” Add this to the module docstring. Do not insert toy theorems in their place. The k=4,n=5 missing-coefficient example of R10 remains explicitly unavailable rather than being replaced by a scalar identity.

17. **F17** (P2) The general curve regulator already has an earlier owner

   Location: `packages/KatoEulerSystems/README.md:1120–1126`, “Define realRegulatorUnits”.

   Claim: this roadmap constructs the generic eta regulator on a smooth complex curve and its descent through K₂ and tame symbols.

   Witness: `TauCetiRoadmap/Polylogarithms/README.md:1240–1264`, §5.13, already constructs curveEtaRegulator, its tame-symbol descent and Beilinson comparison. Its convention gives `η(2,z)=log(2)dθ`; this package's form is exactly `iη`.

   Exact repair: “Import the curve eta regulator and its K₂/Beilinson comparison from Polylogarithms §5.13, with the rational Chern and product conventions stated there. For the smooth open modular curve, restrict the curve construction to the complement of the cusps and compose its real de Rham class with multiplication by i and the de Rham–Betti comparison. Retain here the modular formula for the Beilinson element and operator-valued zeta derivative.” Add that earlier supplier to the contracts and Needs. On `(2,z)` over ℂ×, the imported real circle integral is `2π log 2`, and the specified comparison gives `2πi log 2`, exactly this package's Check. Polylogarithms precedes KatoEulerSystems in the supplied order.

18. **F18** (P3) The auxiliary-independence Check repeats the target

   Location: `packages/KatoEulerSystems/README.md:479–480`, “this is the auxiliary independence itself”.

   Claim: the displayed generic relation counts as a discriminating Check of the definition.

   Witness: substituting the target smoothing law gives `48·24g=24·48g` for every g, including g=0. The Check contains no actual unit, cusp or evaluation and explicitly restates the target.

   Exact repair: “At torsion index `(1/2,0)` on level four, the q-exponent of the rational unit is `−1/24`. The c=5 and c=7 units have q-exponents −1 and −2, respectively; dividing these by 24 and 48 gives `−1/24` both times. In the actual cusp parameter `q^(1/4)`, their orders are −4 and −8.” This tests the geometric normalization: the zero regulator/unit-class model gives order 0, and replacing c² by c gives normalized exponents `−1/144` and `−1/192`, which disagree.

19. **F19** (P2) The missing division-place argument is replaced by a route-specific restriction

   Location: `packages/KatoEulerSystems/README.md:176–183`, `:1223–1230`, and `:2406`, “Statements below … assume admissibility”.

   Claim: restricting the canonical rational constructions and Selmer finiteness endpoints to the places accessible to Kato's fixed-vector argument completes the general roadmap.

   Witness: §4.1 itself computes fixed dimensions 0 for nonidentity division-algebra elements and 2 for identity. GhateGonzalezQuer2005 line 702–728 supplies actual nontrivial quaternionic modular examples. No later target supplies the missing coefficient places.

   This is a scope defect under the binding prohibition on route-specific or good-prime-only shortcuts, not a request to restore Kato's false unrestricted SL₂ claim. The admissibility caveat correctly avoids that false proof step, but leaves the general rational endpoint conditional on the very input that failed.

   Exact repair: “Keep admissibility as the hypothesis of the intermediate Rubin-bound argument. Add an explicit general-coefficient-place construction/proof target for the canonical rational zeta map, its denominator removal and reciprocity, and the rational Selmer-finiteness conclusions, including the division places of Momose's algebra. State precisely the additional argument needed there and give it ownership here, rather than marking those places outside the endpoint.” Propagate the resulting general contract through §§4.4, 5.1–5.6, 6.2, 6.4 and 7.1–7.2, 7.9. The division-algebra test must continue to give dimensions 0 and 2; the new route must not claim to obtain a dimension-one fixed space from that subgroup. This finding requires additional theory, not deletion of a necessary hypothesis from the current proof.

20. **F20** (P3) The cited regulator proof extends beyond the stated page range

   Location: `packages/KatoEulerSystems/README.md:2670` and `packages/KatoEulerSystems/sources.toml:20`, “7.18–7.20 (pp. 163–178)”.

   Claim: that range contains the §7 proof cited for the regulator descent.

   Witness: Kato2004 line 2429 marks printed page 179; lines 2430–2450 contain the final trace comparison and the deduction of Theorem 2.6. Page 178 stops before that deduction.

   Exact repair: “§7, including §§7.7, 7.12 and 7.18–7.20, pp. 163–179.” Make the identical correction in the existing Kato2004 manifest entry. The corrected upper endpoint includes the deduction at line 2450; the original one does not.

## Verified sound

Read all 2,731 lines of README.md and all 73 lines of Suggested.lean, the repository README and CONTRIBUTING rules, and the package's prior repair dispositions. The full pass covered **3 Lean declarations**, **42 numbered target sections**, **157 README Check bullets examined**, **127 computed README statement/instance rows**, and **36 source-locator groups inspected in 13 legally cached works**. “Verified” below means the specified signature, computation, locator or contract was checked; it does not assert that a future formal proof already exists. The report retains 32 sampled README rows and the three Lean declaration rows; the per-target inventories are omitted.

The supplied elaborated signatures were compared individually with §7.9: **zero dropped binders and zero signature changes**. No Lean command was run. Both admitted theorems have native elliptic-point carriers, name the actual curve, and retain the intended generality. The one definition has a real body and is needed by a headline. Neither theorem follows by unfolding, a small-value computation, or one pinned theorem; **zero padding declarations** were found. Searches found no duplicate fully qualified name for these three declarations.

### Lean declaration and context ledger

All declarations are in `TauCetiRoadmap.KatoEulerSystems`, Layer 7. There is no ambient section-variable context; the following binders are explicit.

| Declaration / line | Variables and instances actually retained | Instances and computed values | Result |
|---|---|---|---|
| `ellipticCyclotomicFiniteGeneration`, 36 | `W : WeierstrassCurve ℚ`, `[W.IsElliptic]`, `m : ℕ`, `1 ≤ m` | m=1 gives root set {1}, generated field ℚ and the ordinary Mordell–Weil group. m=0 would give every x∈ℂ from x⁰=1, field ℂ and the non-FG group E(ℂ); it is excluded. m=2 includes CM curves; m=6 gives the nested 6ⁿ tower, containing both 2-power and 3-power roots. | Matches §7.9 and Kato 14.4, including composite m. Ellipticity excludes the cusp whose nonsingular group is additive ℚ and not FG. |
| `ellipticCharacterPart`, 46 | W and ellipticity; `K : Type u`, Field K, DecidableEq K, Algebra ℚ K; `ψ : Gal(K/ℚ) →* ℂ` | Trivial G: evaluation kernel 0, so all points. C₂ sign: I=(1+σ); a fixed order-three P gives 2P≠0 and fails, a fixed order-two P gives 2P=0 and belongs. C₄ with ψ(σ)=i: 1+ψ(σ²)=0. For S₃ sign, the same 1+τ test works for a transposition. Zero point gives zero for every group-ring action. | Actual coordinate action, all torsion retained. No finiteness, commutativity or Galois-extension hypothesis is needed to define the set. Conjugate complex characters can have the same integral kernel; that is the intended integral character part. |
| `ellipticCharacterPoints_finite`, 60 | W and ellipticity; m with NeZero; arbitrary universe K with Field, DecidableEq, Algebra; IsCyclotomicExtension {m} ℚ K; Dirichlet character χ; entire F, agreement with the native LSeries on Re(s)>3/2, F(1)≠0 | m=1 gives K≅ℚ and the whole point group. m=5, χ(2)=i gives coefficient i·a₂ and coefficient at 5 equal to 0; χ⁻¹ instead gives −i·a₂. At a removed good prime 2, factor 1−a₂/2+1/2≥1/2; split/nonsplit factors are 1/2 and 3/2. Two entire continuations have difference zero on a half-plane, hence value difference 0 at 1. | Correct cyclotomic power-map direction and imprimitive zero extension. It never evaluates the total, potentially nonsummable LSeries at 1. Nonzero m, characteristic zero and nonsingularity exclude the junk/zero-ring cases. |

Native definitions checked include `WeierstrassCurve.pointGaloisAction` in `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:47`, `WeierstrassCurve.LFunction` and its local-factor construction in `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:35`, `IsCyclotomicExtension.autEquivPow` in `Mathlib/NumberTheory/Cyclotomic/Gal.lean:77`, and `LSeries` in `Mathlib/NumberTheory/LSeries/Basic.lean:164`. In particular a total infinite sum does not provide analytic continuation. The regular-scalar torsion conventions were checked in `Mathlib/Algebra/Module/Torsion/Basic.lean:223` and `Mathlib/Algebra/Module/Torsion/Free.lean:45`; the full dyadic group algebra is not silently treated as a domain. The additional native carriers relevant to R12 are identified there.

The headline audit found the two native elliptic-point theorems stated; the missing statable open-image theorem is R12, and the unavailable headlines omitted from the module docstring are R16. Auxiliary linear-algebra, naturality and boundary calculations belong in the README.

### Supplier, ownership and direction checks

Ownership was searched by objects in main, Completed, board packages, the roadmap index, and all **55 explicitly supplied sibling folders**. The three Lean names were also searched for collisions. **20 supplier/consumer groups** were resolved against main or the supplied/indexed new-roadmap head; this count is groups, not the number of individual section mentions. Contract and ownership defects are recorded in R04–R07, R13, R15, R17 and R19. No dependency is excused as a gap: the plan's gaps list is empty.

The exact read-only dependency-check output was:

```text
depcheck: 56 roadmaps, 656 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The generic-regulator owner proposed in R17 is earlier in the supplied order. The dependency check verifies graph direction, not the substantive supplier failures R05–R07 or missing local constructions R09–R10.

The read-only diff against origin/main was confined to nine files under `packages/KatoEulerSystems`. There are no forbidden Lean options, admitted data, API-padding examples, extra Mathlib submodule imports or `lemma` declarations in Suggested.lean, and no computational algorithm target. No original file was edited and no GitHub write was performed.

### Source locator ledger

| Source | Locators inspected / extraction lines | Result |
|---|---|---|
| Kato2004 | 1.3–1.10, lines 212–370 | General-base theta is stronger than supplier; coordinates integral; phase and missing Bernoulli square matter. |
| Kato2004 | 2.2–2.7 and 2.10–2.13, lines 398–474, 551–640 | Constants/signs/norm branches match; general determinant-norm claim in 2.11 fails. |
| Kato2004 | 3.2–3.11, lines 780–1055 | Fourier normalization N²; constant 1/120 at h=4; exceptional weight-two slots separated. |
| Kato2004 | 4.5–4.7, lines 1087–1135 | General-weight operator exists in source but is absent from package; possible pole s=k. |
| Kato2004 | 6.6, lines 1822–1846 | Dual form, parity, 2πi and divided real-regulator limit match. |
| Kato2004 | 12.4–12.10, lines 3910–4173 | Integral/rational distinction and local exception inspected; 12.8.2 image assertion fails at quaternion division places. |
| Kato2004 | 13.1–13.4, lines 4174–4260 | Conductor indexing differs from field evaluation. |
| Kato2004 | 14.1–14.8, lines 4566–4739 | Finiteness, character kernel, cyclotomic finite generation and Tamagawa statement inspected. |
| Kato2004 | 16.2–16.6, lines 5890–6010 | Interpolation, growth, Gauss sums, unramified factors and η′ dual checked. |
| Nakamura2023 | 3.1.5, lines 1743–1890 | General Z and coefficient-valued δ constructions; pole wording misprint. |
| Nakamura2023 | Appendix A, lines 3730–3860 | n-level map needs its own denominator argument; d² smoothing typo confirmed. |
| Rubin2000 | III.5, lines 2240–2465 | Elliptic image, torsion, divisibility and local-normalization inputs inspected. |
| Weibel2013 | III.1.1/1.7.1 and III.Exercise 5.6, lines 270–414, 2375–2398 | Rotation SK₁ counterexample contradicts determinant replacement. |
| Loeffler2017 | Definition 1.2.1, Remark 1.2.4, Theorems 2.2.2/2.3.1, lines 126–142, 198–202, 254–289 | Pair-group openness and split-algebra restrictions checked. |
| Ribet1985 | §§3–4, lines 250–271, 301–334 | Local openness/all-but-finitely-many full image checked. |
| GhateGonzalezQuer2005 | Corollary 4.7, lines 631–643 | Ramification bound matches. |
| BurungaleTian2025 | Theorems 2.3–2.4 and Remark 2.5, lines 182–198 | Existence/rank/non-torsion formulations match Kato citation. |
| Nakamura2014 | Theorem 1.5, lines 190–227 | De Rham big exponential, all primes and domain checked. |
| Colmez1998 | Theorem 7 and Remark 8, lines 300–324 | De Rham big exponential and crystalline comparison checked. |
| Greenberg1999 | Theorem 4.1, lines 1470–1512 | Ordinary specialization factor and finite-Selmer assumption checked. |
| Serre1972 | Theorems 2–3, lines 1418–1425, 1620–1642 | Almost-all residual surjectivity and adelic openness checked; OCR of Theorem 3 reversed. |
| Ribet1981 | Theorem 1, lines 20–48 | Torsion over all roots of unity finite; applicable to every elliptic curve. |

| Kato2004 | 7.7, 7.12, 7.18–7.20, lines 1980–1992, 2040–2060, 2366–2450 | Descent reaches printed p.179, not p.178; R20. |
| Kato2004 | 8.4, 8.9–8.12, lines 2548–2598, 2671–2724 | Ordered Chern cup, total twist and finite-S norm relation inspected. |
| Kato2004 | 9.2–9.7, lines 2742–2820 | Open-curve filtration, critical dual exponential and three local branches match the supplier contract. |
| Kato2004 | 10.9, lines 3071–3147 | Two Chern maps and comparison square have the required coefficient twist. |
| Kato2004 | 11.3–11.4, lines 3429–3543 | Log-open comparison distinguished from proper comparison; semistable hypotheses retained. |
| Kato2004 | 13.5–13.14, lines 4261–4558 | Nonvanishing, spanning, denominators, finite index and local correction inspected. |
| Kato2004 | 14.9–14.14, lines 4740–4911 | Purity, local dimensions and specialization proof inspected; period misprint confirmed in PDF. |
| Kato2004 | 14.16–14.22, lines 4932–5162 | Index formula, strongly divisible lattice and almost-all vanishing; double twist misprint confirmed. |
| Kato2004 | 15.12–15.17, 15.23, lines 5677–5772, 5833–5838 | Contained-CM field case uses the smaller cyclotomic group; proof cites 14.12 instead of 14.15. |
| Kato2004 | 17.2–17.4, lines 6040–6084 | Rational ordinary inequality excludes primes above p; integral form requires odd p and integral image. |
| Nakamura2023 | Lemma 2.10 and Lemma 3.1, lines 1180–1209, 1440–1465 | Integral moment map/rational isomorphism and Hecke-dual exponent checked. |
| Nakamura2023 | Lemma 3.4 and Corollary 3.6, lines 2012–2124 | Torsion-free/injective parabolic cohomology, rational splitting and period uniqueness inspected. |
| Rubin2000 | Appendix B Lemma 3.1, lines 6650–6689 | Diagonal finite-coefficient cup limits; no integral finite-level Tate-line trivialization. |
| Loeffler2017 | Lemmas 1.1.3–1.1.4, lines 95–115 | Field automorphism omitted in proof; repeated “unramified” misprint. |

The range notation above identifies inspected locator groups, not an assertion that every intervening proof line was independently rederived. Ambiguous Kato formulas on printed pp. 124, 222, 234, 242, 249 and 270 were also viewed directly in the cached PDF. The errata below describe the printed formulas in original words.

### Sampled statement and instance audit

These 32 rows sample the 127 computed README statement/instance rows from the full pass. Rows refer to `packages/KatoEulerSystems/README.md`. Values are arithmetic, dimension, kernel, or specialization computations; they do not reprove the cited deep theorems. “Compatible” means the test does not refute the target.

| Statement / context | Instances and computed values on both sides | Result / change |
|---|---|---|
| Conventions: Frobenius, lines 129–138 | k=2, ℓ=3, a=2, ε=1: geometric `1−2u+3u²`; arithmetic `1−2t/3+t²/3`; twisting by 1 multiplies arithmetic eigenvalues by 3 | Compatible; do not interchange Frobenii |
| Conventions: full Λ, lines 139–147 | p=2: `(1+c)(1−c)=0`, both factors nonzero; `(1±c)/2` not integral; after inverting 2 the two factors are separate components | Compatible |
| Conventions: symbol sign, lines 157–163 | On the oriented two-torus mod 3: ordered cup 1, reversed cup −1=2; identical factors give 0 | Compatible |
| Conventions: parity, lines 169–174 | k=2,r=1, χ even: +; k=4,r=2, χ even: −; inverse character has inverse Gauss-sum argument | Compatible |
| 0.1 torsion evaluation | N=7, α=1/7,β=0: intended point e₁; fractional scalar `e₁/7` not defined; c=5 is nonunit on ℤ[1/7] | R01, R07 |
| 0.3 analytic product | α=0,β=0: n=0 factor0; α=0,β=1/7: `1−ζ₇≠0`; c=5 smoothing differs by ζ₇⁴ | R08 |
| 1.1 projection formula with unit norm | R=B[t,t⁻¹], S=R[i], s=x+iy: determinant norm1; transferred K₁ class[A]≠0; K₂ Laurent boundaries−[A] versus0 | R04 |
| 2.1 conductor adapter | m=1: prime intersection∅≠{p}; m=p: intersection{p}; oddm and2m give same field but raw components differ by P₂ | R02, R06, R15 |
| 2.2 literal dual | k=4,p=2: antidiagonal(−2,1,−2), determinant−4; at p=3 determinant is a unit | Compatible factorial restriction |
| 2.3 claimed Hecke linearity | Source at k2 rank1; target vector(1,1) under eigenvalues λ≠μ goes(λ,μ), not scalar multiple of(1,1) | R14 |
| 3.2 Fourier comparison | At h4,N3, Fourier transform squared is9·id: `3²·3⁻⁴·9=1`; the integer congruence-class expansion instead needs3⁴=81, changing1/9720 into1/120 | Compatible |
| 3.4 realRegulatorUnits | f=2,g=z on C×: η=i log2 dθ, circle integral2πi log2; swap f,g negates; f=1 gives0 | Compatible orientation; generic construction duplicated, R17 |
| 4.1 admissible_of_split | u(x)−1 maps(a,b)→(xb,0): x≠0 gives kernel E·e₁ and rank1; division-algebra d≠1 gives invertible d−1, kernel0 | Compatible split/division distinction |
| 4.2 boundary nonvanishing | k3,r2: s2=(k+1)/2 boundary; k4,r3:3>2.5; k2,r1:1<1.5 may vanish | Compatible hypotheses |
| 4.2a local duality | T=ℤ_p(2): base invariants0, cyclotomic-tower invariantsℚ_p/ℤ_p, dualℤ_p≠0 | Compatible and discriminating |
| 4.3 modular bound | Zero system givesJ0 and rank-one Λ/J; a DVR model J=(π²), strict H²=O/π has lengths1≤2 | Compatible nonzero condition, dependent on R06 |
| 4.5 finite_of_pseudoNull | R=ℤ_p[[T]], M=R/(p,T): sizep, localizations height≤1 zero; M=R/(p): infinite and localization at(p) nonzero | Compatible |
| 4.6 twist/localization | κ(γ)=4,p3,j1: both routes give(1/4)γφ(x), wrong route gives4γφ(x); j0 identity; inverse twist scalar4 cancels1/4 | Compatible |
| 4.7 Serre open image | No-inner-twist algebra dim4=dimM₂(ℚ); u−1 rank1; CM i-automorphism is not integer multiplication | Missing Lean headline R12 |
| 5.1 conjugation | ιγ=γ gives σ₋₁z=−z; ιγ=−γ gives σ₋₁z=z; characteristic0 distinguishes signs | Compatible |
| 5.1 zeta submodule / membership / span | Zero map span0; nonzero x gives x in span; (γ−1)x is a Λ-linear combination; p⁻¹z(v)=z(p⁻¹v) | R03 for the proposed span distinction |
| 5.4 twist-one definition | (1−k)+k=1; n5 baseQζ₅ of degree4 cannot arise by changing coefficients on conductor-one baseQ | R09 |
| 5.6 full-level characterization | k4,n5 coefficient rank3 and group-ring rank4 versus weight2,n1 ranks1 and1; period factor(2πi)⁻³ rather than(2πi)⁻¹ | R10 |
| 6.1 Perrin-Riou map | Zero representation: map0 and pairing0; crystalline φd=2d atp5: supplier chart value2⁻ⁿd versus globald | R05 |
| 6.4 analytic–arithmetic equality | Split multiplicative α1 trivial-character factor0; nonsplitα−1 factor2; supersingularp3,α²−3 gives unramified product2/3+2α/3 | Compatible |
| 6.5 critical fibers | k2,p3,u4: log-factor at4 is0, at1 is−log4≠0 (v₃=1); interpolation alone cannot fix its multiple | Compatible |
| 6.6 local lattice | Odd p logarithmic lattice pℤ_p gives dual p⁻¹ℤ_p; dyadic example log(E₁)=4ℤ₂ gives dual(1/4)ℤ₂ rather than(1/2)ℤ₂ | Compatible |
| 7.2 cohomological inequality | Height-one DVR lengthsH²2,global quotient1,local1:2≤1+1 but not2≤1; nonsplit case local0 | Compatible retained local term |
| 7.3 classical Sha finiteness | Individual finite p-parts for infinitely many p could yield infinite direct sum; vanishing at almost all p plus all-p finiteness gives finite product | Compatible |
| 7.7 control factor | αβ=p: #(Ẽ(F_p))=(1−α)(1−p/α); second factor unit, so valuation equalsv_p(1−α⁻¹); square doubles valuation | Compatible |
| 7.9 character part | G1:I0,allpoints; C₂ sign:I=(1+σ),fixedorder3 fails2P≠0, fixedorder2 satisfies2P0; C₄ ψσ=i gives1+ψσ²=0 | Compatible integral torsion |
| 7.9 continuation uniqueness | EntireF−G vanishes on Re>3/2, hence everywhere; both values at1 equal; total nonsummable LSeries instead has junk value0 | Compatible native continuation hypothesis |

## Not verifiable

- Fresh Lean elaboration was prohibited. Signature comparisons use the supplied elaborated types at this head, supplemented by direct reads at the pinned libraries. R12's proposed additional signature has not been elaborated.
- These nine sources remain **uncertified**, as already settled; their primary text was not available for this review. No replacement keys or renewed requests were created:

| Source | Uncertified locator / use |
|---|---|
| Schneider1985 | §2 and §A.1 Lemma 6: universal formal norms and control. |
| JacquetShalika1976 | Published pp. 1–16: bibliographic nonvanishing reference; the actual imported boundary contract was checked in its named supplier. |
| Rohrlich1988 | Published pp. 611–632: finite exceptional twist set. Kato 13.5 was read as the secondary statement. |
| Rohrlich1984 | §3, published pp. 409–423: finite-support conductor twists. |
| Ribet1980 | Published pp. 43–62: GL₂-type modular-abelian realization. |
| PerrinRiou1994 | Published pp. 81–149: original crystalline big exponential. Kato 16.4–16.5, Colmez and Nakamura's readable statements were checked. |
| PerrinRiou1990 | Théorème 3.1 and §6: formal norms and local/global Iwasawa inputs. |
| BlochKato1990 | §3, Examples 3.10.1 and 3.11: local conditions and abelian Kummer comparison. The current named Selmer supplier contract was checked. |
| DiamondShurman2005 | Theorem 6.6.6: modular abelian-variety decomposition. |

- FontaineMessing1987 remains **waived**, pp. 179–207, for strongly divisible lattices. This review does not certify that primary proof or reopen the waiver.
- The source ledger records inspected statements and proof steps; it is not a complete new proof of Kato's paper, the general regulator comparison, or all supplier theorems. Some extracted mathematical displays are damaged. Only clear text, cross-formula checks, and the explicitly viewed PDF pages support the listed errata; the reversed-looking OCR of Serre's Théorème 3 is not registered as a source error.
- Ownership was checked against the supplied 55 open-folder heads and the available roadmap index. No independent semantic audit was made of unnamed, unavailable open heads. Future existence of the carrier constructions listed as unavailable in the Lean docstring cannot be certified by present pin searches.

## Source issues

- **Misprint** in Kato2004 at §1.9, printed p.124 (line 330): the source says the last Bernoulli term has numerator a; it should be a²/(2N²); affects a stated result.
- **Error** in Kato2004 at §2.11, printed p.131 (line 584–588): the source says arbitrary finite locally free unit-symbol transfer uses the determinant norm; it should be the full K₁ transfer, with norm replacement justified separately; affects the proof.
- **Error** in Weibel2013 at Chapter III, Exercise 5.6, printed chapter p.46 (line 2381–2386): the source says transfer of every unit class equals its determinant norm for finite projective extensions; it should be the full K₁ class unless the SK₁ obstruction vanishes; affects a stated result.
- **Misprint** in Kato2004 at Theorem 12.5(4), printed p.222 (line 4094): the source says the integral height-one inequality uses rational V(f) modules and Z(f); it should be H²(T) and H¹(T)/Z(f,T); affects a stated result.
- **Error** in Kato2004 at Remark 12.8.2, printed p.223 (line 4138–4141): the source says every coefficient-place image contains an open subgroup of SL₂(ℤ_p); it should be restricted to split quaternion places, with a separate argument at division places; affects the proof.
- **Misprint** in Kato2004 at §13.13, printed p.234 (line 4544): the source says Frobenius on the cyclotomic character of exponent r multiplies by p^(−2r); it should be p^(−r), which gives the subsequent equation −2r∈{k−1,k}; affects the proof.
- **Misprint** in Kato2004 at Theorem 14.5(3), printed p.236 (line 4647): the source says the required integral-image condition is (12.5.1); it should be (12.5.2); affects a stated result.
- **Misprint** in Kato2004 at §14.13, printed p.242 (line 4859–4860): the source says the projected period is L_{p}(f,k−r)γ^±; it should be (2πi)^(r−1)L_{p}(f*,k−r)γ^± with the stated period convention; affects the proof.
- **Misprint** in Kato2004 at Proposition 14.21(2), printed p.249 (line 5105): the source says S(T(r)) after defining T=T(D)(r); it should be S(T), with only the already included twist; affects a stated result.
- **Misprint** in Kato2004 at Proposition 15.17 proof, printed p.265 (line 5769): the source says to apply Lemma 14.12 to the localized modules; it should be Lemma 14.15, the codimension and specialization statement; affects the proof.
- **Misprint** in Kato2004 at Theorem 16.4, printed p.270 (line 5936): the source says the dual coefficient representation has an action of Gal(L̄/L); it should be the dual action of Gal(ℚ̄_p/ℚ_p), the original representation's group; affects a stated result.
- **Misprint** in Kato2004 at Theorem 16.4(ii), printed p.270 (line 5952): the source says η′ lies in D_cris(V_{F_λ}(f)); it should be η′∈D_cris(V*(1)), as required by η and the pairing; affects a stated result.
- **Misprint** in Nakamura2023 at §3.1.5, arXiv v2 printed p.41 (line 1814–1818): the source says the holomorphy exception is k=2 and excludes s=2; it should be the possible pole s=k, excluding s=k in that evaluated identity; affects a stated result.
- **Misprint** in Nakamura2023 at Corollary 3.6 proof, arXiv v2 printed p.48 (line 2114): the source says uniqueness follows from Lemma 3.4(1); it should be Lemma 3.4(2), the exponential injectivity, together with the period injection; affects the proof.
- **Misprint** in Nakamura2023 at Appendix A, Theorem A.1 introduction and proof, arXiv v2 printed p.86 (line 3747, 3768–3769): the source says Kato constructs the canonical map in Theorem 12.4; it should be Theorem 12.5, whose construction is in §§13.9–13.12; affects the proof.
- **Misprint** in Nakamura2023 at Appendix A, μ_n formula, arXiv v2 printed p.87 (line 3785): the source says the second smoothing factor begins with d; it should be d², agreeing with μ₁ and the two auxiliary smoothings; affects a stated result.
- **Error** in Loeffler2017 at Lemma 1.1.3 proof, arXiv printed p.3 (line 100–102): the source says every automorphism of PSL₂(k) is PGL₂(k) conjugation; it should be PGL₂(k) conjugation composed with a field automorphism, as the lemma itself allows; affects the proof.
- **Misprint** in Loeffler2017 at Lemma 1.1.4 proof, arXiv printed p.3 (line 112–114): the source says both degree-two central simple algebras over a p-adic field are unramified; it should be one split algebra and one division algebra; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "0ff66a0e2b6ed27badda14c04ab6553e236fe6e0", "job": "RT-KatoEulerSystems~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
