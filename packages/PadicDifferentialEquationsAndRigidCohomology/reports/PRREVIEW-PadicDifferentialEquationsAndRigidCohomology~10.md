# Review of PadicDifferentialEquationsAndRigidCohomology (pull request #1002 at ef77e5b)

**Verdict:** needs changes

## R01 (P2) — RD.3.43(b) and RD.3.44 are each proved from the other

**Location:**
- `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:6869` (RD.3.43): “Kedlaya's Notes prove it for convergent F-isocrystals on smooth `X` by the slope-filtration argument of Remark 5.2”.
- Line 6907 (RD.3.44, step 2): “Katz's curve argument and Newton-stratification purity (§RD.3.43) construct the slope subobject on an open whose complement has codimension at least two”.

**Claim:**
- The Remark 5.2 argument takes the slope filtration on the open where a vertex persists (the statement of RD.3.44) and extends it by full faithfulness (RD.3.43a). So RD.3.43(b) needs RD.3.44 and RD.3.43a. Its *Needs* line (6871) lists neither.
- RD.3.44 in turn uses the purity of RD.3.43. The source's proof of the common-vertex theorem does not: its codimension-two open comes from the locally free crystal representative.

**Witness:** Kedlaya, *Notes on isocrystals* (arXiv:1606.01321v6), extraction lines 482–489 (Remark 5.2: Corollary 4.2 on `U`, then Theorem 5.1) and lines 335–338 (proof of Theorem 4.1: Remark 2.3 and Katz, no Theorem 3.12(b)).

**Repair:**
- In RD.3.44 step 2, replace the quoted sentence with “On a dense open with complement of codimension at least two, `E` is a crystal of locally free modules (Notes, Remark 2.3; the crystal representative is §RD.3.36(b)), and Katz's curve argument constructs the slope subobject there.” In its *Needs*, replace §RD.3.43 by §RD.3.36.
- Move part (b) of RD.3.43 to a new target §RD.3.44a *Purity of the Newton-jump locus*, placed after RD.3.44, with *Needs:* §RD.3.43, §RD.3.43a, §RD.3.44.
- In RD.3.45, step 1 and *Needs*, cite §RD.3.44a for purity.

## R02 (P3) — RD.3.43 is stated for every coefficient field of §RD.3.34, but its route is given only over `W(k)[1/p]`

**Location:** `README.md:6867`: “Slopes use `v_p(p) = 1`, obtained from the uniformiser-normalised slopes of Layer RD.1 by division by `e = v_π(p)`”. *Needs* at line 6871: §RD.3.34 and §RD.1.35 only.

**Claim:**
- The statement covers ramified `K` and `F^a`, as §RD.3.34 allows. The proof cites the Notes, which fix `K = Frac W(k)` and the absolute Frobenius.
- Step (a) uses a locally free crystal on a curve, which is §RD.3.36(b), under `e ≤ p − 1`. Neither §RD.3.36 nor the ramified bridge that §RD.3.36 itself names is in the *Needs*.

**Witness:** Notes, extraction lines 58–61 (Notation 1.1: `K` is the fraction field of `W(k)`). `README.md:6679`: “(c)–(e) use the unramified base `W(k)`; the ramified case is reached through (e) and §RD.3.46”.

**Repair:**
- Add to the proof sketch of RD.3.43: “For ramified `K`, reduce to `W(k)[1/p]` through §RD.3.36(e) and §RD.3.46; for `a > 1` apply the same argument to the `F^a`-crystal.”
- Add §RD.3.36 and §RD.3.46 to its *Needs*.

## R03 (P3) — Six locators do not match the cited texts

**Location:**
- `README.md:5349`: “*… an overview*, Example 2.1.10, p. 5”.
- Line 5697: “Hypothesis 4.2.1, p. 25”.
- Line 8998: “Proposition 2.4.2, p. 14”.
- Line 11693: “Remark 3.2.4, p. 20”.
- Line 14543: “Lemma 6.3.4, p. 40 (arXiv v6)”.
- Line 14600: “chain pairing after Lemma 8.5.2, p.59”.

