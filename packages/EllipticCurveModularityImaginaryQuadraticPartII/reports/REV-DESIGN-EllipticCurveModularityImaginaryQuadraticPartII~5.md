<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7660#issuecomment-6722125572 -->
Review (claude) of 4cd5bbc

Verdict: needs_changes

1. **F01** (P3) §3.1's vanishing of invariants is ArithmeticGaloisRepresentations §7.7 for finite fields of odd characteristic other than `𝔽₅`

   Location: `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md` lines 546–548, "that
   if `2 ∈ k^×` the invariants vanish: … so `H⁰(SL(2, k), ad⁰) = 0`"; line 556 `*Needs:*`; `design/plan.json`
   target 3.1 `statement` and `prerequisites` (ArithmeticGaloisRepresentations §7.2 and §7.9 only).

   Claim: the repair report of round 5 says §3.1 "keeps only two facts the supplier does not state", the
   triviality of `−1` and the vanishing of `H⁰(SL(2, k), ad⁰)` for `2 ∈ k^×`.

   Witness: ArithmeticGaloisRepresentations README at its open head, §7.7 "`SL₂` with adjoint coefficients"
   (line 5065): for `F` finite of odd characteristic with `#F ≠ 5`, `H⁰(SL₂(F), ad⁰) = H¹(SL₂(F), ad⁰) = 0`.
   So for `k = 𝔽₃, 𝔽₇, 𝔽₉, …` the vanishing is already stated by the supplier, and the sentence of the repair
   report is inaccurate there. It is accurate for `k = 𝔽₅` (the case Layer 4 uses: `M^(SL₂) = 0` in §4.1 and
   the vanishing of global invariants in §4.3), for its extensions, and for every field of characteristic
   zero, which §7.7 does not cover.

   Repair (tested on `k = 𝔽₅`, which §7.7 does not cover and which stays a target here, and on `k = 𝔽₇`, which it
   does): in §3.1, after "so `H⁰(SL(2, k), ad⁰) = 0`", add "for finite `k` of odd characteristic other than
   `𝔽₅` this is ArithmeticGaloisRepresentations §7.7; the statement here covers `𝔽₅`, its extensions and every
   field with `2 ∈ k^×` by the same two commutators"; add "§7.7" to the `*Needs:*` line of §3.1 (it already
   lists §§7.2, 7.9); in `design/plan.json` target 3.1 add `roadmap:ArithmeticGaloisRepresentations §7.7` to
   `prerequisites` and the same clause to `statement`. Nothing else changes: Layer 3 Dependencies (line 707)
   and the supplier row (line 261) already name §7.7.

One finding (R01, P3, non-blocking) on the passage the round-4 repair rewrote; no P1 or P2, so the verdict
is needs changes and the fix round applies R01 before the port. The design relies on the declared supplier gap `acc-torsion-inertial-comparison` (AutomorphicGaloisRepresentationsPartII
AG2.5), which is precise, minimal and declared in both `design/plan.json` and the README. Files reviewed:
`packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md` (1299 lines), `design/plan.json`
(8 layers, 28 targets of which one is the Layer 1 example, 3 definitions, 91 tests, 1 gap), `sources.toml`
(8 entries, unchanged this round).

## Repairs of round 4, finding by finding

