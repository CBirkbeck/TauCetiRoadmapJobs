# PORT-EllipticCurveModularityImaginaryQuadraticPartII

## Result

- Branch: `roadmap/elliptic-curve-modularity-imaginary-quadratic-part-ii`, from `0f9f711`.
- Head commit: `669904eb1c434e7cd9e2710e772bc23e0c7e34d7`
  ("EllipticCurveModularityImaginaryQuadraticPartII: roadmap (README, Suggested.lean, metadata)").
- Folder: `TauCetiRoadmap/EllipticCurveModularityImaginaryQuadraticPartII/{README.md,Suggested.lean,metadata.toml}`.
  Nothing outside the folder changed.
- Build (`lake build TauCetiRoadmap.EllipticCurveModularityImaginaryQuadraticPartII.Suggested`):
  `✔ [18238/18239] Built TauCetiRoadmap.EllipticCurveModularityImaginaryQuadraticPartII.Suggested (3.3s)`,
  then `Build completed successfully (18239 jobs).` Warnings: 0. The file declares nothing, so there
  is not even a `sorry` warning.
- Gate: `gate EllipticCurveModularityImaginaryQuadraticPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`), after all edits:

      depcheck: 249 roadmaps, 2392 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.

## Draft pull request body

This roadmap extends EllipticCurveModularityImaginaryQuadratic from imaginary quadratic fields to
every CM number field. Its endpoint is Theorem 8.1: every elliptic curve over every CM field is
modular. The automorphic conclusion is the parent's: a weight-zero isobaric representation of
`GL₂(𝔸_K)` with trivial central character that realizes `H¹(E_K̄, Q̄_ℓ)` for every `ℓ` and `ι`,
with full Weil–Deligne compatibility away from `ℓ`, agreement of every finite local factor, the
expected complex parameters and `L(E/K, s) = L(π_E, s − 1/2)`. Over an arbitrary CM field the
parent's geometric prime switch breaks at two points, and the roadmap repairs each. First, `ζ₅ ∉ K`
no longer forces `ζ₅ ∉ K(μ₃ₚ)`. So the auxiliary curve is made modular over `K` before the cyclotomic
base change (Layers 1–2), which proves Theorem 2.5, modularity over CM fields not containing `ζ₅`,
using only the published Caraiani–Newton lifting theorems. Second, when `ζ₅ ∈ K` the residual image
`SL₂(𝔽₅)` is exactly the configuration excluded from the Caraiani–Newton lifting theorem.
Layers 3–6 build a lifting theorem at five that keeps a *protected* place, where residual inertia
is a nontrivial unipotent and the lift is unipotently ramified. Its ingredients are: the
detection of the exceptional class of `H¹(SL₂(𝔽₅), ad⁰)` by an order-five unipotent subgroup;
the unipotent-inertia deformation condition and its self-annihilating tangent line; Taylor–Wiles
primes and a relative presentation in which the protected places are not framed; Hecke-valued
representations at Iwahori level; and a solvable preparation that keeps the protected places.
The result, Theorem 6.2, is stated for an arbitrary representation. Layer 7 produces a protected
place on the auxiliary curve from a multiplicative degeneration of type `I₃` of the cover family
and keeps it through the switch at five. Everything the parent and the other modularity roadmaps
plan is imported by section and name and is not planned again. `Suggested.lean` declares
nothing: none of the three headline theorems (2.5, 6.2, 8.1) is statable at the pins, which have
no automorphic representations of `GL₂(𝔸_K)`, no attached Galois representations and no
potentially semistable representations, and its docstring says so.

## Dependencies that are still pull requests

Suppliers named in `*Needs:*` lines and the supplier contracts that are not on main (all earlier than
this roadmap in the merge order, all at unchanged heads during this job):
EllipticCurveModularityImaginaryQuadratic, CrystallineLocalGlobalCompatibilityCM,
AutomorphicGaloisRepresentationsPartII, PotentialAutomorphyInfrastructure, MordellLawrenceVenkatesh,
ArithmeticGaloisRepresentations, ArithmeticGaloisDuality, LocalGaloisDeformationRings,
GlobalGaloisDeformations, DeformationAndDerivedPatchingAlgebra, GL2ModularityLifting,
PotentialModularityAndCompatibleSystems, GL2AutomorphicRepresentationsAndTransfer,
ComplexMultiplicationAndExplicitReciprocity, FaltingsFinitenessAndIsogenyTheorems,
NeronModelsAndSemistableAbelianVarieties, ShimuraVarieties.

