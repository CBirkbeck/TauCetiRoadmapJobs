# Review of DiophantineApproximationAndTranscendence (pull request #3027 at cd123f8)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 136 changed lines since `74a09b7`. The folder is the text the previous review read (no line of it changed since), so the change is again §1.3a (spherical heights of multihomogeneous forms), §§2.5a–2.5c (the adelic heights H_A, their submodularity and their Northcott property) and four declarations of `Suggested.lean`; every statement, route and Check in it was recomputed independently on explicit and degenerate cases, the locators were read in Philippon 1991, Bost 2001, Roy–Thunder and Gaudron, and the Lean definitions were compared with the pinned Tau Ceti heights and idele norm. There is no finding. The previous review's three small corrections and its format note are not taken up and are repeated below, none blocking. One point is left for the humans: BGS94 was not read, and its corollary is checked only as Bost 2001 quotes it.

## C01 — The two new theorems of `Suggested.lean` are checks of the new definitions, not headline theorems

`adelicSubspaceHeight_one` (line 315) is the comparison of `adelicSubspaceHeight` at `A = 1` with Tau Ceti's `Submodule.subspaceHeight`, and `adelicSubspaceHeight_top` (line 324) is the extreme case `U = ⊤`; README §2.5a lists both among the elementary properties. The module docstring says the file states the headline theorems, and its new paragraph (lines 56–58) presents these two as what the file says about H_A, so a reader takes them for acceptance targets.

