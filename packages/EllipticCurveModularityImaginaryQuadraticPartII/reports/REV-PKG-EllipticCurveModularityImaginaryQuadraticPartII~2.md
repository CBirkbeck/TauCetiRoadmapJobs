<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17981#issuecomment-6907100460 -->
Review (claude) of 160a122

Verdict: accepted
Conditional on the announced gaps: `acc-torsion-inertial-comparison`

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. The three findings of round 1 are repaired, the passages the repairs changed survive
the adversarial pass, the fifteen sampled targets match their sources at the cited locators, every
supplier citation resolves at the supplier's present head, every pinned declaration exists at the
pins, and the dependency check and the elaboration are clean. The acceptance is conditional on the
one declared supplier gap, `gap:acc-torsion-inertial-comparison`
(AutomorphicGaloisRepresentationsPartII AG2.5).

No maintainer note was left for this roadmap.

## Verified sound

### Round 1 findings, one by one

- **F01 (P2), the pins do have `L(E/K, s)`: repaired.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/README.md`
  lines 93–104 now read "The pins supply the elliptic-curve side: … Mathlib's
  `WeierstrassCurve.LFunction` and `WeierstrassCurve.LSeries` … which is the left side of
  `L(E/K, s) = L(π_E, s − 1/2)`" and "Neither library has … `L`-functions of automorphic
  representations of `GL₂(𝔸_K)` for a CM field `K` (Mathlib's `ModularForm.L` is …)". The module
  docstring of `Suggested.lean` (lines 19–27) says the same, and `### From Mathlib` has the new bullet
  (lines 228–237). Checked at the pin: `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` lines
  43, 79, 84; `Mathlib/NumberTheory/ModularForms/LFunction.lean` line 151 (`ModularForm.L`).
- **F02 (P3), `*Needs:*` lines and Dependencies omitted AG2.7 and Layer 3: repaired.** AG2.7 is now in
  the `*Needs:*` lines of §§2.1 (line 558), 2.2 (596), 6.1 (1222), 6.2 (1295), 7.4 (1451), 7.5 (1485)
  and in the Dependencies of Layers 2, 5, 6, 7; Layer 6 begins "Layers 3 and 5;" and Layer 7
  "Layers 1, 3 and 6;". I recomputed every "used by" list of the supplier contracts against the
  `*Needs:*` lines (21 supplier subsections): all agree.
- **F03 (P3), scope range of CrystallineLocalGlobalCompatibilityCM: repaired.** Line 73 reads
  "(§§7.5, 8.2–8.7, 9.1, 9.4–9.11)", the union of the contract and the `*Needs:*` lines; §9.3 is
  mentioned only as replaced (§4.2) and as a compared formula (§4.3).

The repaired pattern (a "the libraries lack X" claim) was searched in the rest of the package: the
remaining claims are "no automorphic forms or representations on `GL₂(𝔸_K)`", "no Weil–Deligne
representations or local Langlands", "no potentially semistable representations with Hodge–Tate
weights" and "`CMField.lean` has no statement about composita or subfields". Grep of both pins for
`WeilDeligne`, `AutomorphicRepresentation`, `AutomorphicForm`, `HodgeTate`, `otentiallySemistable`,
`IsCrystalline`: 0 files. `IsCMField` outside `CMField.lean`: only Tau Ceti's
`NumberTheory/NumberField/ComplexConjugation/` (complex conjugation and the maximal real subfield),
nothing on composita, intermediate fields or `IsCyclotomicExtension` over a CM base.

### Principles

No route-specific shortcut (Theorem 6.2 is stated for an arbitrary representation; §§3.3–3.5 for
every odd `p`); the parent is imported by section and name and is not planned again; no copied
passage; no algorithm; `Suggested.lean` declares nothing, so there is no `sorry`, no sorry'd data and
no `set_option`.

Dependency check output: `depcheck: 244 roadmaps, 2287 edges, 0 problem(s)`. No UPWARD, CYCLE or
`moved:` line. The roadmap is at line 206 of the merge order, directly after its parent (205);
EllipticCurveModularityTotallyReal (207), ModularityAndLanglandsExtensions (208) and
BianchiModularForms (209) are named only under "Outside this roadmap" and "Downstream consumers".
None of the roadmaps that may not be cited as suppliers is cited.