Suppliers on main: EllipticCurves, ClassFieldTheory, SchemeAndStackFoundations, Chebotarev (Completed).

Named only as scope boundaries or consumers, not as suppliers (later in the merge order):
EllipticCurveModularityTotallyReal, ModularityAndLanglandsExtensions, BianchiModularForms.

Ids cited that only an open revision defines: none (`roadmaps overlaps` lists none, and no cited
roadmap has an open revision).

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` declares nothing: one module docstring naming Theorems 2.5,
6.2 and 8.1 and what each lacks at the pins. It already had the required form and is kept verbatim.
I checked statability again at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, matching
`lake-manifest.json`). Neither library has automorphic representations of `GL₂(𝔸_K)` (grep for
`Automorphic` in Tau Ceti finds only bibliography lines; Mathlib has none), nor `WeilDeligne`,
`HodgeTate`, `PotentiallySemistable`, `IsCrystalline` or `LocalLanglands` (0 files in either). So no
headline is statable, and none is added. The field-theoretic and finite-group statements of
Layers 1 and 3 are statable but are ingredients, not headlines, so they stay as README targets.
The `#check @name` comparison has nothing to run on: the file has no named declaration, and
nothing changed.

## Supplier replacements and duplication removals

1. **Theorem 2.4 restated ComplexMultiplicationAndExplicitReciprocity §4.1.** The package's §2.4
   listed "`H¹(E)|G_{KM}` is the sum of the realizations of two algebraic Hecke characters" as
   something to prove. ComplexMultiplicationAndExplicitReciprocity §4.1 (open, earlier in the merge
   order) supplies it: the algebraic Hecke character of a CM abelian variety whose endomorphisms are
   defined over the base, and "One-dimensional CM components of the Tate module",
   `V_l(A)⊗ℚ̄_l = ⊕_j ψ_{A,j}` as `G_k`-modules (its README line 645 at the head). §2.4 now takes the
   splitting over `KM` from that section and proves only the automorphic realization over `K` (the
   parent's §8.6 route). AutomorphicGaloisRepresentations §3.13 and AbelianSchemesAndArithmeticModuli
   A6 served only that splitting, through the parent's §8.6. They are dropped from §2.4's `*Needs:*`,
   from the Layer 2 Dependencies and from the supplier contracts, and a contract
   `### From TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocity` is added. The deferral is
   recorded in Scope and ownership. Depcheck stays clean.
2. No other restatement was found. The duplication sweep was by object, using `roadmaps grep`
   across main and all open heads (455–459 pull requests), and covered: CM-ness of cyclotomic
   extensions and intermediate fields of CM fields; descent of decomposed genericity; `H¹(SL₂(𝔽₅), ad⁰)`
   and the exceptional class; protected places and the unipotent-inertia condition; the `I₃`
   degeneration; and "every CM field" modularity and LeHung26/CaptainSude26 citations. The only
   hits were the parent, EllipticCurveModularityTotallyReal (totally real bases only; it names this
   roadmap as the owner of CM bases), MordellLawrenceVenkatesh §§1.3–1.4 (already cited: Theorem 1.1
   applies its criterion) and ComplexMultiplicationAndExplicitReciprocity (item 1). At the pins,
   Mathlib's `CMField.lean` has `IsCMField.of_forall_isConj` (Galois fields only) and nothing on
   composita or intermediate fields, and Tau Ceti's `ComplexConjugation/` files have nothing either,
   so Theorem 1.1 is not already proved. Ownership against open pull requests was checked with the
   tools, which read every open head, not only the 245 with local checkouts.

## Citations resolved

Every cited section and backticked name was checked at the supplier's current head (`roadmaps show`;
heads at `#1048 74684b8`, `#1182 cb5cbd7`, `#1006 902b706`, `#1081 eeb6a5b`, `#1231 4bf88fa`,
`#856 00e8930`, `#858 66647f8`, `#923 ba39a43`, `#920 9e4960f`, `#1034 22d4907`, `#1071 038e4ea`,
`#1075 62af310`, `#931 9b8725e`, `#1254 36aadba`, `#1004 f1f8fc9`, `#852 6234348`, `#933 314489c`)
and on main:

