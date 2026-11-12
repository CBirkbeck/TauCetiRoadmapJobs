<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13767#issuecomment-6797793828 -->
Review (claude) of 8f065a3

Verdict: needs_changes

1. **F01** (P3) Two attributions to Kirchberg have no reference and resolve to the wrong paper

   **Location.** `packages/AmenableTracesOnCStarAlgebras/README.md` line 1334 (§4.4): "brown-ozawa2008,
   Ch. 6, for nets; Kirchberg's and Connes's origin as background"; line 1662 (§6.2): "lines 1283 and
   1291; Kirchberg's observation".

   **Claim.** Every cited work is in the References and the manifest.

   **Witness.** The only Kirchberg entry is `kirchberg1993` (Invent. Math.), cited for the
   factorization-property group case. brown2006 line 804 credits Theorem 3.1.6 to its [47], and
   line 1283 the face property to [47, Lemma 3.4]; line 4745 gives [47] as the 1994 Math. Ann. paper,
   which is in neither list.

   **Repair.** Carry the attribution through the readable source, with no new manifest entry.
   Line 1333–1334: "Prove (brown2006, Theorem 3.1.6, line 804, where it is credited to Kirchberg,
   with footnote 2, line 819; brown-ozawa2008, Ch. 6, for nets): for a unital C*-algebra …" (Connes's
   origin stays cited in §4.1 by `connes1976`). Line 1661–1662: "(brown2006, Propositions 3.5.3 and
   3.5.4, lines 1283 and 1291; line 1282 credits the face property of `AT(A)` to Kirchberg)".
   Checked on the refuting instance: brown2006 lines 804 and 1282 say exactly this, and after the
   change no sentence of the README names a Kirchberg work other than `kirchberg1993` in §5.4.

2. **F02** (P3) Two Lean section titles differ from the README's layer headings

   **Location.** `packages/AmenableTracesOnCStarAlgebras/Suggested.lean` line 62: "## Layer 1: tracial
   states and the normalized matrix trace"; line 380: "## Layer 7: commutative, AF and reduced group
   C*-algebras".

   **Claim.** The section comments are `Layer k: <title>` with the README's titles (the previous
   repair aligned Layer 6 for this reason).

   **Witness.** README line 444: "Layer 1: Tracial states, their GNS data and the matrix trace";
   line 1775: "Layer 7: Examples: finite-dimensional, commutative, AF and group algebras". Layers 3,
   4, 5, 6 and 8 agree. `TauCetiRoadmap/CStarClassification/Suggested.lean` lines 44, 75 and 102 copy
   its README headings word for word.

   **Repair.** Line 62: `/-! ## Layer 1: tracial states, their GNS data and the matrix trace -/`.
   Line 380: `/-! ## Layer 7: examples: finite-dimensional, commutative, AF and group algebras -/`.
   Comments only; no declaration changes.

3. **F03** (P3) A stage label in the source manifest

   **Location.** `packages/AmenableTracesOnCStarAlgebras/sources.toml`, entry `brown2006`,
   `version_note`: "arXiv v2; the design cites the arXiv v2 numbering and line numbers of the cached
   text".

   **Claim.** The files of the roadmap are timeless and carry no stage or process label.

   **Witness.** "the design" names a stage of the package's production; the entries `schafhauser2020`
   and `tikuisis-white-winter2017` of the same file say "arXiv v2 numbering and cached line numbers"
   with no such label, and the README's References say "whose numbering is the one cited".

   **Repair.** Replace the `version_note` by "arXiv v2 numbering and cached line numbers; the
   published Memoir (Mem. Amer. Math. Soc. 184 (2006), no. 865) was not compared". No other field of
   the entry changes.

Three findings, all P3 (no P1, no P2). The six findings of the previous review are repaired. No
false or vacuous statement, no unowned prerequisite, no upward supply, no padding and no missing
headline was found; `Suggested.lean` elaborates at the pins with `sorry` as its only warning. The
three findings are small text repairs (an attribution without a reference, two Lean section titles,
one manifest note). No maintainer notes were left; the plan declares no supplier gaps.

## Previous findings, one by one