### Sources: the seeded sample

No locator is flagged as unverified by the author. All fifteen sampled targets were read at their
locators.

| Target | Locators opened | Result |
|---|---|---|
| 1.1 | MilneCM lines 273–300 (Prop. 1.4, Cor. 1.5, Rem. 1.6, p. 10); LeHung26 line 357 | Cor. 1.5 is the composite statement used for (a), Rem. 1.6 the conjugation criterion used for (b); Lemma 5.1 of LeHung26 is the descent that uses (b) |
| 2.2 | LeHung26 lines 292–299, 342–351, 357–360; CaptainSude26 lines 634–670; OpenAI26 lines 1131 (Prop. 9.3, p. 26), 1163 (Lemma 9.4, p. 27) | chain `p, 3, p`, descent and twist as stated |
| 3.1 | CaptainSude26 lines 187–192, 224, 234 | basis, `Ad(U)`, trace form, `M^G = 0` present |
| 3.2 | CaptainSude26 lines 231–241 | index 24, cyclic cohomology `k[f]` present |
| 3.3 | CaptainSude26 lines 177–183, 533–536 | the source fixes `ρ̄(τ) = U`, `ρ̄(φ) = 1`, `μ₅ ⊂ F_v`; the wider definition is the README's own and is checked in the table |
| 3.4 | CaptainSude26 lines 184–220 | `O[[a, u, z]]`, the matrix of `N`, `d² = ψ(φ)/q_v` present |
| 3.5 | CaptainSude26 lines 187–226 | tangent line and self-annihilation present; the counting proof is the README's |
| 4.1 | CaptainSude26 lines 227–241 | present |
| 4.2 | CaptainSude26 lines 242–263; AKT23 line 3979 (Lemma A.5, p. 86) | present; A.5 carries the projective-field clause that §4.2 replaces |
| 5.3 | CaptainSude26 lines 291–408 (299–314 for the sets); ACC23 lines 2309–2355 (pp. 57–58) | sets `S_aux`, `R_aux`, torus polynomial `(X − 1)²`, nilpotent quotients present |
| 6.2 | CaptainSude26 lines 264–498 (`μ₅ ⊂ F` at 267); CN23 lines 3849–3872 (Thm 5.2, pp. 73–74) | clauses (1)–(5) match; CN's (3) says "irreducible", the README "absolutely irreducible", as the parent's §5.2 states it |
| 7.1 | CaptainSude26 lines 503–532 | order `6p`, three nodes, `xy = s` to `uv = s²`, type `I₃` present |
| 7.3 | CaptainSude26 lines 533–536 | present |
| 7.4 | CaptainSude26 lines 538–603; CN23 line 4574 (Prop. 6.1.5, pp. 88–89); CHT08 line 5723 (Lemma 4.1.2, p. 116) | hypotheses of Prop. 6.1.5 match the statement |
| 8.1 | CaptainSude26 lines 26–33, 671–683; LeHung26 line 125 | present |

Also opened: LeHung26 lines 86–88 (Theorem 1.1), 303–321, 333–339, 352–355, 364–366; CN23 line 1236
(Definition 2.1.27). All eight cited works are in `sources.toml`, and the sections in which the
README cites each key equal its `cited_for` list (recomputed by script: 8 of 8).

### Adversarial table

