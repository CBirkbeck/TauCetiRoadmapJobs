# Review of DiophantineApproximationAndTranscendence (pull request #3027 at 477bb48)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 136 changed lines since `aecb53a`. The change adds four sections: §1.3a on spherical heights of multihomogeneous forms, and §§2.5a–2.5c on the adelic heights H_A, their submodularity and their Northcott property. It also adds two definitions and two theorems to `Suggested.lean`. Every statement and Check in the new text was recomputed on degenerate and explicit cases, every new locator was read in Philippon 1991, Bost 2001, Roy–Thunder and Gaudron, and the Lean definitions were compared term by term with the pinned Tau Ceti heights. There is no finding. There are three small corrections, none blocking: the two new theorems are checks of the new definitions rather than headline theorems; the README names neither the new Lean declarations nor the Tau Ceti declarations they are built on; and the description omits the new BanachSpaceTheory supplier. There is also one format note. One point is left for the humans: BGS94 could not be read, and its corollary was checked only as Bost 2001 quotes it.

## C01 — The two new theorems of `Suggested.lean` are checks of the new definitions, not headline theorems

`adelicSubspaceHeight_one` (line 315) compares `adelicSubspaceHeight` at `A = 1` with Tau Ceti's `Submodule.subspaceHeight`. `adelicSubspaceHeight_top` (line 324) is the boundary case `U = ⊤`. README §2.5a lists both among the elementary properties, as the "standard data" and the "extreme cases". The module docstring says the file states the roadmap's headline theorems, and its new paragraph (lines 56–58) presents these two as the file's statements about H_A. A reader therefore takes them for acceptance targets of the roadmap.

They are worth keeping: neither closes in one tactic, since `simp` with the two definitions unfolded and `rfl` both leave the goal open at the pins. The smallest repair is one clause in the two docstrings, or in the module docstring's paragraph, saying that they are sanity checks of `adelicHeight` and `adelicSubspaceHeight`. If the adelic block is meant to be tested in the file, two statements are already statable with the same two definitions: submodularity (§2.5b) and the Northcott property (§2.5c). They are also what ArakelovGeometryAndAbelianHeights §§1.5b and 1A.3 and SlopesOfHermitianVectorBundles consume.

## C02 — The README names neither the Lean declarations of §2.5a nor the Tau Ceti declarations they are built on

§2.5a (line 1412) writes H_A(x) "for adelicSymmetricPowerHeight", while `Suggested.lean` calls the vector height `adelicHeight` and the subspace height `adelicSubspaceHeight`. Neither name occurs in the README, and neither do the two theorem names, so a reader cannot match a prose statement to its formal one. The Lean statements also consume two Tau Ceti declarations, imported at lines 39–40, that the "From Tau Ceti" contract (line 4003) does not list:

- `NumberField.adeleExtension`, in `TauCeti/NumberTheory/NumberField/Global/Adeles/Extension.lean`;
- `TauCeti.GlobalNumberFields.ideleNorm`, in `TauCeti/NumberTheory/NumberField/Global/Ideles/Norm/Basic.lean`.

Suggested repair:

- In §2.5a, say that `adelicHeight` and `adelicSubspaceHeight` are H_A of vectors and of subspaces.
- Name `adelicSubspaceHeight_one` at the standard data and `adelicSubspaceHeight_top` at the whole space.
- Add the two Tau Ceti declarations to the Tau Ceti contract. The idele norm is the product of `|·|^mult` at the infinite places and the ideal-normalised norms at the finite places, so `|det A|_𝔄` is its `[K:ℚ]`-th root.

## C03 — The description's list of new supplier relations omits this roadmap's

The "For reviewers" paragraph lists, roadmap by roadmap, the supplier relations that the additions create. It does not say that this roadmap now cites BanachSpaceTheory B7 (the normalised spherical measure and its invariance) for §1.3a, in the *Needs:* line of §1.3a (line 630), the Dependencies of Layer 1 (line 799) and the "From other roadmaps" contract (line 4019). A sentence that would be right: "DiophantineApproximationAndTranscendence gains §1.3a (spherical heights of multihomogeneous forms), with BanachSpaceTheory B7 as a new supplier, and §§2.5a–2.5c (elementary properties, submodularity and the Northcott property of the adelic heights H_A)."

## N01 — Two new locators lack their page