- Parent: all 41 backticked names occur. `cyclicCover`, `characterSystem` and
  `complexInfinityParameter` occur in bold, with an argument. All cited sections exist (some as
  bold run-in headings): §§0.2, 0.3, 1.1, 1.3, 2.1–2.3, 4.1, 4.2, 4.4, 5.1–5.3, 6.1, 6.3, 6.5, 6.6,
  7.1, 7.2, 7.4, 8.1, 8.3–8.6.
- CrystallineLocalGlobalCompatibilityCM §§7.5, 8.2–8.7, 9.1, 9.3–9.12; AutomorphicGaloisRepresentationsPartII
  AG2.0, AG2.5, AG2.7 with `IsDecomposedGenericPrime`, `decomposedGenericPrime_local`,
  `IsDecomposedGeneric`; PotentialAutomorphyInfrastructure §§2.1, 2.3, 2.5 with their three names;
  MordellLawrenceVenkatesh §§1.3, 1.4; ArithmeticGaloisRepresentations §§2.1, 4.3, 6.3, 7.2, 7.7, 7.8,
  7.9 (`ResidualImage.adZeroRep` is declared in its `Suggested.lean`, namespace `ResidualImage`;
  *ContinuousRep.adZero* is in its §7.2); ArithmeticGaloisDuality R02.2, R02.4.2;
  LocalGaloisDeformationRings §§1.10, 2.3, 2.5, 2.6, 2.8, 2.15, 2.16, 2.21, 3.14, 4.14, 4.15, 6.6
  (plain numbered headings, distinct from its F.x layer); GlobalGaloisDeformations §§3.4, 3.6, 3.7,
  5.1, 5.5, 5.6; DeformationAndDerivedPatchingAlgebra §§8.1–8.5; GL2ModularityLifting §1.7
  (`cht_soluble_prescribed_completions`); PotentialModularityAndCompatibleSystems §§2.12–2.16;
  GL2AutomorphicRepresentationsAndTransfer R16.3.2, R17.4.16; ComplexMultiplicationAndExplicitReciprocity
  §4.1; FaltingsFinitenessAndIsogenyTheorems R28.6.2, R28.6.3; NeronModelsAndSemistableAbelianVarieties
  §§3.1, 3.12, 5.1; ShimuraVarieties §5.6; ModularityAndLanglandsExtensions §§2.29, 2.30.
- Main: EllipticCurves Layers 4, 5; ClassFieldTheory Layers 5, 11; SchemeAndStackFoundations
  §§4.13, 4.18; Chebotarev Layer 10.
- Pins: every Mathlib and Tau Ceti declaration named in the README was opened at the pin (file and
  line): `NumberField.IsCMField` (`CMField.lean:70`), `of_isAbelianGalois` (542),
  `IsCyclotomicExtension.Rat.isCMField` (564), `isTotallyComplex_of_algebra` (`TotallyRealComplex.lean:229`),
  `Matrix.SpecialLinearGroup.toGL` (`GeneralLinearGroup/Defs.lean:369`), `groupCohomology.map`
  (`Functoriality.lean:141`), `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` (`FiniteCyclic.lean:114`),
  `Matrix.SL2.commutator_eq_top` (`SpecialLinearGroup.lean:804`, hypotheses `a ≠ 0`, `a² ≠ 1`),
  `Representation.linHom` (`Basic.lean:655`), `continuousCohomology` (`ContCohomology/Basic.lean:131`),
  `NumberField.AdeleRing` (`AdeleRing.lean:56`), `WeierstrassCurve.localPolynomial` (43, read on
  `W.minimal R`), `LFunction` (79), `LSeries` (84); Tau Ceti `eulerCharacteristic_mixed`
  (`EulerCharacteristic/Theorem.lean:98`), `tateDualityPairing_perfect_mixed` (`Duality/Perfect.lean:280`),
  `GalRep` (`MuNRep.lean:130`), `WeierstrassCurve.tateModuleGaloisRepresentation` (`TateModule/Galois.lean:80`).
- `roadmaps resolve` on the final README lists only `LeHung26, §4.4`, `OpenAI26, §9.4` and
  `CaptainSude26, §4`. These are source keys, not roadmaps, so they are not defects.

## Fixes made in the upstream-reviewer reread

