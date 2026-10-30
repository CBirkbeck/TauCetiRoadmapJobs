# Review of PadicDifferentialEquationsAndRigidCohomology (pull request #1002 at 78e1762)

**Verdict:** needs changes

The push gate fails (`residue=538`, every `<a id="rd-k-n"></a>` anchor), so the folder cannot be accepted whatever else is found. One blocking finding (R01): the third declaration of `Suggested.lean` restates a theorem that DeligneWeightsAndPurity §4.4 already declares at its open head. Everything else is P3. The dependency check is clean (`depcheck: 209 roadmaps, 1474 edges, 0 problem(s)`).

## R01 (P2) — `RD7.weightSeparated_factor_extraction` restates DeligneWeightsAndPurity's `degreeFactorExtraction`

**Location.** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/Suggested.lean` lines 99–118; README §RD.7.5 ("`Suggested.lean` states the unique integral factor extraction as `RD7.weightSeparated_factor_extraction` over every characteristic-zero coefficient field").

**Claim.** The README itself says "The canonical extraction API is `degreeFactorExtraction` in DeligneWeightsAndPurity §4.4" and describes RD.7.5 as a companion-matrix adapter to that supplier. The Lean file nevertheless states the extraction theorem again as one of this roadmap's three headlines.

**Witness.** DeligneWeightsAndPurity `Suggested.lean` at the head of its open pull request (read with `roadmaps show DeligneWeightsAndPurity --file Suggested.lean`) declares `theorem degreeFactorExtraction` over an arbitrary nonempty family of fields `E a` with `[Algebra ℚ (E a)]`, invertible finite-dimensional `F a i`, `IsPure (q : ℝ) i`, the same even/odd cross-multiplied identity `R.num · ∏_{even} charpoly.reverse = R.denom · ∏_{odd} charpoly.reverse`, concluding `∃! P : Fin (d+1) → ℚ[X]` with `P i (0) = 1`, and integrality in `ℤ[X]` under the integral-series branch (`∃ S : PowerSeries ℤ, denom · S = num`). Taking one field `L`, `V i := L[X]/(reverse (P i))` with `F i` = multiplication by `X` (invertible since `P i (0) = 1`, `charpoly.reverse = P i`), and `S := A/B ∈ ℤ[[t]]` (valid because `B(0) = 1`) gives exactly the PDERC statement, including uniqueness (`ℤ[X] → L[X]` is injective in characteristic 0). The two statements are one object with two owners; the merge order places DeligneWeightsAndPurity before this roadmap.

**Repair (tested on the instance above).** Delete `RD7.weightSeparated_factor_extraction` and the `RD7` namespace from `Suggested.lean`; keep RD.7.5 in the README as the adapter target it already is, citing DeligneWeightsAndPurity §4.4 `degreeFactorExtraction` by name, and rewrite its two sentences that name the Lean declaration in prose (the gate's `readme-ids` check reads them). In the module docstring, list the Weil-factor comparison of RD.7 among the headlines not statable at the pins and say that the weight-separated extraction is DeligneWeightsAndPurity's. The P¹ Check of RD.7.5 (`P_0 = 1 − t, P_1 = 1, P_2 = 1 − qt`) then names no Lean declaration.

## R02 (P3) — gate: 538 `<a id=…>` anchors fail the residue rule

**Location.** `README.md` lines 669, 703, …, 15440: one `<a id="rd-k-n"></a>` before each of the 538 target headings (the worker's gate lists them; `residue=538`, `FAIL`).

**Claim and witness.** The residue rule forbids `<a id=` anchor tags; the gate output in the job's scratch names every line. The 500-odd links of the form `[§RD.6.64](#rd-6-64)` depend on these anchors.

**Repair.** Delete every anchor line (and the blank line it leaves). Replace each `[§RD.k.n](#rd-k-n)` link either by plain text `§RD.k.n` or by GitHub's generated heading anchor of the `### RD.k.n Title` line. Re-run the gate; the count must be 0.

## R03 (P3) — three target headings are malformed, so the board cannot read RD.1.14, RD.2.35 and RD.2.25a

**Location.** `README.md` line 2690: ``### RD.1.`14 ∇`-modules solvable at the boundary …``; line 5417: ``### RD.2.`35 ∇`-modules that become constant over `R^L` …``; line 5130: ``### RD.2.`25a c`-constancy under the Fontaine–Katz equivalence``.

**Claim.** The backtick that should open the code span after the number was placed before it, so the heading text is `RD.1.` followed by a code span `14 ∇`. The board reads targets from `### RD.k.n Title` lines; these three are not read (the heading list of the file skips 1.14, 2.35 and 2.25a), while six `*Needs:*` lines cite RD.1.14 (lines 2763, 2788, 3531, 3548, 3955, 4366) and the supplier contracts cite RD.2.35.

**Repair.** Write `### RD.1.14 `∇`-modules solvable at the boundary (overconvergent, 'soluble en 1')`, `### RD.2.35 `∇`-modules that become constant over `R^L` …` and `### RD.2.25a `c`-constancy under the Fontaine–Katz equivalence`.

## R04 (P3) — CrystallineCohomology declaration names that do not exist at its head

**Location.** `README.md` line 532 (`LogCrystalline.convergentLogComplex.site_compare`, cited as §CR.6.4) and line 534 (`LogRigidHK.complex`, cited as §CR.6.5); the same names recur in RD.4.42–RD.4.48.

**Witness.** CrystallineCohomology at the head of its open pull request (`roadmaps show CrystallineCohomology`, 11678 lines, and its `Suggested.lean`, 90 lines) contains neither string. §CR.6.4 ("Convergent complexes on tubes and Witt models") does state the support kernels, the signed monodromy triangle and the embedding-refinement cocycles in prose, and §CR.6.5 states the proper log rigid/crystalline Hyodo–Kato comparison, so the objects are owned there; only the backticked names are invented.

**Repair.** Cite §CR.6.4 and §CR.6.5 by section and by the object's prose name ("the site comparison of CR.6.4", "the log rigid Hyodo–Kato complex of CR.6.5"); remove the two backticked names everywhere they occur.

## R05 (P3) — AdicSpacesPartIII §R3.36 does not exist

**Location.** `README.md` line 7729 (RD.4.2, proof step 3: "differential forms on the rigid space `V`, supplied by AdicSpacesPartIII §R3.36").

**Witness.** AdicSpacesPartIII on main has sections R3.1–R3.9 only; R3.6 is "the sheaf of continuous differentials and Kiehl's proper mapping theorem". The `roadmaps resolve` lead for this README reports the same.

**Repair.** Replace §R3.36 by §R3.6.

## R06 (P3) — RD.1.6 attributes Lemma 1.2.4 to the wrong paper

**Location.** `README.md` line 2492 (RD.1.6 Check: "The nonzero-derivation hypothesis is missing from Swan conductors II, Lemma 1.2.4").

**Witness.** Kedlaya, *Swan conductors … II: Global variation* (kedlaya-swan2, arXiv:0705.0031) has Lemmas 1.2.2, 1.2.6, 1.2.7, 1.2.8 and no Lemma 1.2.4 (kedlaya-swan2 lines 155–201). The lemma meant is Kedlaya–Xiao, *Differential modules on p-adic polyannuli*, Lemma 1.2.4 (kedlaya-xiao line 224, p. 6), which RD.1.7 and the *Corrections to the sources* entry cite correctly.

**Repair.** Write "Kedlaya–Xiao, *Differential modules on p-adic polyannuli*, Lemma 1.2.4".

## R07 (P3) — API bullets and Checks carry Lean-style names that `Suggested.lean` does not declare

**Location.** Throughout; the worker's `roadmaps resolve` lists 475 backticked names found nowhere, e.g. `README.md` line 2370 (`TwistedPolynomial.T_mul`), 2393 (`katzCandidate`), the RD.1.2 Checks labelled `twistedPolynomial_T_mul_t`, `cyclicVector_rankOne`, and the RD.1.14 Checks labelled `isSolvable_trivial`, `not_isSolvable_large_constant`.

**Claim.** The README rules of the brief say an API bullet carries a backticked name of this roadmap's own only when `Suggested.lean` declares it, and a Check never names a Lean counterpart. `Suggested.lean` declares four names; the other 475 are claims about declarations that do not exist. (The gate's `readme-ids` check passes because it reads only namespace-qualified names.)