Bost 2001's "proof of (4.29)" in §1.3a (line 622) is the proof of Lemma 4.13, on p. 207. Gaudron's Prop. 4.12, cited in §2.5c (line 1450), is on p. 53.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §1.3a (iii) sup bound | N=1, P=a·s^e; N=2, P=z₁; N=2, P=z₁z₂ | N=1: \|P\|=\|a\|, bound \|a\|; z₁: sup 1, bound exp(−½+½)=1, sharp; z₁z₂: sup ½, bound exp(−1+1)=1 | holds |
| §1.3a constant −½·harmonic(N−1) | \|x₁\|² ~ Beta(1,N−1) on S^{2N−1} | E log\|x₁\| = ½(ψ(1)−ψ(N)) = −½H_{N−1}; Philippon 1991 Lemma 2(i), p. 268: −Σ_{l≤m}1/l | agrees with Prop. 4, p. 266 |
| §1.3a (i) scalar invariance, Check 2 | ℚ, P=s, 2P | Gauss norm at 2: −log 2; spherical mean: +log 2; difference 0 | holds |
| §1.3a (i) extension invariance | L/K of degree d | Σ_τ m_τ = d·Σ_σ m_σ; Σ_{𝔓\|𝔭} log\|P\|_𝔓 = d·log\|P\|_𝔭; divided by [L:ℚ] = d[K:ℚ] | invariant |
| §1.3a (ii) multiplicativity | P=Q=z₁, N=2, over ℚ; dominance hypothesis | h(z₁²) = −1 = 2·(−½); at lex-least maximisers every other antidiagonal pair loses strictly | holds |
| §1.3a Check 3 (sphere, not torus) | N=2, P=z₁z₂ | \|P\|=1 on torus (radius √2, off S³); sup over S³ = ½ at \|z_i\|=2^{−½} | true |
| §2.5a extreme cases, Check 1 | ℚ, n=2, A_∞=diag(1,e^{−c}), A_p=1 | H_A(e₂)=e^{−c}; H_A(ℚ²)=e^{−c}=\|det A\|; the inverse convention would give e^{c} | true |
| §2.5a complex exponent, Check 2 | ℚ(i), A=1, x=(1,1) | (√2)^{2/2}=√2 = value over ℚ; exponent 1/[K:ℚ] gives 2^{1/4} | true |
| §2.5a n=1, Check 3 | ℚ, A_∞=2 | 2\|x\|_∞∏_p\|x\|_p = 2 = \|det A\|; infinite place alone 2\|x\| | true |
| §2.5b submodularity, Checks | A=1, V=ℚe₁, W=ℚ(1,1); A_∞=diag(1,e^{−c}), same V, W; diagonal A, Ke₁, Ke₂ | 1·1 ≤ 1·√2; e^{−c} ≤ 1·√(1+e^{−2c}); both sides \|det A\| | holds |
| §2.5c Northcott, Checks | A=1, n=2, H≤√2; A_∞=diag(1,e^{−c}) | six: 0, ℚ², four lines with a²+b²≤2; c₁=e^{−c}, c₂=e^{−c}, c(A)=c; ℚe₂: e^{−c} ≥ e^{−c} | holds |
| `adelicHeight` at A=1, L=K | term by term against `TauCeti.height2` | same Euclidean sums, exponents mult/(2[K:ℚ]), ideal-normalised finite norms (`FinitePlace.norm_def`) | equal; docstring true |
| Λ^pA in `adelicSubspaceHeight` | minors through `ofFinEmbEquiv.symm` against `TauCeti.plucker` | Cauchy–Binet gives Λ^pA·plucker(x) = plucker(Ax); same ordering on both sides | consistent |
| `adelicSubspaceHeight_one` | ι empty; ℚ, U=ℚ(1,1) | 1 = 1; √2 = √2 | true; `simp`, `rfl` fail |
| `adelicSubspaceHeight_top` | ι empty; K=ℚ, L=ℚ(i), n=1, A_∞=2 | 1 = 1; \|2y\|_w^{2/2}·∏\|y\|_𝔓^{1/2} = 2 = ideleNorm(2) | true; `simp` fails |
| `adelicSubspaceHeight_top` normalisation | place v of K, w over v | Σ_{w\|v} mult(w) = mult(v)[L:K]; ∏_{𝔓\|𝔭}‖a‖_𝔓 = ‖a‖_𝔭^{[L:K]}; `coe_ideleNorm` uses \|·\|^mult | equals \|det A\|_𝔄 |