Matrices over the stated field; `e = E₁₂`, `h = diag(1, −1)`, `f = E₂₁`, `U = 1 + e`, `D = Ad(U)`,
`N = D − 1` or `ρ(τ) − 1` as stated. Rows marked * were recomputed by machine in this round.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Lean paragraph, docstring: "pins supply `L(E/K, s)`" | Mathlib at the pin | line 79: Euler product over `HeightOneSpectrum (𝓞 K)` of `localEulerFactor` of the base change to the completion; line 84 `LSeries` | true | none |
| Mathlib bullet: four local polynomials | definition, lines 43–50 | good `1 − aX + qX²`, `a = q + 1 − #W'(κ)` on `W.minimal R`; split `1 − X`; multiplicative `1 + X`; else `1`; `q = Nat.card` (junk `0` only for infinite residue fields, never at a prime of `𝓞_K`) | as stated | none |
| Shift `s − 1/2` (§2.3 Check 3) | good place `q = 4`, `a = 4` | `1 − 4T + 4T² = (1 − 2T)²`; unitary roots `2/√4 = 1, 1`; `(1 − 4^(1/2)·4^(−s))⁻² = (1 − 2·4^(−s))⁻²` | both sides equal | none |
| Conventions: `Ad(U)`, Gram matrix * | `𝔽₅` | `UhU⁻¹ = [[1,3],[0,4]] = h − 2e`; `UfU⁻¹ = [[1,4],[1,4]] = f + h − e`; Gram determinant `−2` | agrees | none |
| Conventions: arithmetic Frobenius | `q_v = 11, 7` | `U¹¹ = U`; `U⁷ = [[1,2],[0,1]]`; `7⁻¹ ≡ 3 mod 5` | scalar Frobenius only for `q ≡ 1` | none |
| 1.1(a) | `K = ℚ(i)`, `L = ℚ(ζ₂₀)`; `S = {1, 2}`; `K = ℚ(2^(1/3))` | `Gal(L/K)` cyclic of order 4, middle field `ℚ(i, √5)`; `L = K`; in `S₃` a product of two transpositions is a 3-cycle moving `2^(1/3)` | true; needs `K` CM | none |
| 1.1(b) | `ℚ(i) ⊂ ℚ(i, √5) ⊂ ℚ(i, √3, √5)`; `ℚ(√5) ⊂ ℚ(ζ₂₀)` | seven quadratic subfields, roots of unity `μ₁₂`; `ℚ(√5)` totally real | true; "containing `K`" needed | none |
| 1.2 | `1 ⊕ 1` over `𝔽₃`, `ℚ ⊂ ℚ(ζ₃)`; `K = F` | `q = 2`: ratio `1 ≠ 2`; over `ℚ(ζ₃)` split primes are `≡ 1`, ratio `1 = q` | (a), (b) true; converse false, as its Check says | none |
| Layer 1 Example `K₆₀` | `(ℤ/60)ˣ` | `{1, 29}`; `29 ≡ 4 mod 5`, `29 ≡ 2 mod 3`; degree `16/2 = 8` | `ζ₅ ∉ K₆₀`, `K₆₀(ζ₃) = ℚ(ζ₆₀)` | none |
| 2.2 | `h(t)` a square; lift at 5 instead of 3 | `χ_(h(t)) = 1`, `π_E = π_B`; the five-adic clause can fail when `ζ₅ ∈ F` | route uses primes `3`, `p > 100` only | none |
| 2.5 / 8.1 | `K` imaginary quadratic; `ℚ(ζ₅)`; `K₆₀`; `ℚ(√−1, √5)` | `ℚ(ζ₅)/ℚ` cyclic of degree 4, so `ζ₅ ∉` a `(ℤ/2)²` field; `K₆₀(μ₅) = ℚ(ζ₆₀)` | branches as stated | none |
| 3.1 | `X = [[x,y],[z,−x]]`; char 2; `diag(2,3)` * | `UX − XU = [[z,−2x],[0,−z]]`; `UᵀX − XUᵀ = [[−y,0],[2x,y]]`; char 2: `1 ∈ ad⁰` is fixed; `Ad(diag(2,3))`: `e ↦ 4e`, `h ↦ h`, `f ↦ 4f` | `H⁰ = 0` iff `2 ∈ kˣ` | none |
| 3.2 * | `p = 5, 7, 3` | `Σ_{i<p} Dⁱ = p + C(p,2)N + C(p,3)N²`: coefficients mod `p` are `(0,0,0)`, `(0,0,0)`, `(0,0,1)`; so `H¹(⟨U⟩) = ad⁰/(ke ⊕ kh)` for 5, 7 and `0` for 3; index `120/5 = 24` | bijective only at 5 | none |
| 3.3 definition * | `M = [[0,−1],[1,−1]]`, `Φ = [[4,1],[0,1]]`, `q_v = 11`; Tate curve with `5 ∤ v(q_E)`, `5 | v(q_E)`; ramification index 5 | `M² = [[4,1],[4,0]] = M⁻¹`, `M³ = 1`, `ΦMΦ⁻¹ = [[4,1],[4,0]] = M¹¹`; a group of unipotents in `GL₂(k)` is a `p`-group, so it factors through `ℤ_p(1)` and is cyclic of order `p`; `U⁵ = 1` | not protected, protected, unramified, not protected. "Inertia nontrivial" is excluded by `M`, "inertia unipotent" by good reduction | none |
| 3.3 bullets | `ρ̄(φ) = [[a,b],[0,d]]`; `φ ↦ φτ^x` | `ρ̄(φ)Uρ̄(φ)⁻¹ = [[1,a/d],[0,1]]`, so `a/d = q_v`; `a(1 + bE₁₂)(1 + xE₁₂) = a(1 + (b + x)E₁₂)` | scalar iff `b ∈ 𝔽_p` | none |
| 3.4 (i) ⇔ (ii) ⇔ (iii) | `[[ζ₅,1],[0,ζ₅⁻¹]]`; `(1 + εf)U`; `(1 + εh)U` | traces `ζ₅ + ζ₅⁻¹ ≠ 2`; `2 + ε`; `2`, with `N = [[ε,1+ε],[0,−ε]]`, `N² = 0`; `ker N = im N` of rank one | holds over every `A ∈ CNL_O` | none |
| 3.4 Frobenius relation | `q = 11`, `δ = 1` | `tr = (q + 1)δ`, `qδ² = ψ(φ)`; `11·12² = 1584 = 12²·11`; the square root needs `p` odd | relative dimension 3 | none |
| 3.5 (a)–(d) * | `q ≡ 1`, `q ≡ 2 mod 5`; `p = 3`, `q = 4` | `M^(I_v) = ke`, `φ` scales `e` by `q_v`; `dim L_v = 3 − (3 − h⁰)`; `C(11,2), C(11,3) ≡ 0 mod 5`, `C(4,3) ≡ 1 mod 3`; `#H¹(M) = #H⁰(M)·#H⁰(M(1))` | (d) correctly restricted to `p ≥ 5` | none |
| 4.1 | no protected place; inertia of order 2; `Gal = G × A` | `H¹(G × A, M) = H¹(G, M)` when `M^G = 0`, since `Hom(A, M^G) = 0`; order 2 is invertible in `𝔽₅` | false without `P`, as its Check says | none |
| 4.2 * | `g = diag(2,3)`; `γ ∈ G_{LC_N}` | `Ad(g)` eigenvalues `4, 1, 4`; `κ(γσ₀) = κ(γ) + κ(σ₀)`; `Sym²` of dimension `3 ≤ p − 1` is irreducible | a detecting element exists; framing all of `P` breaks it | none |
| 4.3 | `(d, t, r) = (2, 1, 6)`, `(2, 3, 10)` | `g = 0`; `dim R^loc = 1 + 9 + 4 = 14`, `g = 6`, `20 = r + 4t − d`, `22 = r + 4t`; the formula `q − 3[F⁺:ℚ] − 1 + |S|` of CrystallineLocalGlobalCompatibilityCM §9.3 gives `6 − 6 − 1 + 1 = 0` | deficit `d` | none |
| 5.1 condition (ii) | `[F⁺:ℚ] = 40` with degrees `(8, 8, 24)` and `(8, 8, 8, 8, 8)`; `36` | `d_v + d_v' < d/2` with both `≥ 8` gives `d > 32`; at 36 both must be 8 and `8 ∤ 36`; `24 + 8 = 32 ≥ 20` fails, `16 < 20` holds | minimum 40 | none |
| 5.2, 5.4 counts | `d = 40`, `t = 10`, `R = ∅` | `1 + 10·11 = 111 = 1 + 3t + 2d`; `g = r − 111`; `dim R_∞ = 111`, `dim S_∞ = 151` | deficit `40 = l₀` | none |
| 5.3 | setting of the gap at `S_aux`, `R ∪ P ∪ Q` | (i) gives an imaginary quadratic subfield in which every prime below `S` splits; primes below `Q` split (§4.2); `P_{v,σ} = (X − 1)²` against `(X − χ_v(u))(X − χ_v(u)⁻¹)`; `[PGL₂(O):Iw] = 12` | the hypotheses of ACC23 §3.1 hold; `Q ∩ S^c = ∅` needed | none |
| 6.1 * | `p_b = 109`, `p_c = 2617`, `q = 11`; `E = ℚ(√31, √59, √71)` | 2617 prime, `≡ 1 mod 436`; `109 ≡ 2617 ≡ 10 mod 11`; `−436 ≡ 4`; `−2617 ≡ 108 mod 109`; residues mod 5 `(1, 4, 1)`, mod 11 `(9, 4, 5)`, squares mod 11 `{1, 3, 4, 5, 9}`; Hilbert symbols `+1` at every finite place and `−1` at `∞` if `−d_b ∈ ℚ₂ˣ²` | 2 never splits in `E_b`; local degree above 2 divides 4 | none |
| 6.2 | `ζ₅ ∉ F`, `det ρ̄` of order 2 over `𝔽₅` and `𝔽₂₅` | `det(2g) = 1`; `μ² = 2`, `γ = diag(1,2)`: `det(μγ) = −1`, `(μγ)² = diag(2,3)`; a scalar `c` in the coset needs `c² = −1`, `c = ±2`, and `cμ⁻¹ ∉ 𝔽₅`, so the scalars are `±1` and both projective kernels have index 120 | `ζ₅ ∈ F` is a hypothesis, not a consequence | none |
| 6.2 image | subgroup of `SL₂(𝔽₅)` onto `PSL₂(𝔽₅)` | even order, contains the unique involution `−1` | image is `SL₂(𝔽₅)` | none |
| 7.1 | three nodes under `w` | `2(P₀ + rT') = c₀` has one solution in `ℤ/3`; three fixed nodes would give arithmetic genus 2; thickness `2 + 1 = 1 + 1 + 1` | type `I₃` | none |
| 7.3 | `v(q_A) = 3, 15`; non-split | `[[1,3],[0,1]]`; trivial; `−1` times a unipotent | as stated | none |
| 7.4 | `Σ = ∅`; a place above 2 | the parent's `switch_five`; conflict with the mandatory Tate condition | hypotheses match CN23 Prop. 6.1.5 | none |
| 7.5 * | `[[1,3],[0,1]]`, `[[1,0],[3,1]]` over `𝔽₅` | generated group has order 120; `q` split completely gives `v ≠ v^c` and `μ₅ ⊂ K_v` | image `SL₂(𝔽₅)`; hypotheses of 6.2 hold at `P` | none |
| Declared gap | ACC23 lines 2309–2355 | setting, `N`, `I_R`, `G_{F, S∖(R^c∖R)}`, `P_v`, `P_{v,σ}` match; AG2.5 at its head has no torsion statement (searched "3.1.1", "torus", "Iwahori places") | precise, minimal, same slug in `design/plan.json` and README | none |