**Repair.** The author's choice: write the API bullets and Check labels in prose (the standard form on main, e.g. AdicSpacesPartIV, whose five backticked API names all exist in its Lean file), or keep the names and accept that they are not checked.

## R08 (P3) — style: RD.4.54 inside Layer RD.5, and the module docstring title

**Location.** `README.md` line 11070 (`### RD.4.54 …` between RD.5.78 and RD.5.79, under `## Layer RD.5`); `Suggested.lean` line 4 (title "…: headline targets").

**Claim.** A target labelled RD.4 that needs RD.5.78 and is printed inside Layer RD.5 makes the layer labels disagree with the build order (*How to read the build* explains it, but a reader of the RD.4 layer never finds it). Nothing cites RD.4.54 (only its own anchor matches `rd-4-54`), so renumbering costs nothing. The form rule asks for the docstring title "<title>: target signatures".

**Repair.** Renumber the target RD.5.78a (or the next free RD.5 number) and delete the sentence about it in *How to read the build*; retitle the docstring.

## Verified sound

**Gate and dependency direction.** The worker's gate at 78e1762 fails only on `residue=538` (R02); `set_option`, LaTeX, sorry-data, imports, build and stray-files all 0; the folder holds exactly README.md, Suggested.lean and metadata.toml, and `git diff --stat origin/main...HEAD` outside the folder is empty. I re-ran the dependency check with the brief's command: `depcheck: 209 roadmaps, 1474 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line). The merge order lists this roadmap after CongruenceSpectralGap, its last supplier.

**Elaboration and the one-tactic probe.** On a scratch copy of `Suggested.lean` I replaced each `sorry` by `first | rfl | infer_instance | (simp; done)` and appended `#check @` for the four declarations; `lake env lean` from the worktree reports "unsolved goals" for `arabia_controlled_lifting` and "`simp` made no progress" for `katz_cyclic_vector` and `weightSeparated_factor_extraction`: nothing is padding by the one-tactic test. The elaborated types agree with the worker's `signatures.md`; no section binder is lost (each declaration carries `CommRing`/`Algebra`/`Algebra.Smooth`, `Field`/`CharZero`/`FiniteDimensional`, `Field`/`CharZero` explicitly). README and Lean agree on the four names (`RD0.arabia_controlled_lifting`, `RD1.CyclicFor`, `RD1.katz_cyclic_vector`, `RD7.weightSeparated_factor_extraction` all appear in the README at the stated targets).