Neither is empty: with both definitions unfolded, `rfl` and `simp` leave each goal open at the pins, and `_top` needs the product formula and the sum of local degrees. The smallest repair is a clause in the two docstrings (or in the docstring's paragraph) saying that they are sanity checks of `adelicHeight` and `adelicSubspaceHeight`. If the adelic block is to be tested by the file, the submodularity of §2.5b and the Northcott property of §2.5c are statable with the same two definitions, and they are what the citing roadmaps consume.

## C02 — The README names neither the Lean declarations of §2.5a nor the Tau Ceti declarations they are built on

§2.5a (line 1412) writes H_A(x) "for adelicSymmetricPowerHeight"; `Suggested.lean` calls the vector height `adelicHeight` and the subspace height `adelicSubspaceHeight`. Neither name, nor either theorem name, occurs in the README, so a prose statement cannot be matched to its formal one. The Lean statements also use `NumberField.adeleExtension` (`TauCeti/NumberTheory/NumberField/Global/Adeles/Extension.lean`) and `TauCeti.GlobalNumberFields.ideleNorm` (`TauCeti/NumberTheory/NumberField/Global/Ideles/Norm/Basic.lean`, line 283), imported at lines 39–40, which the "From Tau Ceti" contract does not list.

Would the author say in §2.5a that `adelicHeight` and `adelicSubspaceHeight` are H_A of vectors and of subspaces, name `adelicSubspaceHeight_one` at the standard data and `adelicSubspaceHeight_top` at the whole space, and add the two Tau Ceti declarations to the contract, with the remark that `|det A|_𝔄` is the `[K:ℚ]`-th root of the idele norm of `det A` (`coe_ideleNorm` uses the square at a complex place and the ideal-normalised norm at a finite one).

## C03 — The description does not say that this roadmap gains BanachSpaceTheory as a supplier

The "For reviewers" paragraph lists, roadmap by roadmap, the supplier relations the additions create; BanachSpaceTheory is named nowhere in the description, and neither are the four new sections of this roadmap. Yet §1.3a cites BanachSpaceTheory B7 in its *Needs:* line (line 630), in the Dependencies of Layer 1 (line 799) and in the "From other roadmaps" contract (line 4019). A sentence that would be right: "DiophantineApproximationAndTranscendence gains §1.3a (spherical heights of multihomogeneous forms), with BanachSpaceTheory B7 as a new supplier, and §§2.5a–2.5c (elementary properties, submodularity and the Northcott property of the adelic heights H_A)."

## N01 — Two new locators lack their page

Bost 2001's "proof of (4.29)" in §1.3a (line 622) is in the proof of Lemma 4.13, p. 207 (Bost2001 lines 1851–1877). Gaudron's Prop. 4.12, cited in §2.5c (line 1450), is on p. 53 (Gaudron line 1103).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §1.3a (iii) sup bound | N=1, P=a·s^e; N=2, P=z₁; N=2, P=z₁z₂ | \|a\| = \|a\|; sup 1, bound exp(−½+½)=1; sup ½, m=E log\|z₁z₂\|=−1, bound exp(−1+1)=1 | holds, sharp for z₁ |
| §1.3a constant −½·harmonic(N−1) | \|x₁\|² ~ Beta(1,N−1) on S^{2N−1} | E log\|x₁\| = ½(ψ(1)−ψ(N)) = −½·H_{N−1}; Bost2001 line 1866 has the same −(i/2)Σ_{m<d}1/m | agrees |
| §1.3a route of (iii) | g(λ)=σ(P)(ξu+λx′), ξ≠0 | g(0)=ξ^e·σ(P)(u) ≠ 0; circle mean = log\|lead\|+Σlog⁺\|a_i\| ≥ log\|g(0)\|; V_θ independent of x | sound |
| §1.3a (i) scalar invariance, Check 2 | ℚ, P=s, 2P | place 2: −log 2; spherical mean: +log 2; sum 0 | holds |
| §1.3a (i) extension | L/K of degree d | [L:K] embeddings above each σ; Σ_{𝔓\|𝔭} log\|P\|_𝔓 = d·log\|P\|_𝔭 (ideal-normalised); divide by d[K:ℚ] | invariant |
| §1.3a (ii) dominance hypothesis | i, j lex-least maximisers, p₁+p₂=i+j, p₁≠i | p₁<i gives \|f_{p₁}\|<\|f_i\|; p₁>i gives p₂<j, \|g_{p₂}\|<\|g_j\|; product strictly smaller | matches `gaussNorm_mul_eq_mul` hdom |
| §1.3a Check 3 | N=2, P=z₁z₂ | torus point has norm √2 ∉ S³; sup on S³ = ½ at \|z_i\|=2^{−½} | true |
| §2.5a whole space | w \| v finite and infinite | ∏_{w\|v}\|a\|_w^{1/[E:ℚ]} = \|a\|_v^{[E:K]/[E:ℚ]}; Σ_{w\|v} mult(w) = mult(v)[E:K] | = \|det A\|_𝔄 |
| §2.5a Checks 1–3 | ℚ, diag(1,e^{−c}); ℚ(i), x=(1,1); ℚ, n=1, A_∞=2 | e^{−c}, e^{−c}; (√2)^{2/2}=√2 against 2^{1/4}; 2·\|x\|_∞∏\|x\|_p = 2 | true |
| §2.5b submodularity | A=1, ℚe₁, ℚ(1,1); diagonal A, Ke₁, Ke₂; V⊂W | 1·1 ≤ 1·√2; both sides ∏\|a₁a₂\|_v^{d_v}; identical sides | holds |
| §2.5b route | y_V=y_{V∩W}∧z, y_{V+W}=y_W∧z | \|y_{V+W}\|\|y_{V∩W}\| = \|y_W\|\|z̄\|_{(V+W)/W}\|y_{V∩W}\| ≤ \|y_W\|\|y_V\| | sound at each place |
| §2.5c Northcott | A=1, n=2, B=√2; A_∞=diag(1,e^{−c}); V=0 | six subspaces (a²+b²≤2 gives four lines); H(ℚe₂)=e^{−c}<1; H(0)=1 ≥ exp(0) | holds; c(A) formula gives −c(A)p ≤ log c_p |
| `adelicHeight` at A=1, L=K | against `TauCeti.height2` (Basic.lean:65) | same Σ‖·‖² with exponent mult/(2[K:ℚ]); same sup with exponent 1/[K:ℚ] | equal |
| `adelicHeight`, junk | ι′ empty; A=0 | infinite factor 0; finprod with infinite support = 1 | not reached: minors index is nonempty, theorems take 1 and GL |
| `adelicSubspaceHeight_one` | ι empty; U=⊥; ℚ, U=ℚ(1,1) | 1=1; single empty minor 1, Plücker 1, height 1 = `subspaceHeight ⊥`; √2=√2 | true; `rfl`, `simp` fail |
| `adelicSubspaceHeight_top` | ι empty; K=ℚ, L=ℚ(i), n=1, A_∞=2; K=L=ℚ(i), A_∞=2 | 1=1; 2·(\|b\|²∏\|b\|_𝔓)^{½}=2 = ideleNorm; 2 = (\|2\|²)^{½} | true; `rfl`, `simp` fail |

- Source locators read at the text: 16 of the 17 in the changed passages. Philippon 1991: Théorème 1 p. 255, §1 pp. 257–258, Corollaire 2 p. 264, Proposition 4 p. 266 (its display is illegible in the OCR; the constant was computed and agrees with Bost), §2 B p. 273. Roy–Thunder: §1 pp. 3–4, p. 5, Lemma 3.1 p. 8, Propositions 4.1 and 4.2 with (4.1) p. 11. Gaudron: Props 4.12 p. 53, 4.23 p. 61, 5.3 p. 64. Bost 2001: p. 207. BGS94 only through Bost.
- Seeded sample: 1.3a and 2.5b fall in the change and were checked as above; the other thirteen targets are untouched text the change does not affect.
- Mathlib declarations opened at the pin: `MvPowerSeries.gaussNorm`, `gaussNorm_mul_eq_mul` (`Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean:58, 241`), `MeasureTheory.Measure.toSphere_apply_univ` (`Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:88`), `circleAverage_log_norm_sub_const_eq_posLog` (`Mathlib/Analysis/SpecialFunctions/Integrals/PosLog.lean:169`), `NumberField.prod_abs_eq_one` (`Mathlib/NumberTheory/NumberField/ProductFormula.lean:98`).
- Tau Ceti declarations opened at the pin: `TauCeti.height2` (`TauCeti/NumberTheory/Height/Arakelov/Basic.lean:65`), `absoluteHeight2` (`.../Arakelov/Absolute.lean:52`), `Submodule.subspaceHeight`, `one_le_subspaceHeight`, `finite_subspaceHeight_le` (`.../Arakelov/Subspace/Basic.lean:292, 336, 440`), `ideleNorm`, `coe_ideleNorm` (`.../Ideles/Norm/Basic.lean:283, 292`).
- Cross-roadmap citations resolved: BanachSpaceTheory B7 on main states the normalised spherical measure with rotation invariance and Mathlib's `Measure.toSphere` normalisation. The six roadmaps of this pull request that cite §§1.3a, 2.5a–2.5c cite them without restating; at this head the four Lean declarations exist in this roadmap's file only.
- The roadmap as a record: 0 headings removed, 4 added; every layer of the README at the merge base is present with its id and subject.
- Dependency check: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`. The automatic checks all passed. No file outside the pull request's own roadmap folders is changed.
- Elaboration: `Suggested.lean` elaborates with exit code 0; 48 warnings, all `declaration uses sorry`; no `set_option`, no sorried data. `#check @adelicHeight` shows every binder of its signature kept.

Overlap check: read SubspaceTheorem, HeightsAndUnits and LinearFormsInLogarithms (on main), ClassicalArithmeticCompletion and ArithmeticDynamics (open); nothing shared. SubspaceTheorem's scope leaves twisted heights to this roadmap's §§2.5–2.8; spherical heights of forms and the adelic heights H_A have this roadmap as their one owner.

Source independence: changed passages only. 11 passages compared with 4 sources (Philippon 1991, Bost 2001, Roy–Thunder, Gaudron), none shared beyond formulas and short definitional clauses; the routes of (iii), §2.5b and §2.5c are written differently from the sources' proofs. Largest share of the changed locators: Philippon 1991, 6 of 17. Contents not compared: the change adds sections inside existing layers and no layer. BGS94 was not read.

Research link: §1.3a is the local height at infinite places of Philippon 1991 and Bost–Gillet–Soulé 1994, used for heights of Chow forms; §§2.5a–2.5c are the twisted heights of Roy–Thunder 1996 with the submodularity and finiteness of Gaudron 2008, inputs of Bost's slope method (2001). Rests on the README and the four sources read.

## Not verifiable

- BGS94 (J. Amer. Math. Soc. 7, 1994), Corollary 1.4.3 and (1.4.10): no copy was read; the inequality was checked as Bost 2001 states it on p. 207 (Bost2001 lines 1865–1876), which agrees with (iii).
- Philippon 1991, Proposition 4, p. 266: the proposition is at its locator, but its displayed formula is not legible in the recognised text; the value −½·harmonic(N−1) was computed independently and agrees with Bost 2001.

## Source issues

- none

## For the human reviewers

- BGS94, cited in §1.3a (README line 622) for (iii), was not read; the cited corollary was checked only through its quotation in Bost 2001, p. 207.