### Pinned declarations opened

Mathlib `1b1ccf4b…`: `NumberField.IsCMField` (`NumberTheory/NumberField/CMField.lean:70`),
`of_isAbelianGalois` (542), `IsCyclotomicExtension.Rat.isCMField` (564, hypothesis `∃ n ∈ S, 2 < n`),
`NumberField.isTotallyComplex_of_algebra` (`InfinitePlace/TotallyRealComplex.lean:229`),
`Matrix.SpecialLinearGroup.toGL` (`GeneralLinearGroup/Defs.lean:369`), `groupCohomology.map`
(`Functoriality.lean:141`), `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` (`FiniteCyclic.lean:114`),
`Matrix.SL2.commutator_eq_top` (`SpecialLinearGroup.lean:804`, `a ≠ 0`, `a² ≠ 1`),
`Representation.linHom` (`RepresentationTheory/Basic.lean:655`), `continuousCohomology`
(`ContCohomology/Basic.lean:131`), `NumberField.AdeleRing` (`AdeleRing.lean:56`),
`WeierstrassCurve.localPolynomial`, `LFunction`, `LSeries`, `ModularForm.L`. Tau Ceti `2fd255d9…`:
`TauCeti.ClassFieldTheory.eulerCharacteristic_mixed` (`EulerCharacteristic/Theorem.lean:98`),
`tateDualityPairing_perfect_mixed` (`Duality/Perfect.lean:280`), `GalRep` (`MuNRep.lean:130`),
`WeierstrassCurve.tateModuleGaloisRepresentation` (`TateModule/Galois.lean:80`).