1. **Wrong clause range for CrystallineLocalGlobalCompatibilityCM §9.1.** §5.1 said that forgetting
   `P` gives "the data (1)–(14)" of that section, and the supplier contract said "the prepared data
   (1)–(15)". At its head, §9.1 has unnumbered data and hypotheses numbered (5)–(15). §5.1 now
   says that replacing `R` by `R ∪ P` gives the data and clauses (5)–(13), and clause (14) away
   from `P`. It also gives the reasons: clause (10) holds because `S = S₅ ∪ (R ∪ P)` and `ζ₅ ∈ F`,
   clauses (11)–(12) are then vacuous, and clause (15) fails by (v). The contract now says "the
   prepared data and its clauses (5)–(15)".
2. **The existence statement for switch parameters was imprecise.** "May be required to lie in
   finitely many further nonempty local opens" did not say where those opens may be placed. At a
   place above `3p`, an arbitrary open can miss the (S1)-opens. The definition in Conventions now
   carries API bullets. The existence bullet takes further opens at a finite set `Σ` of places prime
   to `3p`, which is what §7.5 uses (places above `q ≥ 7`, `q ≠ p`), and gives the route through the
   parent's §§6.5 and 7.4. The "what the theorems use" bullet now includes Theorem 2.1(a) among the
   users of the non-CM clause of (S2), as §2.1's own proof says.
3. **§2.4 restated a supplier.** See "Supplier replacements" item 1.

No other statement needed changing: the adversarial pass below found every computed value
consistent.

## Adversarial mathematics pass