- **Source locators checked against the text.** 17 locators in the changed passages: 6 in Philippon 1991 (Théorème 1 p. 255, §1 pp. 257–258, Corollaire 2 p. 264, §2 pp. 265–266, Proposition 4 p. 266, §2 B p. 273), 5 in Roy–Thunder (§1 pp. 3–4, p. 5, Lemma 3.1 p. 8, Propositions 4.1 and 4.2 p. 11), 3 in Gaudron (Propositions 4.12 p. 53, 4.23 p. 61, 5.3 p. 64), 1 in Bost 2001 (p. 207) and 2 in BGS94 (through Bost's quotation only). All say what the README cites them for; Gaudron's proof of 4.23 uses the same quotient map as the route of §2.5b.
- **Mathlib declarations opened at the pin.** `MeasureTheory.Measure.toSphere` and `toSphere_apply_univ` (`Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:52, 88`). `MvPowerSeries.gaussNorm` and `gaussNorm_mul_eq_mul` (`Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean:58, 241`). `Polynomial.gaussNorm_mul` (`Mathlib/RingTheory/Polynomial/GaussNorm.lean:277`). `circleAverage_log_norm_sub_const_eq_posLog` (`Mathlib/Analysis/SpecialFunctions/Integrals/PosLog.lean:169`). `NumberField.prod_abs_eq_one` (`Mathlib/NumberTheory/NumberField/ProductFormula.lean:98`). `FinitePlace.norm_def` (`Mathlib/NumberTheory/NumberField/Completion/FinitePlace.lean:182`).
- **Tau Ceti declarations opened at the pin.** `NumberField.adeleExtension` (`TauCeti/NumberTheory/NumberField/Global/Adeles/Extension.lean:184`). `TauCeti.GlobalNumberFields.ideleNorm` and `coe_ideleNorm` (`.../Ideles/Norm/Basic.lean:283, 292`). `TauCeti.height2` (`TauCeti/NumberTheory/Height/Arakelov/Basic.lean:65`). `Submodule.subspaceHeight` (`.../Arakelov/Subspace/Basic.lean:292`). `TauCeti.plucker` (`TauCeti/LinearAlgebra/ExteriorPower/Plucker.lean:104`).
- **What the libraries lack.** Neither library has adelic or spherical heights. Mathlib has no invariance of `toSphere` under linear isometries, so the citation of BanachSpaceTheory B7 is needed.
- **Cross-roadmap citations resolved.** BanachSpaceTheory B7 on main (the normalised spherical measure with the `Measure.toSphere` normalisation, and rotation invariance); GlobalNumberFields (completed); the adelic symmetric powers paragraph of §2.5. The consumers of the new sections were read and consume them without restating them: ArakelovGeometryAndAbelianHeights §§1.5b and 1A.3, HeightsRationalPointsAndObstructions §5.9b.1, SlopesOfHermitianVectorBundles, AdelicHeightsAndSuccessiveMinima and ChowFormsAndHeightsOfSubvarieties.
- **The roadmap as a record.** Every layer and item of the README at the merge base is present at the head. The change adds §§1.3a and 2.5a–2.5c and extends three sentences: the Dependencies of Layer 1, the ownership list in Scope, and the "From other roadmaps" contract.
- **Automatic checks and dependency check.** All automatic checks passed. Dependency check: `depcheck: 10 roadmaps, 95 edges, 0 problem(s)`.
- **Elaboration.** `Suggested.lean` elaborates with 48 warnings, all `declaration uses sorry`, and no error. `#check @` of the four new declarations shows the README's generality: A over K; x or U over any number field L with `Algebra K L`; `GL ι` in `_top`. No hypothesis is lost. Only 1.3a and 2.5 of the seeded sample fall in the change; the other thirteen sample targets are untouched and unaffected text and were not checked here.

Overlap check: read SubspaceTheorem, HeightsAndUnits and LinearFormsInLogarithms (on main), ClassicalArithmeticCompletion and ArithmeticDynamics (open revisions); nothing shared. Spherical heights of forms and the adelic heights H_A have one owner, DiophantineApproximationAndTranscendence, and the roadmaps listed above cite it.

Source independence: changed passages only. 18 passages compared with 4 sources read (Philippon 1991, Bost 2001, Roy–Thunder, Gaudron); none shared beyond formulas and short definitional clauses, and none is a translation of the French sources. Largest share of the changed locators: Philippon 1991, 6 of 17. Contents not compared, since the change adds sections inside existing layers and no layer.

Research link: §1.3a is the archimedean local height of Philippon 1991 and Bost–Gillet–Soulé 1994, used for heights of Chow forms. §§2.5a–2.5c are the twisted heights of Roy–Thunder 1996 and the submodularity and finiteness of Gaudron 2008, inputs of the slope method (Bost 2001) and the absolute Siegel lemma. This rests on README §§1.3a and 2.5–2.5c and on the four sources read.

## Not verifiable

- BGS94 (J. Amer. Math. Soc. 7, 1994), Corollary 1.4.3 and (1.4.10): the AMS landing page is on a host the sources service does not classify, so the text was not read. The inequality was checked as Bost 2001 states it on p. 207, and it agrees with (iii).

## Source issues

- none

## For the human reviewers

- BGS94, cited in §1.3a (README line 622), was not read, because the publisher's host is in no licence class the sources service knows. The cited corollary was checked only through Bost 2001, p. 207.