### Supplier citations resolved at the present heads

Parent EllipticCurveModularityImaginaryQuadratic (open): all 25 cited sections exist (§§0.2, 0.3,
1.1, 1.3, 2.1–2.3, 4.1, 4.2, 4.4, 5.1–5.3, 6.1, 6.3, 6.5, 6.6, 7.1, 7.2, 7.4, 8.1, 8.3–8.6; several
are bold run-in headings) and all 41 backticked names occur. Read for content: §5.2
(`potentiallySemistableCM`, any CM field, with the five-adic clause), §5.3 (`cm_modularity`, "any CM
number field `L` with `ζ₅ ∉ L`"), §7.4 (arbitrary number field; items 1–3 as used in §2.1),
§0.3 (`switch_five`: "`ζ₅ ∉ F` is not a hypothesis"; `hilbert_local_selection`: finitely many opens;
`auxiliary_local_types`), and its closing section, which records `K₆₀` and places other CM fields
outside its scope.

Others, each heading found: CrystallineLocalGlobalCompatibilityCM §§7.5, 8.2–8.7, 9.1, 9.3–9.12
(§9.1 clauses (5)–(15) and the §9.3 formula read); AutomorphicGaloisRepresentationsPartII AG2.0,
AG2.5, AG2.7 with `IsDecomposedGenericPrime`, `decomposedGenericPrime_local`, `IsDecomposedGeneric`;
PotentialAutomorphyInfrastructure §§2.1, 2.3, 2.5 with their three names (§2.3 asks for a Galois
soluble extension: `F/K`, `L/K` and `F'/F` here are Galois); MordellLawrenceVenkatesh §§1.3–1.4;
ArithmeticGaloisRepresentations §§2.1, 4.3, 6.3, 7.2, 7.7, 7.9 (`adZeroRep` is declared in its
`Suggested.lean`); ArithmeticGaloisDuality R02.2, R02.4.2 (the exact-annihilator statement assumes
`M` unramified, as §3.5 says); LocalGaloisDeformationRings §§1.10, 2.3, 2.5, 2.6, 2.8, 2.15, 2.16,
2.21, 3.14, 4.14, 4.15, 6.6; GlobalGaloisDeformations §§3.4, 3.6, 3.7, 5.1, 5.5, 5.6;
DeformationAndDerivedPatchingAlgebra §§8.1–8.5; GL2ModularityLifting §1.7
(`cht_soluble_prescribed_completions`); PotentialModularityAndCompatibleSystems §§2.12–2.16;
GL2AutomorphicRepresentationsAndTransfer R16.3.2, R17.4.16; AutomorphicGaloisRepresentations §3.13;
FaltingsFinitenessAndIsogenyTheorems R28.6.2, R28.6.3; NeronModelsAndSemistableAbelianVarieties
§§3.1, 3.12, 5.1; on main AbelianSchemesAndArithmeticModuli A6, EllipticCurves Layers 4–5,
ClassFieldTheory Layers 5 and 11, SchemeAndStackFoundations §§4.13, 4.18, Chebotarev Layer 10. The
four leads of `scratch/citations.md` are three source ids and `ResidualImage.adZeroRep`; none is a
defect.

### Duplication and overlap

`scratch/overlaps.md` lists no shared roadmap, no dropped id and no revision-only id. By object,
searched across the open heads and main ("CaptainSude", "protected place", "every CM field", "all
CM fields", "Theorem 3.1.1"): no other roadmap states modularity over all CM fields, the protected
condition or the lifting theorem with a protected place. The conjugation criterion is cited from
MordellLawrenceVenkatesh, not restated; `switch_five` and CN23 Theorem 5.2 stay with the parent, and
§7.4 and Theorem 6.2 are the variants with retained places and with the protected alternative.

Overlap check: read EllipticCurveModularityImaginaryQuadratic, EllipticCurveModularityTotallyReal,
PotentialAutomorphyInfrastructurePartII, CrystallineLocalGlobalCompatibilityCM,
OrdinaryAutomorphicFormsAndModularityLiftingPartII; nothing shared.

### Shape, Lean form, headlines, padding

27 targets in 8 layers; each has its hypotheses, a locator, a `*Needs:*` line and three to seven
Checks; the three definitions (§§3.3, 5.1, 5.2) have API bullets; every layer ends with Examples and
Dependencies; layers are named by their mathematics. Searched for LaTeX delimiters, process words,
pull-request numbers, HTML anchors and machine paths: none.

`lake env lean` on `Suggested.lean` from the content checkout: exit 0, no message (nothing is
declared, so not even a `sorry` warning). Headlines named by the Summary: Theorems 2.5, 6.2, 8.1.
None is statable at the pins (each needs automorphic representations of `GL₂(𝔸_K)` and `r_ι(π)`;
6.2 also potentially semistable representations), and each is named in the module docstring with
what it lacks. There is no sorried theorem, so the one-tactic probe and the `#check @name`
comparison have nothing to run on. No backticked name in the README is presented as a declaration
of this roadmap. Import header: `import Mathlib` only.

### Copyright and arrangement

Locators in the README body by source: CaptainSude26 26, CN23 16, ACC23 14, LeHung26 9, OpenAI26 4,
CHT08 2, MilneCM 2, AKT23 1 (74). Contents of CaptainSude26 (§2 construction, §3 local and Galois
cohomology, §4 lifting, §5 auxiliary curve, §6 conclusion) against the layers: its §3 is split
between Layers 3 and 4, Layer 6 is a general theorem it does not state, built from the proof of its
Proposition 5.2, Layer 1 is absent from it, its §2 is imported from the parent and its §6 appears in
Layers 2 and 8. The order of Layers 3 to 8 is forced by the `*Needs:*` lines of §§4.1, 5.2, 5.4,
6.1, 6.2, 7.5 and 8.1. No table, figure or list is taken over: the lifting table of LeHung26 (lines
346–349) appears as one sentence of §2.2.

Source independence: 22 passages (the 15 sampled targets, §§1.2, 2.4, 5.1, 6.1, 7.2, the gap
contract and the module docstring) compared with 6 sources (CaptainSude26, LeHung26, CN23, ACC23,
MilneCM, CHT08), none shared, longest common run about 8 words in a hypothesis list; largest share
CaptainSude26, 26 of 74 locators; contents compared with CaptainSude26: independent.

## Not verifiable

- The patching argument of §§5.3–5.4 as a whole. Its hypotheses, the torus polynomial, the
  exclusions at `P^c` and `Q` and every dimension count were checked; the passage between Hecke
  algebras through nilpotent ideals rests on CaptainSude26 lines 306–408, an unrefereed text, and
  cannot be confirmed by computation.
- The local geometry of §7.1(c) (the `A₁` point and the rationality of the quotient components)
  beyond the fixed-node count, the genus check and the thickness sum.

## Source issues

- **Error** in CaptainSude26 at Notation, p. 2 (lines 63–66): the source says decomposed genericity asks the Frobenius eigenvalue ratio to avoid `1`, `q` and `q⁻¹`, and that this is CN's Definition 2.1.27; it should be that the ratios avoid `q` (hence `q⁻¹`) only, as at CN23 line 1239; affects nothing.

## For the human reviewers

- **Scope.** The new results rest on unpublished texts: CaptainSude26 (pseudonymous GitHub manuscript, 26 of 74 locators), LeHung26 (discussion draft), OpenAI26 (preprint). I found no refereed source stating Theorems 6.2 or 8.1.
- **Scope.** LeHung26 Theorem 1.1 (line 86) assumes three inputs taken from OpenAI26; the README states Theorem 2.5 without them, as targets of the parent roadmap.
- **Licence.** `sources.toml` records that the CaptainSude26 repository has no licence file and classes it `author-page`; the README cites it by locator only.
- **Licence.** `sources.toml` classes MilneCM, fetched from the author's own site, as `open-repository`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "160a122eb495f95a8c207aa9597e6339f16dc27e", "job": "REV-PKG-EllipticCurveModularityImaginaryQuadraticPartII~2", "model": "fable", "worker": "chris-x89"} -->