- **F01 (P2), statable permanence headlines absent — repaired.** `Suggested.lean` lines 145, 357
  and 369 now state `isAmenableTrace_unitization_iff`, `isAmenableTrace_of_normalized_comp` and
  `isAmenableTrace_of_comp_ideal`; README §3.2 ("the argument below covers every `A`, unital or
  not, `isAmenableTrace_unitization_iff`"), §6.3 and §6.5 name them; the module docstring lists
  them under "Stated here". Each elaborates and none closes under the one-tactic probe.
- **F02 (P3), item numbers of Theorem 3.1.6 — repaired.** Docstrings now read "Theorem 3.1.6
  (2) ⇔ (5), with footnote 2" and "Theorem 3.1.6 (2) ⇔ (3)"; the bimodule form is "(4)".
  brown2006 lines 807, 810, 812, 815 and 819 carry items (2), (3), (4), (5) and footnote 2.
- **F03 (P3), Proposition 1.4 of tikuisis-white-winter2017 — repaired.** §8.1 cites only
  "brown2006, Proposition 3.3.2, first part, lines 1097–1121"; §8.3 reads "the final assertion of
  Proposition 1.4, line 431, stated there for separable unital nuclear `A`, with footnote 3,
  line 471, … and Remark 1.5 (iii), line 461". Lines 418, 431, 461–464 and 471–472 agree; "8.1"
  is gone from that entry's `cited_for`.
- **F04 (P3), "the acceptance file" — repaired.** 0 occurrences in README and Lean; the six
  places now say "`Suggested.lean`".
- **F05 (P3), manifest titles — repaired.** `connes1976`: "Classification of injective factors.
  Cases II₁, II∞, III_λ, λ ≠ 1"; `pedersen2018`: "C*-Algebras and Their Automorphism Groups" with
  `version_note = "2nd edition (2018)"`.
- **F06 (P3), locator "§3" of kirchberg1993 — repaired, with a residue (R01).** §5.4, the
  References and the manifest cite "Theorem 7.5; Proposition 7.1" as background, matching
  brown2006 lines 1910–1915. The same pattern (a Kirchberg attribution that the reference list
  cannot resolve) remains in §4.4 and §6.2: R01.

## Verified sound

**Elaboration.** `lake env lean` on `packages/AmenableTracesOnCStarAlgebras/Suggested.lean` from
the content checkout: exit 0; 21 warnings, all "declaration uses `sorry`", one per theorem; no
other message. Pins read from `lake-manifest.json`: Mathlib
`1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`,
the two commits the README names. No `TauCeti.*` module needed building.

**Padding probe, every theorem.** On a scratch copy each of the 21 `sorry` proofs was replaced by
`first | rfl | (simp; done) | infer_instance | trivial | tauto | (exact?; done) | fail`: 21 of 21
fail to close. No theorem restates a definition, mirrors a Check or treats a boundary case; the
sufficiency theorem `isAmenableTrace_of_isFoelnerTrace` is kept beside the equivalence because it
holds in every unital representation, where the equivalence does not (§4.5, `ℂ²` on `ℂ²`). The
4 instances and 20 definitions have real bodies. No sorried data, `set_option`, `lemma`, `#eval`,
`#print`, `#synth` or line over 100 characters. Header: `module`, `import Mathlib`, three
`TauCeti.*` modules, each used (`IsKMSState`, `VonNeumannAlgebra.adjoin`, `TauCeti.Amenable`);
67 roadmaps on main open with `module`.

**Signatures.** `#check @name` for all 44 declarations in one scratch file: exit 0. Each type was
compared with its README statement. `IsFaithfulTrace`, `IsHypertrace`, `IsFoelnerTrace` drop
`[StarOrderedRing A]` and `IsAF` both order classes; their bodies do not use them. No theorem
loses a hypothesis: the Følner equivalence keeps both separability instances, `hπ` and `hess`;
the group theorem keeps `[DecidableEq Γ]` (for `lp.single`); `subalgebra_isAF_simple` keeps
`[Nontrivial A]`. All 44 names occur backticked in the README; the citation resolver lists no
README name found nowhere.

**Headlines (README Summary) against `Suggested.lean`.** Stated: Connes–Kirchberg in hypertrace,
extension and tensor forms; Følner sufficiency and equivalence; tracial von Neumann form; uniform
amenable ⇔ injective `π_τ(A)''`; nuclear case; exact case; the two face theorems (with
convexity); unitization, normalized restriction (subalgebras, corners, ideals, quotient lifting)
and extension from ideals; commutative and AF algebras (finite-dimensional and UHF algebras are
AF); the group theorem; quasidiagonal algebra ⇒ quasidiagonal trace; faithful quasidiagonal trace
⇒ quasidiagonal; Rosenberg; subalgebras of simple unital AF algebras. Named not statable, with
the missing carrier: bimodule form (`π_τᵒᵖ`), the vector-trace clause (`τ''`), minimal tensor
products (no C*-tensor product at the pins). None absent, none through a stand-in.

**Sources: the 15 sampled targets, read at the cited lines.** brown2006: 1338–1340 (Prop. 3.5.8,
§1.2, §6.4), 1347–1349 (its items (1), (2)), 486–488 and 466–468 (Lemmas 2.5, 2.4; §1.6, §7.1,
§7.2), 413–418 (Lemma 2.1; §2.3), 589–592 and 595–599 (Def. 3.1.1, Prop. 3.1.2; §4.1), 851–894
(proof of Thm 3.1.6 from (2) to (1) through (3), (4), (5); §4.3), 1035–1036 (Thm 3.2.2 (5) ⇒ (1);
§4.6), 973–992, 993 on, 1038–1040, 1575–1576, 1608–1612 (§5.2), 1306–1308, 1312–1315, 1452–1454
(§6.3), 1469–1474 (§6.5), 1192–1194 (§7.2), 1551–1566 and footnote at 1577–1579 (§8.3),
1541–1549 and 340–341 (§8.4), 1971 (§8.5). tikuisis-white-winter2017: 418–431, 456–464, 471–472.
schafhauser2020: 69–70, 75–77, 78–84. Also read for the headlines: brown2006 429–431 (Thm 2.2),
804–820 (Thm 3.1.6), 897–912 (Thm 3.1.7), 1097–1121 (Prop. 3.3.2), 1218–1221, 1283–1294,
1423–1428, 1515–1519, 1539, 1613–1616, 1707–1708, 1908–1930, 1952–1955, 1969–1971. Every locator
carries the cited statement. Where the README is more general than the source (no separability or
unit: brown2006 line 357), it says so and gives its own route, checked in the table.

**Adversarial table** (sampled targets, headlines, repaired passages, targets of findings).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.2 trace kernel | `ℂ ⊕ ℂ`, `pr₁`; `M_2`, `x ↦ x₁₁`; `tr_2` | `N = 0 ⊕ ℂ`; `ω(e₁₂*e₁₂) = 0` but `ω((e₁₂e₂₁)*(e₁₂e₂₁)) = 1`; `ker tr_2 ∋ e₁₂`, `N = 0` | two-sided only for traces; `N ≠ ker τ` |
| §1.3 ideal extension | `a, b ∈ A`, `e` in `I` | `γ(ab) = lim τ((ea)(be)) = lim τ(be²a) = γ(ba)`; `|γ(a) − γ(ea)|² ≤ (1 − τ(e))‖a‖²`; `c₀ ⊆ c`: `(δ_1 + lim)/2` restricts to norm `1/2` | unique, tracial |
| §1.6 expectation, embedding | matrix unit `e_kl`; `γ = (1, 0)`; `ℂ³`, `τ = (1/2, 1/2, 0)` | `Φ_B(e_kl) = τ(e_kl e_lk)τ(e_ll)⁻¹e_kl = e_kl` (as `τ(e_kk) = τ(e_ll)`); `‖γ − tr∘ρ‖ = 2/(N + 1)`; `τΦ_B(x) = (x₁ + x₂)/2` | projection onto `B`; weights `≥ 1` needed |
| §2.1 unitalization | `φ = id/2` on `M_2`; `φ(1) = diag(1, 1/100)` | `‖ψ − φ‖₂ = ‖x‖₂/2 ≤ 2‖x‖2^{-1/2}`; spectrum of `φ(1)` in `[0, t₀] ∪ [1 − t₀, 1]`, `t₀ ≤ 2δ` for `δ ≤ 1/8` | bounds hold; `Q ≠ 0` |
| §2.2 defects | `φ(x) = x₁₁`, `(e₁₂, e₂₁)`; `tr_n`; product rule | `1 ≤ 1`; `d₂(tr_n, e₁₂) = 1/n`; `T(ab) = T(a)φ(b) + (1 − VV*)^{1/2}π(a)(1 − VV*)^{1/2}T(b)` | sharp |
| §2.3 compressions | `P = e₁₁`, `T = e₁₂`; `P = 1`; `M_z`, `P_n` | `‖[P, T]‖²_HS = 1 = 0 + 1`; `0 = 0`; `2`, normalized `(2/n)^{1/2}`, norm `1` | identities hold |
| §2.4 Ozawa | rank one; `diag(1/3, 2/3)` | defect `1 − c² ≤ 2^{3/2}(1 − c²)^{1/4}`; general: `x²/2 + x ≤ 2x` for `x = ‖[h^{1/2}, u]‖_HS ≤ √2`; `max` in place of `min` gives `2/3 > 1/3` | bound `2‖uhu* − h‖₁^{1/2}` holds |
| `isAmenableTrace_unitization_iff` | `A = ℂ`; `c₀`, `δ_1`; `φ = (1 − δ)·id` | `Ã ≅ ℂ ⊕ ℂ`, `τ̃ = pr₁`; `x ↦ x_1` both sides; norm `δ` on `A`, `2δ` on `Ã` (at `a = 1`, `λ = −1/2`, norm `1/2`); `|λ| ≤ ‖a + λ1‖` also for unital `A` | true ↔ true; factor `2` attained |
| §4.1 `IsHypertrace` | `ℂ²` on `ℂ²`, vector state at `(1, 1)/√2`; `M_n` | `ψ′(e₁₁e₁₂) = 1/2`, `ψ′(e₁₂e₁₁) = 0`; unitary invariance forces `tr_n` | centrality is not implied by restriction |
| §4.3–§4.4, three Lean forms | `M_n`; `ℂ ⊕ ℂ`, `pr₁`; `H = 0` | `Σ_{ij} τ(e_ij e_ji) = n = ‖Σ e_ij ⊗ e_jiᵒᵖ‖` (`n` times a rank-one projection); `Φ(T) = T₁₁`; `μ_τ = ac`, norm `1`; injective `π` into `B(0)` forces `A = 0`, no state | tensor bound attained; no vacuous case passes |
| §4.5 `IsFoelnerTrace`, both theorems | `C(𝕋)`, `P_n`; `ℂ²`, `τ = (1/3, 2/3)` | `Σ‖(1 − P)π(a)eᵢ‖² + Σ‖(1 − P)π(a*)eᵢ‖² = 2 < εn`; compression defect `≤ ‖a‖ε^{1/2}`; rank one with `|ξ₁|² = 1/3`: `4/9`; rank two: trace `1/2` | sufficiency general; converse needs `hess` |
| §4.6 `isAmenableTrace_iff_isInjective` | `M_n`; `L(F₂)`; `H = 0`; net index universe | `id`, norm `1`; both sides false; no state; a directed family in `M` is indexed by itself in `Type u` | holds; `IsNormalState` = V4's predicate |
| §5.2 `isUniformAmenableTrace_iff_isInjective` | `M_n`; `C*(F₂)` regular trace; `C(𝕋)` arcs; nonunital `A` | `id`; amenable, `L(F₂)` not injective; `tr_n∘φ_n = τ`, defect `1/(12n²)` at `f(t) = t`; `adjoin` contains `1`, `M_τ = M_τ̃` | holds, unital or not |
| §5.3, §5.4 | `K(ℓ²)`; `C*_r(F₂)`; `C*(F₂)` | `T = ∅`; all four clauses fail; amenable with non-injective `M_τ`; `π_τ = Φ∘ι`, `(Φ∘β)∘α` approximates | hypotheses needed; target `M_τ` needed |
| §6.2 faces | `C*_r(F₂) ⊕ ℂ` | `AT = {χ∘pr₂}`; `M_{τ_i} ≅ M_γ z(P)` | iff holds |
| §6.3 `isAmenableTrace_of_normalized_comp` | `M_3 → M_4`; `λ ↦ (0, λ)`, `pr₁`; `a + λ1` | `c = 3/4`, `γ = tr_3`; `c = 1/2` gives value `3/2`; `τ∘ι = 0`, no `γ`; `τ(ιa) + λ = c(γ(a) + λ) + (1 − c)λ` | `hγ` pins `c`; route identity holds |
| §6.4 | `ℂ ⊕ ℂ`, `pr₁`; `C*(F₂) → C*_r(F₂)` | `pr₁∘σ = id` for `σ(λ) = (λ, 0)`; amenable trace with non-amenable `τ̇` | splitting needed |
| §6.5 `isAmenableTrace_of_comp_ideal` | `M_2 ⊕ 0`; `c₀ ⊆ c`; `q : C*(F₂) → C*_r(F₂)`; route | `γ = tr_2∘pr₁`; mass omitted `2^{-m}`; false without `hι`; `ω = tr∘ψ` has `|ω(a) − ω(ea)|² ≤ (1 − ω(e))‖a‖²`, so `ω ≈ γ` | holds; `hι` needed |
| §7.1 `isQuasidiagonalTrace_of_commute` | `C[0,1]`, `f = x`; `M_2 ⊕ ℂ`; `A = 0` | `(n + 1)/(2n) → 1/2`; `tr_4 ρ = (Tr x + 2λ)/4 = τ`; no state | holds |
| §7.2 `isQuasidiagonalTrace_of_isAF` | CAR; `K(ℓ²)` | `tr∘φ_n − τ = (tr∘ρ_n − τ|_{B_n})∘Φ_{B_n}`; `tr_{2^n}∘φ_n = τ`; `T = ∅` | holds; unit needed for existence only |
| §7.3 group theorem | `ℤ`; `S₃`; trivial group; `F₂` | `λ_1 M_{δ_0} λ_1* = M_{δ_1}`; `Tr(λ_e) = 6`, else `0`; all hold; all fail; clause (iv) non-vacuous since `τ_Γ` exists | holds; convention matches `TauCeti.Mean.IsLeftInvariant` |
| §8.1 | `C(𝕋)`; `SO₂`; `|tr φ(ab) − tr φ(ba)|` | Lebesgue cluster point; `T = ∅`; `≤ 2 max` of the two defects | unit needed |
| §8.3 `isQuasidiagonal_of_isQuasidiagonalTrace` | Toeplitz; `ℂ ⊕ ℂ`; universe | traces not faithful; `‖a‖ = ‖φ(a)‖`; `τ(a*a) ≤ limsup‖φ_n(a*a)‖`; a separable space exists in every universe | holds; faithfulness needed |
| §8.4 Rosenberg | `ℤ`, `F₂`, finite `Γ` | quasidiagonal and amenable; neither; both | holds |
| §8.5 `subalgebra_isAF_simple` | `M_3 ⊆ M_4 ⊆ CAR`; `C(𝕋) ⊆ CAR`; `ℂ ⊕ ℂ`; `A = 0` | `c = 3/4`, `tr_3`; dyadic arcs of mass `2^{-m}`; `pr₁` not faithful; excluded by `[Nontrivial A]` | holds; simplicity needed |
| R01–R03 repairs | brown2006 804, 1282, 4745; README 444, 1775 | attribution text and titles as quoted | text only |

**Library declarations opened at the pins.** Mathlib: `Unitization.instPartialOrder`,
`instStarOrderedRing`, `inr_le_inr_iff` (`Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Order.lean`:90,
93, 109), `Unitization.inl`, `starLift` (`Algebra/Algebra/Unitization.lean`:117, 805),
`PositiveLinearMap.GNS` (`GelfandNaimarkSegal.lean`:147, in a section for
`NonUnitalCStarAlgebra`), `CompletelyPositiveMap` (`CompletelyPositiveMap.lean`:54),
`CStarMatrix.ofMatrix` (`CStarMatrix.lean`:55), `tendsto_nhds_opNorm`, `ofReal_opNorm_eq_map_one`
(`PositiveLinearFunctional.lean`:48, 74). Tau Ceti: `isKMSState_zero_iff` (`KMS/Basic.lean`:237,
`‖ω‖ = 1 ∧ ∀ a b, ω(ab) = ω(ba)`, no faithfulness), `denseRange_toGNS`, `gnsVector`,
`norm_gnsVector` (`GNS.lean`:62, 72, 110), the density theorem (`Density.lean`:155), the
separating-vector theorem (`KMS/Separating.lean`:114), trace duality (`Duality.lean`:31, 52),
`Amenable.of_lpTop` (`Linfty.lean`:159), `not_amenable_freeGroup` (`FreeGroup.lean`:40),
`Mean.IsLeftInvariant`, `amenable_iff` (`Amenable/Basic.lean`:64, 136). The remaining
declarations of the contracts carry file and line in the previous round's list; none moved (same
pins).