All rows were computed here. Rows marked * were also checked by a short script
(matrix arithmetic over `𝔽₅` and `𝔽₂₅`, group orders, cocycle counts, residues). Notation: `e = E₁₂`, `h = diag(1, −1)`, `f = E₂₁`,
`U = 1 + e`, `D = Ad(U)`, `N = D − 1`.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions, arithmetic Frobenius witness * | `q_v = 11, 7` over `𝔽₅` | `U¹¹ = U`; `U⁷ = [[1,2],[0,1]]`; `7·3 = 21 ≡ 1`, so `φ⁻¹` gives `U³` | as stated | none |
| Conventions, `Ad(U)` and Gram matrix * | `𝔽₅` | `D(h) = 3e + h = h − 2e`; `D(f) = 4e + h + f = f + h − e`; Gram `[[0,0,1],[0,2,0],[1,0,0]]`, det `−2` | agrees | none |
| Switch parameter Check 2 * | the two transvections over `𝔽₅` | `AB = [[0,3],[3,1]]`, `BA = [[1,3],[3,0]]`; elements of order 5 lie in any index-2 subgroup; the mod-ℓ image of `G_{KM}` of a CM curve lies in `(M ⊗ ℚ_ℓ)^×`, which is abelian, for every `ℓ` | CM `t` fails (S3) | none |
| Switch parameter, existence | further opens above `3p` vs prime to `3p` | an arbitrary open at `v₀ | 3p` can be disjoint from the parent's §6.5 opens; prime to `3p` there is no conflict | the original claim was imprecise | restricted to `Σ` prime to `3p` |
| Cohomological normalization | eigenvalues `α, β` → `α⁻¹, β⁻¹` | ratios `α/β ↔ β/α`; "no ratio equals `q`" is symmetric | genericity passes to the dual | none |
| 1.1(a) | `K = ℚ(i)`, `L = ℚ(ζ₂₀)`; `S = {1,2}`; `K = ℚ(2^(1/3))`; `K = ℚ(√−3)`, `S = {4}` | `Gal(L/K) = {a ≡ 1 mod 4} ≅ (ℤ/5)ˣ`, cyclic of order 4, three intermediate fields; `L = K`; `S₃`, `c₁c₂` a 3-cycle; `ℚ(ζ₁₂)` abelian | needs `K` CM, as its Check says | none |
| 1.1(b) | `ℚ(i) ⊂ ℚ(i,√5) ⊂ ℚ(i,√3,√5)`; `ℚ(√5) ⊂ ℚ(ζ₂₀)` | 7 quadratic subfields `d ∈ {−1, ±3, ±5, ±15}`; no `√2`; `(ℤ/2)³` has no `ℤ/4` quotient; roots of unity `μ₁₂`; `ℚ(√5)` totally real | needs "containing `K`" | none |
| 1.1 vs pins | Mathlib `CMField.lean`, Tau Ceti `ComplexConjugation/` | only `of_isAbelianGalois`, `of_forall_isConj` (Galois), `Rat.isCMField`; no composita or subfields | not already proved | none |
| 1.2 | `1 ⊕ 1` over `𝔽₃`, `ℚ ⊂ ℚ(ζ₃)`; `K = F` | `q = 2`: ratio `1 ≠ 2`; over `ℚ(ζ₃)` split primes `≡ 1 mod 3`, ratio `1 = q`; identity case trivial | (a), (b) true; converse false | none |
| Layer 1 Example `K₆₀` * | `(ℤ/60)ˣ` | `29² ≡ 1 mod 60`; `29 ≡ 14 mod 15`, `≡ 1 mod 4`, `≡ 4 mod 5`, `≡ 2 mod 3`; degree `16/2 = 8` | `ζ₅ ∉ K₆₀`, `K₆₀(ζ₃) = ℚ(ζ₆₀)` | none |
| 2.1 | `ζ₅ ∉ K`, `ζ₅ ∈ F` | `cm_modularity` needs `ζ₅ ∉ L` (parent §5.3 at head) and is applied at `L = K`; Theorem 1.2 descends (a) | as stated | none |
| 2.2 | lift primes; `h(t)` a square | primes `p > 100` and `3` only, so the five-adic clause never applies; `χ_(h(t)) = 1` gives `π_E = π_B` | as stated | none |
| 2.3 Checks | split multiplicative, `q_v = 4`; `K = ℚ(ζ₈)`, `z = i`; good, `q = 4`, `a = 4` | `(1 − T)⁻¹` against `((1 − T)(1 − 4T))⁻¹`; 2 complex places, `diag(i, −i)`, trace 0, det 1; `(T − 2)²`, roots `2/√4 = 1`; `|a| ≤ 2√q = 4` | as stated | none |
| 2.4 | `y² = x³ − x`, `y² = x³ + 1` over `ℚ(ζ₈)`; `y² = x³ − x` over `ℚ(√−3)` | `ℚ(i) ⊆ ℚ(ζ₈)`; `ℚ(√−3) ⊄ ℚ(ζ₈)` (its quadratic subfields are `ℚ(i), ℚ(√2), ℚ(√−2)`), `KM = ℚ(ζ₂₄)` | sum vs induction as stated; splitting now cited | splitting cited from ComplexMultiplicationAndExplicitReciprocity §4.1 |
| 3.1 * | `X = [[x,y],[z,−x]]`; char 2; `diag(2,3)`; `𝔽₃` | `UX − XU = [[z,−2x],[0,−z]]`, `UᵀX − XUᵀ = [[−y,0],[2x,y]]`; char 2: `1 ∈ ad⁰` fixed; `Ad(diag(2,3))`: `e ↦ 4e`, `h ↦ h`, `f ↦ 4f`; `(D − 1)f = 4e + h`, `(D − 1)²f = 3e = −2e`, `(D − 1)³ = 0` | `H⁰ = 0` iff `2 ∈ kˣ` | none |
| 3.2 * | `p = 3, 5, 7`; order-3 subgroup | `Σ_{i<p} Dⁱ` has coefficients `C(p, j+1) mod p` = `(0,0,1)`, `(0,0,0)`, `(0,0,0)`; `(D − 1)M = ke ⊕ kh`; `[[0,−1],[1,−1]]³ = 1`; `|SL₂(𝔽₅)| = 120`, index `24 ≡ 4 mod 5` | bijective only at 5 | none |
| 3.3 definition and API * | `M = [[0,−1],[1,−1]]`, `Φ = [[4,1],[0,1]]`, `q_v = 11`; Tate curve with `5 ∤`, `5 | v(q_E)`; ramification index 5 | `M³ = 1`, `ΦMΦ⁻¹ = [[4,1],[4,0]] = M⁻¹ = M¹¹`, `Φ² = 1`; a unipotent subgroup of `GL₂(k)` is a `p`-group, a quotient of `ℤ_p(1)`, so cyclic of order `p`; `U⁵ = 1` | not protected; protected; unramified; protection lost | none |
| 3.4 * | `[[ζ₅,1],[0,ζ₅⁻¹]]`; `(1 + εf)U`, `(1 + εh)U`; `q = 11`, `δ = 1` | traces `ζ₅ + ζ₅⁻¹ ≠ 2`, `2 + ε`, `2` with det `1 − ε² = 1`; `ρ(φ)Nρ(φ)⁻¹ = qN` forces `ρ(φ) = [[qδ, z],[0, δ]]`; `11·12² = 1584 = 12²·11`; parameters `a, b, z` give relative dimension 3 | (i) ⇔ (ii) ⇔ (iii) | none |
| 3.5(a)–(d) * | `q ≡ 1`, `q ≡ 2 mod 5`; cocycles on `⟨τ, φ⟩` for `q = 11` over `𝔽₅` | `#Z¹ = 5⁴`, `#B¹ = 5²`, so `dim H¹ = 2`; every cocycle has `ξ(φ) ∈ ke`; `M^(I_v) = ke` scaled by `q_v` under `φ` | (d) true for `p ≥ 5` | none |
| 4.1 | no protected place; inertia of order 2; `Gal(LC_N/F) = SL₂(𝔽₅) × A` | `H¹(G × A, M) = H¹(G, M)` when `M^G = 0`; order 2 invertible in `𝔽₅`; inflation injective on `H¹` | false without `P`, as its Check says | none |
| 4.2 * | `g = diag(2,3)`; `Ad(Uᵀ)` | eigenvalues `4, 1, 4`; `Ad(Uᵀ)e = e + 4h + 4f = e − h − f`, `Ad(Uᵀ)²e = e + 3h + f = e − 2h − 4f`, determinant with `e` equal to `2`; `κ(γσ₀) = κ(γ) + κ(σ₀)` | detecting element exists | none |
| 4.3 * | `(d, t, r) = (2,1,6)`, `(2,3,10)` | `g = 0`; `g = 6`; `1 + 9 + 4 = 14`, `14 + 6 = 20 = r + 4t − d`, `1 + 11 + 10 = 22 = r + 4t` | deficit `d` | none |
| 5.1 condition (ii) * | degrees `(8,8,24)`, five places of degree 8; search over all `[F⁺:ℚ] ≤ 40` | complements `24 > 20` and `8 < 20`; least degree satisfying (ii) at every place is 40 | as stated | none |
| 5.1 vs CrystallineLocalGlobalCompatibilityCM §9.1 | clause numbers at its head | data unnumbered, hypotheses (5)–(15); with `R ∪ P`: (10) holds, (11)–(12) vacuous, (14) fails at `P`, (15) fails | clause range was wrong | fixed |
| 5.2, 5.4 counts * | `d = 40`, `t = 10`, `R = ∅` | `1 + 10·11 = 111 = 1 + 3t + 2d`; `g = r − 111`; `dim R_∞ = 111`, `dim S_∞ = 151`; `χ_v² ≠ 1` possible because `ζ₅ ∈ F` gives `q_v ≡ 1 mod 5` | deficit `40 = l₀` | none |
| 5.3 Check * | `q_w = 11`, `ρ̄(Frob_w) = diag(2,3)` | `[PGL₂(O):Iw] = 12`, `#𝔽₁₁ˣ = 10`, `Δ_w` of order 5, index `60`; `(1 ± ε)¹¹ = 1 ± 11ε = 1 ± ε` over `𝔽₅[ε]` | `Q ∩ S^c = ∅` needed | none |
| 6.1 * | `p_b = 109`, `p_c = 2617`, `q = 11`; `E = ℚ(√31, √59, √71)`; `ℚ(√5, √2)` | both prime; `2617 ≡ 1 mod 436`; `109 ≡ 2617 ≡ 10 mod 11`; `−436 ≡ 4 mod 11`; `−2617 ≡ 108 ≡ −1 mod 109`; `(109/2617) = (2617/109) = 1`; `109·2617 ≡ 5 mod 8` (unramified, not split, at 2); residues mod 5 `(1,4,1)`, mod 11 `(9,4,5)`, squares mod 11 `{1,3,4,5,9}`; all `≡ 3 mod 4`; Hilbert-symbol product would be `−1` | 2 never splits in `E_b`; local degree above 2 divides 4 | none |
| 6.1 degree step | `F₁⁺ = ℚ(√5)` | `F₁⁺E` of degree 16, eight five-adic places of degree 2, complement `12 > 8` | as stated | none |
| 6.2 Check 1 * | `𝔽₂₅ = 𝔽₅(μ)`, `μ² = 2`, `γ = diag(1,2)` | `det(μγ) = 4 = −1`, `(μγ)² = diag(2,3)`, `tr(μγ) = 3μ`; `|⟨SL₂(𝔽₅), μγ⟩| = 240`, determinants `{±1}`, scalars `{±1}` only | (4) fails although `ζ₅ ∉ F` | none |
| 6.2 Check 2 and image | `det ρ̄` of order 4; subgroup onto `PSL₂(𝔽₅)` | `[G_F:G] ≤ 120 < 240 = [G_F:H]`; even order, contains the unique involution `−1` | as stated | none |
| 7.1 | three nodes under `w`; `E'/w` | one or three fixed points; three would give arithmetic genus `3 − 2 + 1 = 2`; Riemann–Hurwitz `0 = 2(2g' − 2) + 4` gives `g' = 0`; thickness `2 + 1 = 1 + 1 + 1` | type `I₃` | none |
| 7.2 Check | `v(s) = 1, 5, 7` | `v(Δ_min) = 3, 15, 21` | 15 not protected | none |
| 7.3 | `v(q_A) = 3, 15`; non-split | `[[1,3],[0,1]]`; trivial; `−1` times a unipotent | as stated | none |
| 7.4 Check * | `y² = x³ − x`, `y² = x³ + 1` over `𝔽₅` | 8 points, trace `−2` (ordinary); 6 points, trace 0 (supersingular); discriminants `64`, `−432`, prime to 5 | as stated | none |
| 7.5 * | the transvections `[[1,3],[0,1]]`, `[[1,0],[3,1]]` | generated group has order 120 = `|SL₂(𝔽₅)|` | image `SL₂(𝔽₅)` | none |
| 8.1 Examples | `ℚ(√−1, √5)`, `ℚ(ζ₁₅)`, `ℚ(ζ₂₀)`, `K₆₀(μ₅)` | `(ℤ/2)²` has no `ℤ/4` quotient; `{a ∈ {1,29} : a ≡ 1 mod 5} = {1}`, so `K₆₀(μ₅) = ℚ(ζ₆₀)` | branches as stated | none |
| Downstream: ModularityAndLanglandsExtensions §2.29 | its head | its elliptic residual criterion assumes `ζ₅ ∉ F` | Theorem 8.1 removes it, as claimed | none |
| Declared gap | AG2.5 at head; all roadmaps | no statement of ACC23 Theorem 3.1.1 anywhere; PotentialAutomorphyInfrastructure cites the same AG2.5 item | gap stands | none |