**Headline theorems.** The README's end theorems are Kedlaya's slope filtration theorem (RD.2.7), the p-adic local monodromy theorem (RD.2.31–RD.2.33), finiteness (RD.5.76) and Poincaré duality (RD.5.89) of rigid cohomology with coefficients, p-adic Weil II (RD.6.85) and the equality of crystalline, rigid and ℓ-adic Weil factors (RD.7.7–RD.7.9). None is statable at the pins: Mathlib's `WittVector.Isocrystal` (`Mathlib/RingTheory/WittVector/Isocrystal.lean` line 113, with `isocrystal_classification` at line 180, rank one over an algebraically closed field only) is the only isocrystal carrier, and there is no Robba ring, tube, overconvergent isocrystal or rigid cohomology in Mathlib or Tau Ceti at the pins; the module docstring says so, theorem by theorem. Of the statable targets, Arabia's lifting and the cyclic-vector theorem are owned here (`roadmaps grep 'Arabia'` finds no other roadmap; `roadmaps grep -i 'cyclic vector'` finds only operator-algebra and companion-matrix uses elsewhere, and FormalConnectionsOpers at its open head does not state it), and the extraction theorem is DeligneWeightsAndPurity's (R01).

**Library declarations opened at the pin.** `Algebra.FormallySmooth.exists_lift` (`Mathlib/RingTheory/Smooth/Basic.lean` line 125: nilpotent ideal only, as the README says); `WittVector.Isocrystal`, `isocrystal_classification` (above); `Polynomial.reverse_mul_of_domain` (`Mathlib/Algebra/Polynomial/Reverse.lean` line 276), used in my check of RD.7.5; `Differential` (`Mathlib/RingTheory/Derivation/DifferentialRing.lean` line 21); Mathlib has no cyclic-vector theorem for differential modules (grep of the pinned tree for "cyclic vector" hits only `GelfandNaimarkSegal.lean`).