**Cross-roadmap citations resolved on main.** CStarAlgebras: C2.1 (544), C2.8 (763), C4.1 (986),
C4.2 (1021), C5.1 (1112), C5.2 (1143), C5.4 (1203), C6.1 (1272), C6.2 (1297), C6.5 (1414), C7.1
(1455: exact iff a faithful representation is nuclear, with independence; no separability), C8.1
(1587), C8.2 (1617: separable unital, faithful essential, separable `H`; the compression step
follows from its absorption statement and Stinespring), C8.3 (1645: separable, with the nonunital
c.p.c. version), C8.4 (1676), C9.1 (1711), C9.7 (1900). VonNeumannAlgebras: V13a (4635),
V13b.SpatialNorm (4696), V13b (4692: injective iff semidiscrete for arbitrary algebras at 4799,
Powers–Størmer at 4829, commutant at 4966); `IsNormalFunctional` (Suggested line 234) and
`IsInjective` (line 684) equal this file's `IsNormalState` and `IsInjective` word for word.
CStarClassification: §2.1 (351), §3.4 (587), §3.5 (616); its `IsAF` (Suggested line 82) equals
this file's. OperatorAlgebraDynamics: D2 (1466), D2.FreeGroups (1781). FactorRigidity §2.2 (217).
BanachSpaceTheory B1 (54). The namespaces differ, so no fully qualified name is shared.