**Claim:** Each of the first five statements begins one page later in the cited arXiv version. The last item is a Definition, not a Lemma.

**Witness:** Extraction lines, with printed page equal to PDF page:
- overview (arXiv:math/0501361v2) line 196, p. 6.
- *Finiteness* (arXiv:math/0208027v6) line 953, p. 26; line 545, p. 15; line 781, p. 21; line 1530, p. 41; line 2234, “Definition 8.5.2”, p. 58.

**Repair:** Write “p. 6”, “p. 26”, “p. 15”, “p. 21” and “p. 41” respectively, and “after Definition 8.5.2, p. 59” at line 14600.

## R04 (P3) — Three citations use a source's own bibliography tag

**Location:**
- `README.md:8776`: “(Tsuzuki's Conjecture 2.3.2 in [T2])”.
- Line 14520: “one can show [52, Proposition 5.11] that `E` admits a unique filtration”.
- Line 14573: “Only a filtration descends (Kedlaya `[45]` Prop. 5.11)”.

**Claim:** `[T2]`, `[52]` and `[45]` are labels of the bibliographies of the cited papers. The README's reference list has no such labels, so the three citations cannot be resolved.

**Witness:**
- Kedlaya-FF line 673: `[T2]` is Tsuzuki, *Morphisms of F-isocrystals and the finite monodromy theorem for unit-root F-isocrystals*.
- Notes line 1477: `[52]` is Kedlaya, *A p-adic local monodromy theorem*.

**Repair:**
- Line 8776: “(Conjecture 2.3.2 of Tsuzuki, *Morphisms of F-isocrystals and the finite monodromy theorem for unit-root F-isocrystals*, Duke Math. J. 111 (2002))”, with the entry added to *References*.
- Line 14520: “(Kedlaya, *A p-adic local monodromy theorem*, Proposition 5.11)”.
- Line 14573: name the work `[45]` denotes, with its proposition number.

## R05 (P3) — RD.5.3 and RD.5.4 call `F ↦ q^ℓ F` “the Tate twist by `ℓ`”, the opposite of §RD.4.22

**Location:**
- `README.md:8764` (RD.5.3): “the Tate twist by `ℓ` multiplies `F` by `q^ℓ`”.
- Line 8782 (RD.5.4): “`φ : M = M_1^∨(ℓ) ⊗ M_2 → Γ` (`ℓ` large …) with `φ(Fv) = q^ℓ φ(v)^σ`”.
- Line 14523: “the Tate twist multiplies `F` by `q^ℓ`”.

**Claim:** §RD.4.22, §RD.3.34 and §RD.6.3 define the Tate twist `(n)` as multiplication of Frobenius by `q^{−n}`. With that definition `M_1^∨(ℓ)` for large `ℓ` has more denominators, not fewer, and the displayed equation would read `q^{−ℓ}`.

**Witness:** `README.md:7700`: “the Tate twist `V(n)` is `V` with Frobenius `q^{−n}F`”. Line 11564: “`K(1)` has `F = q^{−1}`”. By line 8764 the same `K(1)` would have `F = q`.

**Repair:**
- Line 8764: “the twist written `(ℓ)` in the source multiplies `F` by `q^ℓ`; it is the Tate twist `(−ℓ)` of §RD.4.22”.
- Line 8782: write `M = M_1^∨(−ℓ) ⊗ M_2`, “the Tate twist of §RD.4.22, `F` multiplied by `q^ℓ`”.
- Line 14523: “the twist multiplies `F` by `q^ℓ`”.

## R06 (P3) — The description still cites RD.6.64

**Location:** Pull request description: “the neutral Tannaka reconstruction imported in RD.6.64”.

**Claim:** The head has no target RD.6.64. The recognition adapter is §RD.2.52 (`README.md:48`: “Target RD.6.64 is now §RD.2.52.”).

**Witness:** `README.md:5625`: “### RD.2.52 Neutral Tannakian recognition theorem”. No heading `RD.6.64` exists; Layer RD.6 goes from RD.6.63 to RD.6.65.

**Repair:** In the description write “#1313 (MotivesAndAlgebraicCycles §§6.1–6.3, the neutral Tannaka reconstruction imported in RD.2.52)”.

## Verified sound

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| Previous R01 (RD.3.43 finite type) | README 6865, 6867, 6869 | “scheme of finite type over a perfect field”; Notes Notation 1.1 p. 2, Remark 2.3 p. 3, Theorem 3.12 p. 7, Remark 5.2 pp. 11–12 | Repaired; route is R01, R02 |
| Previous R02 (branch purity) | README 637–639, 6889; PurityOfBranchLocus on main | Main lines 319 and 357: “2.1 Purity of the branch locus”, “2.2 The global corollary” | Repaired |
| Previous R03 (`CR.4.7` titles) | 5 citations of §CR.4.7 | All 5 read *Slope decomposition on the existing isocrystal carrier* | Repaired |
| Previous R04 (RD.6.64 placement) | README 48, 5625; other roadmaps | Mapping sentence present; MotivesAndAlgebraicCycles line 1697 still says RD.6.64 and follows the mapping | Repaired; description is R06 |
| Previous R05 (valuation p-bases) | README 37 | Phrase absent from the RD.0 row | Repaired |
| Previous R06 (comma spans) | Whole README | Spans with a top-level comma before a verb: 179 → 39, all lists (`σ, σ'`, `M₁, M, M₂`) | Repaired |
| Previous R07, R08 | README 3117, 7062–7067 | “used for isocrystals over finite fields after extension of scalars to `F̄_q`”; duplicate Checks gone | Repaired |
| Sample: Theorem RD.0.39 | `I = 0`; `I = R` | `I=0`: `E ≅ B`, `hE = hbar`. `I=R`: lift of `S → B/J` to an étale neighbourhood of `J`. Arabia 2.1.2 p. 625, 2.1.3 pp. 632–633, 2.2.2 pp. 633–634 | Pass |
| Sample: Theorem RD.5.4 | Rank one, trivial structure | `c^σ = c`, `dc = 0` forces a constant. Kedlaya-FF line 427, p. 11; printed (a) lacks `σ` (line 434) | Pass; twist name is R05 |
| Sample: Theorem RD.3.27 | `n = 0`, `n = 1` | `n=0`: `K`. `A/gA = B[t]/(g)` by division. FF Lemmas 6.1–6.3 pp. 12–13, Props 6.4–6.5 p. 14, 6.6 and 6.7 p. 15 | Pass |
| Sample: Theorem RD.3.43 | `j`-line; ramified `K` | Ordinary (0,0),(1,0),(2,1) below supersingular (1,1/2). Notes fix `K = Frac W(k)` | R01, R02 |
| Sample: Theorem RD.3.44 | `O ⊕ O(−1)` | Common rank-one vertex gives `O`. Notes Theorem 4.1 proof uses Remark 2.3, not 3.12(b) | R01 |
| Sample: Theorem RD.1.5 | `n = 1`, `n = 2` | `N = n(n−1)+1` gives 1 and 3 candidates | Pass (source not read) |
| Sample: Definition RD.1.25 | `[[0,1],[p,0]]`; `diag(1,p)`; `N = log(1+t)·M` | `w(det) = 1`, slope 1/2 in both. `σ(x) = px` gives `deg N = deg M + 1` | Pass |
| Sample: Definition RD.3.34 | Kummer and Dwork lines | `θ′/θ = a(q−1)/t` gives `t^{(q−1)a}`; `θ′/θ = π(qx^{q−1} − 1)` gives `exp(π(x^q − x))` | Pass |
| Sample: Lemma RD.5.1 | `A=2, D=3, B=5, σ=id` | `5 + 2·5 − 5·3 = 0`. FF Lemma 3.2 p. 6, Prop 3.3 p. 7 | Pass |
| Sample: Lemma RD.5.3 | `M = Γ_con`, `F(1) = p^m` | `φ^{-1}(Γ_con) = M`, slope `m`. FF Lemma 4.2 p. 10 | Pass; R05 |
| Sample: Lemma RD.6.35 | `p=3, n=8`; `n = p^k − 1`; `n=1, p=2` | `v_3(8!) = 2 = 4 − 2`; digit count equals `⌈log_p(n+1)⌉` in all three. Weil II Lemma 4.1.1 p. 26 | Pass |
| Sample: Lemma RD.7.4 | `1/(1−t)`; `G = H = 1 − t/ℓ` | Reciprocal root of norm 1; non-coprime pair has coefficient of norm `ℓ`. Milne-LEC line 6028, p. 158 | Pass |
| Sample: Comparison RD.1.60 | `T²−pT+p`; `(T−1)(T−p)` | Points (0,1),(1,1),(2,0): slope −1/2 twice, roots of valuation 1/2. Second: slopes −1, 0 | Pass |
| Sample: Application RD.6.29 | `G_m` over `𝔽_{q^r}` | `−Tr(F^r∣H¹_c) + Tr(F^r∣H²_c) = −1 + q^r`; `F(dx/x) = q·dx/x` | Pass |
| Sample: Construction RD.1.22 | `a = 2`, `Fe = ±e` | `F²e = e` for both; `μ([a]_*M) = a·μ(M)`, `μ([a]^*N) = μ(N)/a` | Pass |
| Sample: Example RD.2.42 | `p = 2, 3, 5, 7`, `n ≤ 200` | `dE(y) = −πE dt`. `v(c_n) ≥ n(p−1)/p²` in all cases, least slack at `n=1`; `v(c_200)/200` = 0.235, 0.165, 0.1267 | Pass |
| Sample: Lemma RD.1.63 | `p = 2` | Coefficient of `X²` in `E_2` is `1/2 + 1/2 = 1` | Pass (source not read) |
| `arabia_controlled_lifting` | As RD.0.39 | As above; signature equals README (a) | Pass |
| `exists_frobenius_lift_weakCompletion` | `f = 0`; `S = O[1/π]` | `φ = id` works for `σK = id`; completion of `O[1/π]` is 0 | Pass |
| RD.0.55 (eight theorems) | `S/g ≅ A/g`; zero ring | `A ⊗^L_S N = (A/gA) ⊗^L_{S/g} N = N`; `0 → N → M⊕N → M → 0` gives the converse of stable freeness | Pass |
| RD.0.56 (two theorems) | `n = 1`; zero ring | Monic unit of `B[t]` is 1; kernel of the functional is stably free of rank `n` | Pass |
| `rigid_quillen_suslin` | `n = 0` | `washnitzerAlgebra (Fin 0) K = K` | Pass |
| `hyperelliptic_reduction_denominator_bound` | `Q=x³+x+1, p=5, m=0`; `g=0` | `F = (2/5)x`, `b = (2/5)x + 3/5`; `g=0`: `F = 2B·Q^{m+1}/(2m+3)` | Pass |
| End theorems of RD.1, RD.2, RD.4–RD.7 | Pins | No Robba, isocrystal or rigid-cohomology carrier at the pins; the docstring names each | Pass |
| Twist conventions | `K(1)`; `Γ_con(1)` | §RD.4.22: `F = q^{−1}`. §RD.1.21 local twist: `F = π`, slope 1. RD.5.3: “Tate twist” with `q^ℓ` | R05 |
| Locators | 545 statement-and-page pairs, 7 texts | 5 pages off by one, 1 wrong kind | R03 |

- **Gate:** the worker's gate at `ef77e5b` passes. The prescribed dependency check prints `depcheck: 207 roadmaps, 1916 edges, 0 problem(s)`. The diff outside the folder is empty.
- **Elaboration:** `lake env lean` gives 14 `sorry` warnings and nothing else. The one-tactic probe (`rfl | simp | infer_instance | trivial | decide | simp_all | aesop`) closes none of the 14 theorems. The `#check @` types of all 18 declarations agree with the README; nothing changed.
- **Sources:** 545 page locators compared mechanically with seven arXiv texts (SFR v4, LMT v4, overview v2, Notes v6, Weil II v3, Finiteness v6, Full faithfulness v4), each mismatch then read by hand; 21 further locators read in Arabia, Milne and those texts.
- **Library declarations opened at the pins:** Mathlib `Algebra/Module/StablyFree/Basic.lean:34` (complement finite free, in the universe of the ring) and `LinearAlgebra/Unimodular.lean:46`; Tau Ceti `RingTheory/Dagger/WashnitzerAlgebra.lean:115`, `RingTheory/Dagger/WeakCompletion/Basic.lean:190` (needs `Algebra.FiniteType`) and `Algebra/Homology/ModuleCat/FiniteFreeResolution.lean:268` (complexes over noetherian rings, no overlap with RD.0.55).
- **Citations:** the resolver lists no unresolved cross-roadmap citation. Read at their heads: PurityOfBranchLocus §§2.1–2.2 (main), CrystallineCohomology §CR.6.4, MotivesAndAlgebraicCycles §§6.1–6.3, FormalConnectionsOpers §6.2 (`exists_cyclicVector`), CongruenceSpectralGap §§4.2a–4.2b, NoncommutativeAndEquivariantIwasawa §F.6 stages 1–2.
- **Ownership:** no roadmap on main or in an open pull request owns Quillen–Suslin, Lang's finite free resolutions over arbitrary rings or the unimodular extension property. PurityOfBranchLocus §0.3 covers noetherian local rings only; AlgebraicKTheory covers stable range.
- Overlap check: read CrystallineCohomology, PadicHodgeTheory, FiniteFlatGroupsAndIntegralPadicHodgeTheory, AInfCohomology and RelativeFarguesFontainePartII (open), and AdicSpacesPartIV, NewtonPolygons and ClassicalArithmeticCompletion (main); the third list is empty. Shared objects and owners: Robba and Amice carriers over discretely valued fields of characteristic 0, NoncommutativeAndEquivariantIwasawa §F.6 stage 1 (cited; its consumer table agrees); constant-coefficient rigid cohomology of smooth schemes, CrystallineCohomology §CR.6.4 (cited); dagger algebras, AdicSpacesPartIV F1 (cited); RD.0.1–RD.0.3 and RD.0.54 over general fields, this roadmap (PadicHodgeTheory and RelativeFarguesFontainePartII consume them).
- Source independence: 15 passages read side by side with 4 sources, and the whole README scanned against 8 texts for shared word runs; none shared beyond formula-bound statements (longest run 27 tokens, 10 of them words, the statement of p-adic Weil II); largest share *Slope filtrations revisited*, 127 of 915 citations; contents compared with *Slope filtrations revisited*, *Finiteness* and *Weil II*: independent (RD.6 cites Weil II in the order §5, §2, §6.6, §3, §4, §6; RD.1 joins radii from other sources to SFR §§3–5).

## Not verifiable

- Katz, *A simple algorithm for cyclic vectors* (RD.1.5), Katz, *Slope filtration of F-crystals* (RD.3.43, RD.3.44), Dwork (RD.1.63), Conrad's handout (RD.0.33), Edixhoven and Kedlaya's errata (RD.7.13): not fetched in this review; the statements were checked by computation.
- The work `[45]` of Fargues–Fontaine cited at `README.md:14573`: the text was not fetched, so R04 does not name it.
- Milne-LEC line 6037: the extraction drops some inequality signs, so whether the printed proof says `< 1` or `≤ 1` could not be settled.

## Source issues

- **Misprint** in Kedlaya, *Notes on isocrystals* (arXiv:1606.01321v6) at Remark 5.2, p. 11: the source says the considerations apply to part (c), and so part (b), “of Theorem 3.12(c)”; it should be of Theorem 3.12; affects nothing.
- **Misprint** in Kedlaya-FF at the proof of Theorem 5.1, condition (a), p. 11: the source says `φ(Fv)` equals `p^ℓ φ(v)`; it should be `p^ℓ φ(v)^σ`, as in Lemma 4.2 on p. 10; affects nothing.

## For the human reviewers

- none