**Cross-roadmap citations resolved (27).** On main: AdicSpacesPartIII §§R3.2, R3.4, R3.6, R3.7 (and the missing R3.36, R05); AdicSpacesPartIV §§F1.2, F1.3, F1.4, F1.5 (including the van der Put 2.4.4 (ii) lifting paragraph at its line 3988), F1.9, F1.10, F1.12; SchemeAndStackFoundations §§0.14, 0.20, 0.29, 4.12, 4.16, 4.19. At open heads: CongruenceSpectralGap §§4.2a–4.2b with `hyperKloosterman` and `hyperKloosterman_bound` (its `Suggested.lean` lines 42 and 51); DeligneWeightsAndPurity §§0.1, 0.2, 0.4–0.7, 0.9, 0.10, 1.1, 1.4, 1.5, 1.10, 2.7, 4.3, 4.4, 7.15; NoncommutativeAndEquivariantIwasawa §F.6 stages 1 and 2 (its lines 3736–3786); MotivesAndAlgebraicCycles §§6.1–6.3; CrystallineCohomology §§CR.1.2, CR.4.7, CR.3:duality.1, CR.3:Frobenius-isogeny.1, CR.6.4, CR.6.5 (names: R04); InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T4, IG.0.3, IG.1.2; ArithmeticGaloisRepresentations §§2.6, 3.1, 3.2, 3.4, 3.5, 3.7, 6.3. Ownership against the open pull requests whose files the brief gives was checked for the three Lean statements only; the 538 README targets were not individually searched.