**Ownership and overlap.** `roadmaps grep` for amenable, quasidiagonal and tracial-state
predicates over main and the open heads finds only VonNeumannAlgebras' von Neumann `IsTracialState`
(a different carrier, deferred to in the Scope). The overlap listing: no open pull request changes
this roadmap, no cited id is dropped, none is defined only by a revision. No notion had to move
from a later roadmap.

**Dependency check.** Output: `depcheck: 223 roadmaps, 1970 edges, 0 problem(s)`. No UPWARD, CYCLE
or `moved:` line.

**Shape.** Eight layers, each ending with Examples and Dependencies; every definition has its API
and at least three Checks; every theorem a locator; no LaTeX delimiters, pull-request numbers,
anchors or machine paths in README or Lean. The layer order is forced by the dependency lines
(each layer lists all earlier ones), and no layer is named after a source chapter.

**Remarks needing no change.** README line 1593 is one long source line and lines 1955–1956 are
broken short; both render correctly. C8.2 states absorption by unitaries; the isometry form used
in §4.5 is its "compression approximations" step.

## Not verifiable

- `connes1976`, `brown-ozawa2008`, `paulsen2002`, `pedersen2018`: waived; cited as background by
  locator, texts not read.
- `kirchberg1993`: paywalled, `uncertified`; its Theorem 7.5 and Proposition 7.1 are known only
  through brown2006 lines 1910–1913.
- The numbering of the published Memoir of brown2006 against arXiv v2: not compared; the README
  cites the arXiv numbering.
- Packages under review on other board branches were not opened; none is in operator algebras.

## Source issues

- **Misprint** in brown2006 at proof of Proposition 3.5.3, printed page 29: the source says the projections lie in the double commutant of the GNS image and writes the representation of the wrong trace; it should be the commutant, as in Lemma 3.5.2, and the representation of the combined trace; affects nothing.
- **Gap** in brown2006 at proof of Lemma 3.1.4, printed page 17: the source takes, for each eigenvector, as many vectors of an orthonormal basis of the same Hilbert space as its multiplicity numerator, which fails on a small space; it should tensor with an auxiliary space of dimension at least the common denominator; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8f065a3741608eb15add76f24425fd597d285f9c", "job": "REV-PKG-AmenableTracesOnCStarAlgebras~2", "model": "fable", "worker": "chris-l"} -->