Context and generality: `Suggested.lean` has no declarations, so there are no `variable` blocks to
check. The README's generality is unchanged except for the two precision fixes above.

## Unresolved

- **Declared supplier gap** `gap:acc-torsion-inertial-comparison` (AutomorphicGaloisRepresentationsPartII
  AG2.5, ACC23 Theorem 3.1.1). Theorem 5.3, and through it §§5.4, 6.2, 7.5 and 8.1, is conditional
  on it. No roadmap on main or at an open head states it. The accepted review is conditional on it.
- **Questions for human reviewers, carried over from the accepted review.** The new results rest
  on unrefereed texts (CaptainSude26, pseudonymous; LeHung26, a discussion draft; OpenAI26).
  CaptainSude26 has no licence file and is cited by locator only. MilneCM is classed
  `open-repository`.
- **Not verifiable by computation, carried over from the review.** The passage between Hecke
  algebras through nilpotent ideals in §§5.3–5.4 (CaptainSude26 lines 306–408). The local geometry
  of §7.1(c) beyond the fixed-node count, the genus check and the thickness sum.
- **Main moved during the job.** The citation resolver reported main at `2b9ce21` (index of
  2026-11-16T06:56:17Z) while this worktree branches from `0f9f711`. No cited roadmap changed state:
  all 17 open suppliers are still open at the heads listed above. The gate passed against the local
  `origin/main`.
- **Suspicious passages:** none. No text read during this job asked for anything outside the job.


Pull request: #2445 (roadmap/elliptic-curve-modularity-imaginary-quadratic-part-ii at 669904e)