**Sources read at their locators (11 texts, 34 locators).** arabia2001 (EMS Press copy of CMH 76): Théorème 2.1.2 lines 693–728 (printed p. 625: data `A →φ C ←p B`, `p` surjective with kernel `K`, `h̄ : Ā → B̄` with `φ̄ = p̄ ∘ h̄`; conclusion (b): étale neighbourhood `B_ε` of `I·K`, `p_ε` induced by `p`, `h_ε` with `h̄_ε = ε̄ ∘ h̄` and `φ = p_ε ∘ h_ε`), Corollaire 2.1.3 line 1147 (pp. 632–633, the case `K = B`), Théorème 2.2.2 line 1178 (pp. 633–634, via `B[T] → B ⊕ B`, kernel `(T(1−T))`), Proposition 3.2.5 line 1247 (§3 assumes `R` noetherian, §2 does not): the Lean statement is Arabia's (b) with "étale" in place of "complete-intersection étale", which is weaker and allowed. katz1987 (author's page): Theorems 1–2 and the defining formula `c(e,t−a) = Σ_{j<n} ((t−a)^j/j!) Σ_{k≤j} (−1)^k C(j,k) D^k(e_{j−k})` on p. 65 (read from the rendered page), proofs pp. 66–67, Remarks (2)–(3) p. 68. kedlaya-swan1: Definition 1.1.2 (line 70, p. 2), 1.1.4 (line 77, p. 3), Lemma 1.1.5 (line 83, p. 3), 1.1.8 (line 95, p. 3), Definition 2.5.1 (line 306, p. 9), Proposition 2.6.3 (line 380, p. 10). kedlaya-overview: Definition 4.1.7 (line 645, p. 17), Remark 4.4.2 and Proposition 4.4.3 (lines 779, 792), Remark 5.1.6 (line 1101, p. 28), Theorem 6.2.1 (line 1530, p. 39). kedlaya-xiao: Lemma 1.2.4 (line 224, p. 6), Definition 1.2.8 (line 243), Definition 1.4.1 (line 350), Remark 1.4.2 (line 368, p. 10). kedlaya-finiteness: Theorem 1.2.1 (line 108, p. 3), Theorem 1.2.3 (line 116, p. 4), Definition 4.3.1 (line 990, p. 27), Remark 4.3.3 (line 997, p. 27), Remark 9.2.1 (line 2400), Proof of Theorem 1.2.3 (line 2485, p. 65). kedlaya-fourier: (2.1.3) (line 415, p. 11), Theorem 5.3.2 (line 1529, p. 39), Theorem 6.6.2 (line 1960, p. 50), §6.6 (c) (line 2036, p. 52). kedlaya-sfr: Example 2.2.18 (line 353, p. 10), Definition 4.4.1 (line 1812, p. 47), Theorem 6.4.1 (line 2502, p. 65), Corollary 6.4.2 (line 2523, p. 66), Theorem 7.2.5 (line 2629, p. 68). kedlaya-plmt (arXiv): Theorem 1.1 (line 127, p. 4), §1.5 (lines 267–322, pp. 7–8). berthelot1986 (numdam): (2.2) line 300 (scan p. 11 = printed p. 16), (2.5) line 375 (printed p. 19). christol-dwork1994 (numdam): Proposition 3.1 line 581 (p. 680). milne-lec v2.21: Lemma 27.9 line 5976 (pp. 156–157), Lemma 27.10 line 6028 (p. 158), 27.14 line 6066 (p. 159). Each statement checked supports the README target citing it with the hypotheses the README states (RD.0.39, RD.1.2–RD.1.7, RD.1.14, RD.2.7, RD.2.31, RD.4.2, RD.5.76, RD.5.89, RD.6.23, RD.6.85, RD.7.4, RD.7.5).

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `RD0.arabia_controlled_lifting` | `S = R`; `I = R`; `C = 0`; `B = 0`; README Check 2 | `S = R`: `E = B`, `pE = p`, `hE = algebraMap`, `eI = id` satisfy all seven conjuncts. `I = R`: `IB = B`, `B/IB = 0`, `hbar` forced; conclusion is lifting of `φ` after an étale neighbourhood of `ker p` (Arabia 2.1.2 with `I = R`). `C = 0`: `p b − φ s = 0 ∈ IC`, statement is Corollaire 2.1.3. `B = 0`: `E = 0`. Check 2: `3² = 9 ≡ 2 (mod 7)`, `2·3 = 6` a unit, `B_ε/7 = 𝔽_7[x]/((x−3)(x+3))[1/(x+3)] = 𝔽_7`. A `B`-algebra map out of `B/IB` is determined by `B`, so the existential `eI` has one value | sound; matches arabia2001 lines 693–728 | none |
| `RD1.CyclicFor`, `RD1.katz_cyclic_vector` | rank 0; rank 1; `∂ = 0, V = K², D = 0`; char `p`; README Checks | rank 0: `finrank = 0`, `Module.Basis (Fin 0) K V` exists, `∃ v` true. rank 1: `v ≠ 0` is a basis. `∂ = 0`: `D = 0` on `K²`, `v, Dv = v, 0` never a basis, so `hδ` is necessary and present. char `p` (Katz Remark (2)): `D^p = 0` on `𝔽_p(t)^n`, excluded by `CharZero`. Unipotent Check: `e_2, De_2 = e_1/t` is a basis. Katz candidate `horizontal_two`: `j = 0` term `e_0`, `j = 1` term `x(e_1 − De_0) = x e_1`, so `c = e_0 + x e_1` | sound; Katz Thm 2 with `N = n(n−1)+1` as stated | none |
| `RD7.weightSeparated_factor_extraction` | P¹; `q = 1`; elliptic curve `y² = x³+x+1/𝔽_7`; genus-2 Check; `hcop` dropped | P¹: `A = 1`, `B = (1−T)(1−qT)`, `P_0 = 1−T`, `P_1 = 1`, `P_2 = 1−qT`; roots of the reverses `1 = q^{0/2}`, `q = q^{2/2}`: hypotheses satisfiable, not vacuous. `q = 1`, `L = ℚ(ζ_3)`, `A = 1−T`, `B = 1`, `P_1 = (1−T)(1−ζT)`, `P_0 = 1−ζT`: every conjugate has absolute value `1 = 1^{i/2}` but `P_0 ∉ ℤ[X]`, so `hq : 1 < q` is necessary and present. Elliptic curve: `#E(𝔽_7) = 5` (affine `x = 0, 2` give two points each), `a = 3`, `1 − 3t + 7t²`. Genus 2: `N_1 = 11`, `N_2 = 55`, `a_1 = 3`, `a_2 = (55 − 50 + 9)/2 = 7`, `1 + 3t + 7t² + 21t³ + 49t⁴`. `hcop` dropped: with `g = gcd(A,B)` monic-reversed in `ℤ[X]` by Gauss, the statement reduces to the coprime case, so `hcop` is unused for truth (P3 note). Uniqueness: `ℤ[X] → L[X]` injective | true as stated, but it is DeligneWeightsAndPurity's `degreeFactorExtraction` | R01 |
| Conventions: `a`-fold twisted Frobenius product | `a = 2`; `a = 3` | row convention `x ↦ σ(x)F`, iterate `σ^a(x) F^{σ^{a−1}} ⋯ F^σ F`; column convention with `G = F^T` gives `G G^σ ⋯ G^{σ^{a−1}} = (F^{σ^{a−1}} ⋯ F)^T`, same characteristic polynomial; `a = 2`: `F^σF` and `FF^σ` are cyclic rotations; `a = 3`: the reversed order `F F^σ F^{σ²}` with row matrices is not a rotation | the warning is correct | none |
| RD.6.47 Kummer `K_a` | horizontality; `q = 3, a = 1/2` | `∇(t^b e) = (b + a) t^b e dt/t`, `F(σ^*∇e) = qa t^b e dt/t`, so `b = (q−1)a`; `q = 3, a = 1/2`: `b = 1`, Teichmüller lift of `2` is `−1`, `F_{x_0} = −1` at `x_0 = 2`, `1` at `x_0 = 1` = quadratic character | sound | none |
| Conventions: slope normalisations and the RD.2.7 adapter | `q = p^a`, `e = v_π(p)` | `v_π = e·v_p = e·a·v_q`; RD.2.7's `s_i = e ×` (supplier's `p`-normalised slope) agrees with `deg_w = e_C·deg` of NoncommutativeAndEquivariantIwasawa §F.6 stage 2 | consistent | none |
| RD.7.4 (a)–(c) | `f = 1/(1 − t/2)`; `G = H = 1 − t/ℓ`; `f = 1/(1−t)` | coefficients `2^{−n}` not integral; `|−1/ℓ|_ℓ = ℓ > 1` with `f = 1`, `Hf = G`; reciprocal root `1` of `1 − t` has absolute value exactly `1`, so the bound is `≤ 1` (Milne 27.10, line 6034–6038) | sound | none |
| RD.0.40 (b) non-example | `Σ_{n≥1} p^n x^{p^n}` | in `O_K⟨x⟩` since `p^n → 0`; for `ρ > 1`, `p^{−n} ρ^{p^n} → ∞`, not overconvergent | sound | none |
| RD.1.14 solvability Checks | Dwork `E_π`; `D(e) = ae`, `|a| > ω` | `T(E_π, ρ) = ρ → 1`; `T = ω/(ρ|a|) → ω/|a| < 1` | consistent with kedlaya-swan1 Def 2.5.1 | none |
| *Corrections*: Kedlaya–Xiao Remark 1.4.2 | trivial module over a rational-type `K` | Def 1.2.8: `R = ω/|∂|_{sp,V}`, `IR = |∂|_{sp,K}/|∂|_{sp,V}`; rational type forces `|∂|_{sp,K} = ω/|u|`; trivial module: `IR = 1`, `R = |u|`, so `IR = |u|^{−1} R`, not `|u|·R` | the README's correction is right | none |
| *Corrections*: Kedlaya pLMT §1.5 | the lines `w±` | kedlaya-plmt lines 310–314: `∇w± = (−1/2 ± π y^{−1}) w± ⊗ dy/y`, a Dwork exponential in `1/y` times a tame character; not unipotent over `Γ_an,con[y]` as line 319 says | the README's correction is right for the arXiv text; the Annals equation itself not read | none |
| RD.5.76, RD.5.89, RD.6.85 hypotheses | against kedlaya-finiteness Thms 1.2.1, 1.2.3 and kedlaya-fourier Thm 6.6.2 | `K` complete DVR of mixed characteristic, `k` any field of characteristic `p`, `X` separated of finite type, `E` an overconvergent F-isocrystal; duality needs `X` smooth of pure dimension `d`; Weil II needs `E` `ι`-realizable | hypotheses identical to the sources | none |