- **F01 (§3.1 restated the trace-zero adjoint owned by ArithmeticGaloisRepresentations §7.2) — repaired,
  applied differently and correctly.** README lines 540–545: "let `ad⁰` be the trace-zero adjoint of the
  tautological representation of `SL(2, k)` on `k²`, imported from ArithmeticGaloisRepresentations: for the
  abstract group `SL(2, k)` it is that roadmap's §7.9 `ResidualImage.adZeroRep` of
  `Matrix.SpecialLinearGroup.toGL`, on the trace-zero endomorphisms
  `LinearMap.ker (LinearMap.trace k (Fin 2 → k))` with `g · X = g X g⁻¹`; for finite `k` … it is its §7.2
  *ContinuousRep.adZero*". Lines 550–554 cite the trace form, its perfectness for `2 ∈ k^×` and base change
  from §7.2. The two facts proved here are the triviality of `−1` and the vanishing of invariants (R01
  above for the citation of §7.7). The reviewer's suggested carrier `LieAlgebra.SpecialLinear.sl (Fin 2) k`
  was rightly replaced: at the head of ArithmeticGaloisRepresentations (#856), `Suggested.lean` line 386
  declares `ResidualImage.adZeroRep {G : Type} [Group G] (r : G →* GL n k) : Representation k G
  (LinearMap.ker (LinearMap.trace k (n → k)))` as a subrepresentation of
  `Representation.linHom (matrixRep r) (matrixRep r)`, so the carrier named in the README is the one the
  supplier declares, and `Matrix.SpecialLinearGroup.toGL : SpecialLinearGroup n R →* GeneralLinearGroup n R`
  (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`:369) is the homomorphism it takes. The
  profiniteness remark is right too: AGR line 740 has the standing hypothesis "`Γ` is profinite" for
  `ContinuousRep`, so §7.2 applies to `SL(2, k)` only for finite `k`, which is what the README says. The
  same change is carried through: Scope line 42–46, "Imported, never re-planned" lines 67–71, the
  Conventions bullet lines 125–131, the Mathlib row lines 164–169 (the `LieAlgebra.SpecialLinear.sl` and
  `Rep.ofDistribMulAction` rows are gone), the supplier row lines 256–264, §3.2 `*Needs:*` line 586–587,
  §3.5(b) line 670 and its `*Needs:*` line 683, Layer 3 Dependencies line 706–709; `plan.json` target 3.1 is
  `kind: theorem`, `api: []`, prerequisites AGR §7.2, §7.9, `Matrix.SpecialLinearGroup`,
  `Matrix.SpecialLinearGroup.toGL`, four tests; targets 3.2 and 3.5 and the AGR supplier entry carry §7.2
  and §7.9. Grep: `sl2AdjointRep` and `Rep.ofDistribMulAction` occur nowhere in the README or plan.

The same pattern elsewhere: grep of the README for "Define" finds exactly the three definitions 3.3, 5.1,
5.2 (plan: 3 definitions), none of which restates a supplier object (ownership grep below).

## Adversarial pass on the repaired passages and the sampled targets

Values by hand or by `calc/adv.py` in the scratch directory (pure Python: `SL₂(𝔽_p)` by enumeration,
cocycle spaces by consistency along the Cayley graph on `U`, `Uᵀ`, `𝔽₂₅ = 𝔽₅[μ]/(μ² − 2)` by pairs, degree
enumeration for §5.1).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 3.1 `−1` acts trivially (repaired) | `p = 2, 3, 5, 7`, all `X ∈ ad⁰` | `Ad(−1)X = X` for every `X`; for `p = 2`, `−1 = 1` | holds in every characteristic | — |
| 3.1 invariants vanish for `2 ∈ k^×` (repaired) | `SL₂(𝔽_p)`, `p = 3, 5, 7` | `H⁰` has `1` element (zero) at `p = 3, 5, 7` (orders `24, 120, 336`); fixed by `U` alone: `p` elements (the line `k e`); fixed by `U, Uᵀ`: `1` | holds; the transpose is needed, as Check 1 says | R01: cite §7.7 for finite `k ≠ 𝔽₅` |
| 3.1 Check 3, characteristic two | `SL₂(𝔽₂)` of order `6` | `H⁰ = {0, 1}` (`𝔽₂·1`), `U`-fixed space `4` elements, Gram `[[0,0,1],[0,2,0],[1,0,0]]` with `2 = 0` | hypothesis `2 ∈ k^×` is needed | — |
| 3.1 Check 1, 2, 4 | `U`, `diag(2, 3)`, `𝔽₅` | `Ad(U)e = e`, `Ad(U)h = [[1,3],[0,4]] = h − 2e`, `Ad(U)f = [[1,4],[1,4]] = f + h − e`; `D` columns `(1,0,0), (3,1,0), (4,1,1)`; `(D − 1)² f = 3e = −2e ≠ 0`, `(D − 1)³ = 0`, `D⁵ = 1`; `Ad(diag(2,3)) = diag(4, 1, 4)` on `(e, h, f)` | correct | — |
| Conventions: trace form | basis `e, h, f` | Gram `[[0,0,1],[0,2,0],[1,0,0]]`, determinant `−2`; AGR §7.2 gives `ad⁰ ≅ (ad/A·1)^∨` and `ad⁰ ≅ ad/A·1` iff `2 ∈ A^×` | self-duality for `2 ∈ k^×` is §7.2 as cited | — |
| 3.2 restriction | `q = 3, 5, 7` | `dim Z¹, B¹, H¹` of `SL₂`: `(3,3,0)`, `(4,3,1)`, `(3,3,0)`; of `⟨U⟩`: `(2,2,0)`, `(3,2,1)`, `(3,2,1)`; norm `1 + ⋯ + D⁴ = 0` over `𝔽₅`; `ker(D − 1) = k e` | bijective at `5` only, as the Checks say | — |
| 3.3 Frobenius normal form | `g U g⁻¹ = U^q` over `𝔽₅`, `q = 11, 7` | `20` solutions each, all upper triangular, ratio `a/d = 1` (`q = 11`), `2` (`q = 7`); `g E₁₂ g⁻¹ = (1/det)[[−ac, a²],[−c², ac]]` forces `c = 0`, `a/d = q` | API bullet 2 holds at every `q_v` | — |
| 3.3 Checks | `M = [[0,−1],[1,−1]]`, `Φ = [[4,1],[0,1]]`, `q = 11`; `q = ϖ⁵` | `M³ = 1`, `ΦMΦ⁻¹ = [[4,1],[4,0]] = M⁻¹ = M¹¹`, `tr M = −1`, `det M = 1`; `5 \| v(q)` gives trivial residual inertia | non-examples correct | — |
| 3.4 equivalences | `N = ρ(τ) − 1` | `(X−1)² = X² − tr(1+N)X + det(1+N)` gives `tr N = 0`, `det N = 0`, so `N² = 0` (Cayley–Hamilton), and back; `(1+N)^x = 1 + xN`; `ρ(φ)Nρ(φ)⁻¹ = qN` with the normal form above gives `ρ(φ) = [[qδ, z],[0, δ]]`, `δ² = ψ(φ)/q`; `q·tr² = q(1+q)²δ² = (1+q)²ψ(φ)`; `q = 11`, `δ = 1`: `11·144 = 1584` | (i)⇔(ii)⇔(iii) with LGDR §2.3's rank conditions (`ker N` of rank one, `ker N²` everything); relation matches LGDR §2.5's `q(tr Φ)² = (1+q)² det Φ` | — |
| 3.5(a), (c), (d) | `q ≡ 1 mod 5`, `ρ̄(φ) = 1` | `Σ_{i<11} Dⁱ = 1`, so `(D − 1)c(φ) = 0`, `c(φ) ∈ k e`; `Z¹ = 4`, `B¹ = rank(D − 1) = 2`, `H¹ = 2`; framed tangent `3 = dim L_v + 3 − h⁰` gives `dim L_v = h⁰`; `h⁰ = 1` iff `φ` fixes `e`, i.e. `q_v ≡ 1 mod p` | as stated | — |
| 4.1 route | `Gal(LC_N/F) = SL₂(𝔽₅) × A` | `L ∩ C_N = F` (perfect vs abelian); `H¹(A, M)^{SL₂} = Hom(A, M^{SL₂}) = 0`; `I_v → SL₂(𝔽₅) × {1}` onto an order-five subgroup since `C_N/F` is unramified at `v ∤ 5`; inflation on `H¹` injective | sound | — |
| 4.2 detection | `diag(2, 3)` | `6 ≡ 1`, eigenvalues `2 ≠ 3`, coinvariants on `ad⁰` the line `k h` (`e, f` scaled by `4`) | one-dimensional as the Check says | — |
| 4.3 / 5.2 / 5.4 counts | `(d, t, r) = (2,1,6)`, `(2,3,10)`, `(40,10,111)` | `g = r − 3d − 1 + t = 0, 6, 0`; `dim R^loc = 1 + 3t + 2d = 11, 14, 111`; `dim R_∞ = r + 4t − d = 8, 20, 111`; `dim S_∞ = 1 + (4t − 1) + r = 10, 22, 151`; deficit `d` | agrees with CLGC §9.3's `q − 3[F⁺:ℚ] − 1 + \|S\|` at `T = S` | — |
| 5.1 degrees | multisets of multiples of `4`, each `≥ 8`, sum `16 … 44` | none satisfies (ii) up to `36`; `40`: only `(8⁵)`; `(8, 8, 24)` fails; `44`: `(8⁴, 12)`, `(8, 12³)` | third Check correct | — |
| 6.2 first Check | `𝔽₅`; `𝔽₂₅`, `μ² = 2`, `h = diag(1, 2)` | `det(μh) = 4 = −1`, `tr(μh) = 3μ`, `(μh)² = diag(2, 3)`; `⟨SL₂(𝔽₅), μh⟩` has order `240`, determinants `{1, −1}`, projective image of order `120` | (4) fails with `ζ₅ ∉ F`; `ζ₅ ∈ F` is a genuine hypothesis | — |
| 6.2 protected alternative | `ζ₅ ∈ F`, (4) fails | preimage of `PSL₂(𝔽₅)` in `SL₂(k̄)` is `±SL₂(𝔽₅) = SL₂(𝔽₅)`; a subgroup onto `PSL₂(𝔽₅)` has order `60` or `120`, even, contains the unique involution `−1`, so is all of `SL₂(𝔽₅)` | sketch valid | — |
| 7.1 (b) | lifts of `[−1]` to `E'` | `g(Q) + Q ∈ ker π` constant, so `g(Q) = −Q + c₀`; fixed points `2Q = c₀`; on the coset `P₀ + jT'`, `2j ≡ m mod 3` has one solution | exactly one fixed node; genus `2` excludes three | — |
| 7.1 (c) | `xy = s`, `(x, y) ↦ (−x, −y)` | invariants `u = x², v = y²`, `uv = s²` (`A₁`); thicknesses `2 + 1 = 3 = 1 + 1 + 1` | `I₃` | — |
| 7.2 Checks | `v(s) = 5, 1, 7` | `v(Δ_min) = 15, 3, 21`, residues `0, 3, 1 mod 5` | correct | — |
| 7.5 Check 1 | `[[1,3],[0,1]]`, `[[1,0],[3,1]]` | generated subgroup of `SL₂(𝔽₅)` has order `120`; parent §7.1: `c = 2 − λ − λ⁻¹ = 3` for a cube root `λ`, word `[[1,σc],[0,1]][[1,0],[τc,1]]^k` | coefficient `3` confirmed at the parent's head | — |
| 1.1 Checks | `(ℤ/20)ˣ`, `(ℤ/60)ˣ` | fixer of `ℚ(i)`: `{1, 9, 13, 17}` of orders `(1, 2, 4, 4)`, cyclic; `K₆₀`: `{1, 29}`, `29 ≢ 1 mod 5`, `29 ≢ 1 mod 3` | correct | — |
| 1.2 descent | `K = F = ℚ`; `1 ⊕ 1` mod `3` at `q = 2` | ratio `1 ≠ 2 = 2⁻¹ mod 3`; over `ℚ(ζ₃)` split primes are `≡ 1 mod 3` | converse fails as the Check says; AG2.7's predicate (complete splitting, unramified and generic at every `v \| p`) descends place by place | — |
| 2.2 / 2.3 / 2.5 | lifting primes `3`, `p > 100`; `q = 4`, `a = 4` | no lift at `5`, so the `ℓ = 5` clause of parent §5.2 never applies; CN Theorem 5.2 is stated for every odd `p` (line 3849); `T² − 4T + 4 = (T − 2)²`, unitary roots `1` | inputs are Theorems 2.1–2.4 only | — |
| Conventions: Frobenius | `U` over `𝔽₅`, `q = 11, 7` | `U¹¹ = U`; `U⁷ = [[1,2],[0,1]]`; `7⁻¹ ≡ 3`, `U³ = [[1,3],[0,1]]` | arithmetic Frobenius pinned | — |

## Verified sound

**Principles.** General library: Theorem 6.2 for an arbitrary representation, Theorem 2.5 for every CM
field without `ζ₅`, Theorem 8.1 for every CM field. The parent is imported by section and name (26
sections and 41 backticked names resolved at #1048, lines listed below) and never re-planned; Theorems
2.2–2.4 apply its §§8.3–8.6 over a CM base and say so. Supply is one-directional (gate below). No copied
passage (each sampled target compared with the source wording at its locator). No computational
algorithm. The design plans no Lean declaration: no `set_option`, no sorry'd data.

**Dependency check**, run as instructed:

```
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 237 roadmaps, 2358 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every roadmap in a `*Needs:*` line, a Dependencies paragraph or the supplier
contracts is earlier in `merge-order/ORDER.txt` or on main; ModularityAndLanglandsExtensions and
BianchiModularForms occur only as consumers.

**Citation resolver and overlaps.** `scratch/citations.md`: three leads `LeHung26, §4.4` (line 355),
`OpenAI26, §9.4` (464), `CaptainSude26, §4` (826) are manifest source ids followed by section signs,
i.e. source locators; the Lean-name lead `ResidualImage.adZeroRep` (README line 69) is a declaration of
ArithmeticGaloisRepresentations' `Suggested.lean` at its head (line 386), named as that roadmap's own, not
as a pinned declaration, so the lead is a false positive. `scratch/overlaps.md`: no open pull request
changes this roadmap, no cited id is dropped, none is defined only by an open revision; the closest
roadmaps in vocabulary are the parent, CrystallineLocalGlobalCompatibilityCM, GlobalGaloisDeformations,
ModularityAndLanglandsExtensions and PotentialModularityAndCompatibleSystems, all suppliers here. The board
index lists AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory: unrelated.

**Ownership by object** (`roadmaps grep -i --readme-only` over main and the 471 open heads, index of
2026-11-08T13:06:57Z): "protected place", "unipotent-inertia", "Steinberg-protected", "containing ζ₅": no
match; "width-three": only a Tate-chart remark of AlgebraicModularFormsAndSerreWeights (line 706);
`H¹(SL₂(F_5), ad⁰)`: only ArithmeticGaloisRepresentations §7.7, cited; "trace-zero adjoint": owned by
ArithmeticGaloisRepresentations §7.2 (line 4503 "it owns the trace-zero adjoint"), and ArithmeticGaloisDuality
D8 (line 6813) cites it from there, adding only its cohomological boundary; "Theorem 3.1.1" of ACC: only
PotentialAutomorphyInfrastructure's supplier row (line 210, pointing at AG2.5) besides other papers'
theorems, so ACC Theorem 3.1.1 is owned nowhere and the gap stands; "every CM field": no modularity
statement elsewhere.

**Pins.** `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti
`2fd255d997f47c0b5d834ee416c7015d55444ce5`, equal to `plan.json` `baseline` and README lines 151, 182.
Opened (file:line at the pin): `Matrix.SpecialLinearGroup.toGL` `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`:369;
`LinearMap.trace` `Mathlib/LinearAlgebra/Trace.lean`:75; `Representation.linHom`
`Mathlib/RepresentationTheory/Basic.lean`:655; `groupCohomology.map` `…/GroupCohomology/Functoriality.lean`:141;
`Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` `…/GroupCohomology/FiniteCyclic.lean`:114;
`Matrix.SL2.commutator_eq_top` `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean`:804;
`NumberField.IsCMField` `Mathlib/NumberTheory/NumberField/CMField.lean`:70, `complexConj` :142,
`isConj_complexConj` :148, `ofCMExtension` :510, `of_isAbelianGalois` :542, `IsCyclotomicExtension.Rat.isCMField`
:564; `IsCyclotomicExtension` `Mathlib/NumberTheory/Cyclotomic/Basic.lean`:74;
`NumberField.isTotallyComplex_of_algebra` `…/InfinitePlace/TotallyRealComplex.lean`:229;
`TauCeti.ClassFieldTheory.eulerCharacteristic_mixed` `TauCeti/NumberTheory/ClassFieldTheory/Local/EulerCharacteristic/Theorem.lean`:98;
`TauCeti.ClassFieldTheory.tateDualityPairing_perfect_mixed` `TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/Perfect.lean`:280.
Tau Ceti at the pin has no automorphic-representation, Weil–Deligne, Hodge–Tate or potentially-semistable
carrier (grep over `TauCeti/`; the `IsModular` hits are modular lattices), so the README's Lean paragraph
(lines 80–89) is right that Theorems 2.5, 6.2 and 8.1 are not statable and that `Suggested.lean` states
nothing with the three named in its docstring.

**Cross-roadmap citations resolved at the current heads** (line of the cited README):
- EllipticCurveModularityImaginaryQuadratic (#1048): §0.2 535, §0.3 671, §1.1 861, §1.3 958, §2.1 1014,
  §2.2 1040, §2.3 1084, §4.1 1259, §4.2 1308, §4.4 1386, §5.1 1436, §5.2 1537 ("L is CM, ℓ is odd"), §5.3
  1599 ("any CM number field L with ζ₅ ∉ L", ℓ ∈ {3, 5}), §6.1 1643, §6.3 1702, §6.5 1760, §6.6 1803,
  §7.1 1855 (coefficient `c = 3` for `m = 3`, the word `[[1,σc],[0,1]][[1,0],[τc,1]]^k`), §7.2 1904, §7.4
  1981 (arbitrary number field `k`, conclusions (1)–(3)), §8.1 2088, §8.3 2141, §8.4 2188, §8.5 2227, §8.6
  2285, Downstream consumers and boundaries 2352; names `fixed_pairing_twist_rational` 586,
  `solvable_preparation` 653, `hilbert_local_selection` 713 ("nonempty open subsets Ω_w … at all the finitely
  many selected places"), `seed_modular` 697, `switch_five` 778 ("ζ₅ ∉ F is not a hypothesis"),
  `modular_elliptic_all_coefficients` 676 and its four components 738–741, `auxiliary_local_types` 790,
  `potentiallySemistableCM` 1539, `cm_modularity` 1601, `simultaneous_specialization` 1987,
  `switchParameterOpen` 865, `cyclicCover` 960, `boundary_regular_model` 1022, `compactTypeModel` 1042,
  `compact_type_jacobian` 1048, `nodalModel` 1086, `characterSystem` 1262, `character_system_properties`
  1266, `cubic_character_elliptic` 1321, `auxiliaryEllipticCurve` 1320, `trivial_character_twist` 1315,
  `prime_switch_congruences` 1389, `nonCM_elliptic_large_residual_primes` 47,
  `finite_torsion_locally_constant` 1647, `local_reduction_constancy` 1705, `local_type_opens` 1763,
  `character_local_types` 1805, `switchCoefficient` 1866, `character_regular_word` 1871,
  `character_automorphy_change_prime` 2090, `character_automorphic_local_type` 2099,
  `complexInfinityParameter` 2250, `elliptic_full_local_comparison` 2231, `cm_elliptic_realization` 2289,
  `imaginary_quadratic_modularity` 12, `cyclotomic_switch_field` 1519.
- CrystallineLocalGlobalCompatibilityCM (#1182): §7.5 1447, §8.2 1509, §8.3 1529, §8.4 1545, §8.5 1553,
  §8.6 1561, §8.7 1588 (hypotheses `p` odd, `ρ̄_m` absolutely irreducible, `ζ_p ∈ F`, trivial `K_S`-action
  modulo `ϖ`, as §5.1's third bullet says), §9.1 1616, §9.3 1654 (`g = q − 3[F⁺:ℚ] − 1 + |S|`, the `p = 5`
  projective-field exclusion), §9.4 1676, §9.5 1702, §9.6 1722, §9.7 1738 (`*Needs:*`
  AutomorphicGaloisRepresentationsPartII AG2.5), §9.8 1746, §9.9 1766, §9.10 1774, §9.11 1794 (the
  preparation items §6.1 lists), §9.12 1810.
- ArithmeticGaloisRepresentations (#856): Layer 1 734, §4.3 3148 (Dickson, perfectness via
  `Matrix.SL2.commutator_eq_top`), §6.3 4143 (`E_q[ℓ^n]` unramified iff `ℓ^n | v(q)`, `WD ≅ Sp(2)`), §7.2
  4496, §7.7 5032 (Sylow injectivity, `H¹(SL₂(F_5), ad⁰)` one-dimensional, coefficient change,
  `H⁰(SL₂(F), ad⁰) = 0` for `#F ≠ 5`: R01), §7.9 5128; `Suggested.lean` `ResidualImage.adZeroRep` 386.
- AutomorphicGaloisRepresentationsPartII (#1006): AG2.0 641 (`AlgHeckeChar.galoisChar` 752), AG2.5 1819
  "Local comparison, monodromy and purity" (Varma and Caraiani comparisons in characteristic zero; no
  torsion inertial statement, so the gap is genuine), AG2.7 3409 (`IsDecomposedGenericPrime` 3507,
  `decomposedGenericPrime_local` 3508, `IsDecomposedGeneric` 3529).
- PotentialAutomorphyInfrastructure (#1081): §2.1 790, §2.3 820 (parts (1) and (2), `F` and `E` imaginary
  CM or totally real, `rec` compatibility at every finite place; second Check: CM-induced base change is
  not cuspidal, as §2.1's third Check here says), §2.5 842.
- GlobalGaloisDeformations (#920) §3.4 440, §3.6 495 (framing terms at `T`, local conditions at `S ∖ T`),
  §3.7 566, §5.1 1081 (level-`N` datum, `𝒮_Q` unrestricted at `Q` with dual condition zero), §5.5 1245,
  §5.6 1282. LocalGaloisDeformationRings (#923) §1.10 1430, §2.3 1692 (minimally ramified: kernels of
  `(ρ(σ) − 1)^j` free direct summands of the residual ranks), §2.5 1723 (trivial residual data,
  `q(tr Φ)² = (1+q)² det Φ`), §2.6 1754, §2.8 1803, §2.15 1916, §2.16 1935, §2.21 2027, §3.14 2434, §4.14
  2665, §4.15 2692, §6.6 2979. DeformationAndDerivedPatchingAlgebra (#1034) §8.1–8.5 1584–1673.
  ArithmeticGaloisDuality (#858) R02.2 28, R02.4.2 3119 (its annihilator statement, line 3197, assumes `M`
  unramified, the hypothesis §3.5(b) says it drops). FaltingsFinitenessAndIsogenyTheorems (#1004) R28.6.2
  2688, R28.6.3 2716. NeronModelsAndSemistableAbelianVarieties (#852) §3.1 1454 (`toric_zero` 1467), §3.12
  1901, §5.1 3024. GL2ModularityLifting (#1071) §1.7 419 (`cht_soluble_prescribed_completions` 421).
  GL2AutomorphicRepresentationsAndTransfer (#931) R16.3.2 962, R17.4.16 2693.
  AbelianSchemesAndArithmeticModuli (#849) A6 38. PotentialModularityAndCompatibleSystems (#1075)
  §2.12–2.16 764–816. AutomorphicGaloisRepresentations (#1007) §3.13 2271. ModularityAndLanglandsExtensions
  (#1180) §2.29 1272, §2.30 1293. SchemeAndStackFoundations (main) §4.13 5644, §4.18 6110. EllipticCurves
  (main) Layer 4 794, Layer 5 (Layer 4.5a/4.5b and the quadratic-twist layer) resolved by heading grep;
  ClassFieldTheory (main) Layer 5 921, Layer 11 1684. Chebotarev (main) Layer 10 411.

**Sources: the seeded sample, read at the locators in the cached texts** (page markers checked).
- 1.1: MilneCM Proposition 1.4 (lines 273–287, p. 10), the "exactly one complex conjugation" remark
  (289–290), Corollary 1.5 (292–295). LeHung26 Lemma 5.1 (357–360). Mathlib's `ofCMExtension` needs a
  totally real base, a totally complex integral quadratic extension: all four supplied by the route.
- 1.2: LeHung26 lines 316–321 ("decomposed genericity: over K for A_t[5], and over F for the pairs").
- 2.2: LeHung26 §4.3 292–299, the table 346–349, line 350 (descent and twist); CaptainSude26 Proposition
  6.2 line 634; OpenAI26 Proposition 9.3 line 1131, Lemma 9.4 line 1163 (pp. 26–27).
- 2.3: OpenAI26 §9.4 line 1192 (p. 27, continuing on p. 28); CN23 Lemma 6.1.3 line 4545.
- 2.5: LeHung26 Theorem 1.1 lines 86–88 ("every CM number field K with ζ₅ ∉ K"), §4.6 342–351, Lemma
  5.1 357; CN23 Theorem 6.1 lines 4513–4520, Theorem 5.2 lines 3849–3872 (`p` odd, conditions (1)–(5)).
- 3.1: CaptainSude26 Lemma 3.1 line 187–191 (`e, f, h`; `D(e) = e`, `D(h) = h − 2e`, `D(f) = f + h − e`).
- 3.3: CaptainSude26 Lemma 3.1 lines 177–183 and lines 533–536.
- 3.4: CaptainSude26 Lemma 3.1 lines 184–220 (`R^{□,St,ψ} ≃ O[[a,u,z]]`, `N² = 0`, unit entry, basis
  `(Ne₂, e₂)`, `ρ(φ) = [[q_v d, z],[0, d]]`, `d² = ψ(φ)/q_v`, kernel description over nonreduced algebras).
- 4.2: CaptainSude26 Lemma 3.4 lines 242–263; AKT23 Lemma A.5 lines 3979–3984 (the `p = 5`
  projective-field clause it needs, replaced here).
- 5.1: CaptainSude26 §4 lines 264–289; CN23 §5.6 data (1)–(15) lines 4226–4260 (condition (6) is the
  degree inequality with `> [F⁺:ℚ]/2` and the residue field larger than `𝔽_p`).
- 5.2: CaptainSude26 lines 285–289; CN23 line 4361.
- 5.3: CaptainSude26 Lemma 4.1 lines 291–341 (`S_aux`, `R_aux`, unramifiedness at `P^c` part of ACC
  3.1.1, full Iwahori level with trivial character gives `(X − 1)²`, coefficient-by-coefficient descent,
  Lemma 3.1 over the nonreduced quotient); CN23 Propositions 5.6.2–5.6.3 lines 4334–4390; ACC23 §3.1
  lines 2309–2345 and Theorem 3.1.1 lines 2346–2355, matching the gap text clause by clause.
- 7.1: CaptainSude26 Lemma 5.1 lines 503–519.
- 7.2: CaptainSude26 Lemma 5.1 lines 520–532.
- 7.3: CaptainSude26 lines 533–536; ArithmeticGaloisRepresentations §6.3 line 4143.
- Also read: CN23 Lemma 6.1.4 lines 4562–4572, Proposition 6.1.5 line 4574; LeHung26 Remark 4.2 lines
  352–355, Remark 1.3.1 line 125; CaptainSude26 Lemma 3.2 lines 221–226, Lemma 3.3 lines 231–241,
  Proposition 5.2 lines 538–540. All eight manifest entries are in the cache with the recorded SHA-256;
  every cited work has one key; no `needs-references.toml` was needed.

**Gap.** `acc-torsion-inertial-comparison`: supplier AutomorphicGaloisRepresentationsPartII AG2.5 (earlier
in the merge order), a one-sentence `needs`, hypotheses spelled out in `detail` and in the README's
Supplier obligations against ACC23 §3.1 clause by clause, needed exactly by 5.3, provided by none of
Mathlib, Tau Ceti, AG2.5 at its head, PotentialAutomorphyInfrastructure, any roadmap on main or at an open
head. Same slug in `plan.json` (`gaps[0]`, `neededBy: ["5.3"]`, 5.3's prerequisites) and in the README
(lines 279, 900, 955). Precise, minimal, declared; the acceptance is conditional on it.

**Shape and policy.** Summary; Scope and ownership; Conventions with computed witnesses; Exact supplier
contracts (gap under Supplier obligations in the required form); How to read the build; eight layers
each ending with Examples and Dependencies; Downstream consumers; References. Three definitions (3.3,
5.1, 5.2) with API lists and 4, 4, 3 Checks; twenty-four theorems with hypotheses, locator and three or
four Checks; `*Needs:*` lines item by item. No pull-request number, date (References dates are the
sources' own), round label, machine path, LaTeX delimiter, HTML anchor, "optional", "deferred" or `lemma`
(grep). Backticked names: every one is a supplier declaration or notation; the README claims no Lean name
of its own, consistent with a `Suggested.lean` that states nothing. Elaboration: not available (this lane
does not elaborate); no Lean is planned, so no `#check` comparison and no padding probe apply.
Headline theorems 2.5, 6.2, 8.1: none statable at the pins (carriers above), all three to be named in the
module docstring as the Lean paragraph says.

## Not verifiable

- The global patching argument of CaptainSude26 Theorem 4.2 and its support propagation through CN23
  §5.4 are unrefereed; the dimension counts, the dual Selmer formula, the Taylor–Wiles detection, the
  Hecke-side identities and the field conditions were checked against CN23 §5.6 and ACC23 §3.1; the
  patching argument itself was not re-proved.
- Whether a Galois representation with image `⟨SL₂(𝔽₅), μh⟩ ⊂ GL₂(𝔽₂₅)` and `det = ε̄₅⁻¹` exists over
  some CM field is not settled; the first Check of §6.2 needs only the group-theoretic contrast.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4cd5bbc6e8e86ea2c5ef33291f231079d4ebe668", "job": "REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~5", "model": "fable", "worker": "chris-x10"} -->