## Not verifiable

- Magid, *The cyclic vector lemma* (RD.1.7): no legal copy found (arXiv search and web search); RD.1.7 is covered by kedlaya-swan1 Lemma 1.1.5 and christol-dwork1994 Proposition 3.1, which I read.
- Kedlaya, *A p-adic local monodromy theorem*, Annals 160 (2004) pages (§1.5 p. 101, §6.4 p. 180, Theorem 1.2 p. 97): the Annals site is not a host the service accepts; the arXiv version (kedlaya-plmt) was read instead, where §1.5 is pp. 7–8 and Theorem 1.1 p. 4. The README's claim about the Artin–Schreier equation printed in the Annals version is therefore unverified; the arXiv version has no such equation.
- Berthelot, *Finitude et pureté cohomologique en cohomologie rigide* (RD.4.24, RD.5): the author's Rennes page timed out; the only other copy found is a third-party mirror, not used.
- Monsky–Washnitzer, *Formal cohomology I* (RD.0.40): Annals 1968, JSTOR only; cited by locator, not read.
- Deligne, *La conjecture de Weil I* (RD.7.4, RD.7.5): numdam copy not fetched this round; Milne's Lemmas 27.9–27.10, which carry the same argument, were read.
- The 500-odd targets outside the sample were read for shape (every layer has `### Examples` and `### Dependencies`, 16 such headings; every sampled target has hypotheses, a locator and at least three Checks) but their mathematics was not individually computed.

## Source issues

- **Misprint** in kedlaya-xiao at Remark 1.4.2, printed page 10: the source says the intrinsic radius equals `|u|` times the generic radius; it should be `|u|^{−1}` times it (trivial module: `IR = 1`, `R = |u|`); affects a stated result.
- **Gap** in kedlaya-swan1 at Lemma 1.1.5, printed page 3: the source says every differential module over a characteristic-zero differential field has a cyclic vector; it should add that the derivation is nonzero (`∂ = 0`, `V = F²`, `D = 0` has none); affects a stated result.
- **Gap** in kedlaya-xiao at Lemma 1.2.4, printed page 6: the source says every differential module over a characteristic-zero field has a cyclic vector; it should add `∂ ≠ 0` (same counterexample); affects a stated result.
- **Error** in kedlaya-plmt (arXiv version) at §1.5, printed page 8: the source says the Bessel module becomes unipotent over `Γ_an,con[y]`, `y = (t/4)^{1/2}`; the displayed lines carry `±π dy/y²`, so a further Artin–Schreier cover `z^p − z = y^{−1}` (and `s² = y`) is needed; affects nothing (an illustrative example).
