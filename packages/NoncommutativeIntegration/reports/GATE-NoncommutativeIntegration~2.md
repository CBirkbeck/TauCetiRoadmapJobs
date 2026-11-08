# GATE-NoncommutativeIntegration~2: answers to human review

Commit `87c249ae` on top of `bb121b30` (not pushed). Files changed: `TauCetiRoadmap/NoncommutativeIntegration/README.md` only; `TauCetiRoadmap/NoncommutativeIntegration/Suggested.lean` is unchanged.

The review thread has one comment with one point (the overlap with the NoncommutativeGeometry revision). Its last line asks for the label to go back to `awaiting-review`. That is a request to the worker, not a point about the mathematics.

## H01 (roed-math) — answered

This roadmap stays the owner, as main assumes, so NoncommutativeGeometry stays in Downstream consumers. Main's `TauCetiRoadmap/NoncommutativeGeometry/README.md` consumes exactly these objects from I1: line 59 ("Tracial Lp, including 0<p<1, Hölder/quasi-norm inequalities and weak Lp; specialize to B(H) …") and N4 lines 372–375 ("I1's weak L₁ specialization" `S_(1,∞)`, "I1's weak Schatten space"). The N3 build at the head of the open NoncommutativeGeometry revision belongs to a revision of a main roadmap, which this roadmap cannot cite as a supplier. Checking that interface showed I1 had not stated what main consumes, and that it planned the B(H) quasi-ideal a second time on a sequence model. Both are now repaired:

- **§1.5 (README lines 354–371).** The old text was "For 0<p<1 define S_p by summability of the p-th powers of the singular values …, prove the p-triangle inequality, the ideal estimates, completeness of the p-metric, and identify it with Lp(B(H),Tr)". It now proves `μ_t(x)=a_⌊t⌋(x)` on B(H) from OperatorIdeals Part A's approximation numbers, and deduces `x∈Lp(B(H),Tr) ⟺ ∑_j a_j(x)^p<∞` with `‖x‖_p=(∑_j a_j(x)^p)^(1/p)` for every 0<p<∞. It states that for 0<p<1 the quasi-ideal S_p is Lp(B(H),Tr), whose p-triangle, ideal, completeness and constant-one Hölder laws are the B(H) instances of §1.3–§1.4 and are not proved again.
- **§1.6 (lines 396–401).** It gains the weak Schatten identification, gauge `sup_(j≥0)(j+1)^(1/p)a_j(x)` and `S_(1,∞)` at p=1, which main's N4 consumes and I1 never stated.

### Evidence and consequences

- **Reviewer's facts.** All are confirmed at the heads named. At this PR's base, the scope (old lines 20–23), §1.4 (Hölder for all positive exponents) and §1.5 (S_p for 0<p<1) said what the comment quotes. In the NoncommutativeGeometry revision, the supplier table (line 132) has no I1 row, N3 (lines 509–526) defines `S_p={T compact : Σ_j μ_j(T)^p<∞}` with the p-triangle inequality, ideal bounds, completeness and constant-one Hölder, and N4 (lines 675–678) defines `S_(1,∞)` and `L^(p,∞)` from OperatorIdeals' singular values. The other open pull request touching that roadmap, the TauCeti bump, keeps main's I1 row and the N4 "I1's weak …" wording.
- **Other owners.** OperatorTheory/OperatorIdeals on main owns S_p only for 1≤p≤∞ (`TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md` line 97). It has no Hölder inequality, no p<1 and no weak ideal. A grep of main and every open head for `S_(1,∞)`, "weak Schatten", "quasi-ideal" and `0<p<1` finds the B(H) objects only in this roadmap and in NoncommutativeGeometry.
- **What this roadmap owns after the repair.** On B(H) it owns only the general (M,τ) theorems and the identification theorems, all stated with OperatorIdeals' approximation numbers. It plans no sequence-model construction. If the NoncommutativeGeometry revision merges first, the one change needed here is to drop the NoncommutativeGeometry line from Downstream consumers (that revision then cites this roadmap only as a deferral). Its B(H) N3–N4 build is then a special case of §§1.3–1.6, proved there by its own route, and is not something this roadmap re-plans. If this roadmap merges first, nothing here changes.
- **Further edits for consistency.**
  - The §1.5 Check "For 0<p<1 the diagonal operator with entries (1/n) lies in S_p exactly when p>1" was self-contradictory: no such p is below 1. It is replaced by three computed B(H) Checks (lines 382–392).
  - One computed B(H) weak-gauge Check is added to §1.6 (lines 415–419).
  - The Layer 1 Examples bullet for B(H) (line 427) and the Downstream consumers line (lines 1449–1452) now name §1.5–§1.6.
  - The Hiai reference entry lists Examples 4.13, 4.15 and 5.2 and Lemma 4.16.

### Adversarial pass on the changed statements

| statement | instances | values computed | result | change |
|---|---|---|---|---|
| `μ_t(x)=a_⌊t⌋(x)` on B(H) | rank-one projection e at t=1/2 and t=1 | μ_(1/2)(e)=1=a₀(e); μ₁(e)=inf{s: Tr 1_(s,∞)(e)≤1}=0=a₁(e) | holds, right-continuous at the integer | Check added (line 382) |
| same | x=diag(3,1), t=1 | for s<1 Tr=2>1, for 1≤s<3 Tr=1≤1, so μ₁=1=a₁ | holds, agrees with the §1.1 Check | none |
| same | identity on infinite-dimensional H | Tr 1_(s,∞)(1)=∞ for s<1 and 0 for s≥1, so μ_t=1; ‖1−F‖≥1 for rank F≤j (unit vector in ker F), so a_j=1 | holds for a non-compact x | Check added (line 389) |
| same | t∈(0,1); H=ℂ^d | ⌊t⌋=0, so μ_t=a₀=‖x‖, as in Hiai Example 4.13(1) (δ<1 forces e=1); a_j=s_j and a_j=0 for j≥d | agrees with §1.1 and §1.2 | none |
| route: cut e ↔ rank-⌊t⌋ approximant | Tr(1−e)≤t | rank(1−e)∈ℕ∪{∞} and ≤t, so ≤⌊t⌋; x−x(1−e)=xe; for e onto ker F: codim ker F = rank F, xe=(x−F)e | both inequalities a_⌊t⌋≤μ_t≤a_⌊t⌋ hold | none |
| `x∈Lp(B(H)) ⟺ ∑a_j^p<∞`, `‖x‖_p=(∑a_j^p)^(1/p)` | x=diag((j+1)^(−2)) at p=1, 3/4, 1/2 | ∑(j+1)^(−2)=π²/6≈1.645; ∑(j+1)^(−3/2)=ζ(3/2)≈2.612; ∑(j+1)^(−1)=∞ | in L¹ and L^(3/4), not in L^(1/2) | Check added (line 385) |
| same, wrong model "∑ a_j without the p-th power" | same x | ∑a_j=π²/6<∞ for every p | would put x in every Lp with p<1: excluded by the stated formula | recorded in the Check |
| zero-indexing, wrong model `a_⌈t⌉` | rank-one e | a_⌈t⌉(e)=a₁(e)=0 on (0,1), so ‖e‖_p=0 | contradicts ‖e‖_p=1 for e≠0 | Check added (line 382) |
| "such an x is compact" | ∑a_j^p<∞ | a_j→0, so x is a norm limit of rank-j operators | compact; the identity (a_j=1) is correctly excluded | none |
| S_p, 0<p<1, laws are §1.3–§1.4 instances | p=1/2, x=diag(1,0), y=diag(0,4) | ‖x+y‖_(1/2)^(1/2)=1+2=3=‖x‖^(1/2)+‖y‖^(1/2); ‖x+y‖_(1/2)=9>1+4 | p-triangle attained, triangle fails | none |
| Hölder instance | p=q=1, r=1/2, x=y=diag(1,1/4) | xy=diag(1,1/16), ‖xy‖_(1/2)=(1+1/4)²=1.5625=‖x‖₁‖y‖₁=1.25² | constant one attained | none |
| weak gauge `sup_j (j+1)^(1/p)a_j(x)` | rank-one e | sup_(0<t<1)t^(1/p)=1 (not attained) =(0+1)^(1/p)·1; unshifted sup_j j^(1/p)a_j(e)=0 | shifted form correct | Check added (line 415) |
| same | x=diag(3,1), p=1 | sup t·μ_t: 3 on (0,1), 2 on [1,2); max(1·3, 2·1)=3 | agrees with the existing §1.6 Check | none |
| weak Lp ⊋ Lp on B(ℓ²) | diag((j+1)^(−1/p)) | weak gauge sup_j 1=1; ∑a_j^p=∑1/(j+1)=∞ | in weak Lp, not in Lp; at p=1 in `S_(1,∞)`, not trace class | Check added |
| weak Lp elements compact | sup_j (j+1)^(1/p)a_j=C<∞ | a_j≤C(j+1)^(−1/p)→0 | compact; the identity has gauge ∞ | none |
| `S_(1,∞)` matches main's N4 definition | p=1 | `sup_j (j+1)a_j` is main's `sup_(j≥0)(j+1)μ_j(T)` | same set and gauge | none |

### Suggested.lean and signatures

`Suggested.lean` is unchanged, so the 10 elaborated signatures in the scratch `signatures.md` still apply, and I did not rerun the `#check` file. The one Lean link into the edited text is the `matrixLpGauge` docstring ("README §1.5 and §6.1"). §1.5 still states the M_d(ℂ) formula `‖x‖_p=(∑_j s_j(x)^p)^(1/p)` with the unnormalized trace. No new backticked Lean name of this roadmap was added to the README.

### Sources

Hiai, arXiv:2004.02383 (v1), was fetched from arXiv to check the four new locators:

- Example 4.13(1), line 1584: for B(H) with Tr, M̃=B(H).
- Lemma 4.16(2), lines 1628–1629: the projection-cut formula.
- Example 4.15(1), lines 1608–1613: μ_t is the n-th singular value on [n−1,n).
- Example 5.2(1), lines 1934–1936: Lp(B(H),Tr) is the Schatten p-class for 0<p<∞.

This job may not edit the manifest, so the fetch was run without `--manifest`. `sources.toml` still records only `Fan1951`, and Hiai is cited in the README by its arXiv link, as before. No text is missing, and no `needs-references.toml` was written.

### Ownership and citations

The roadmaps checked are main, the NoncommutativeGeometry revision head and the bump head. `roadmaps resolve` on the edited README reports no cross-roadmap citation and no Lean name that is found nowhere. Every cited supplier section is on main: OperatorTheory/OperatorIdeals Parts A–B and VonNeumannAlgebras. The repair adds no supplier.

## Build

`lake build TauCetiRoadmap.NoncommutativeIntegration.Suggested`: `Build completed successfully (8976 jobs).` The only warnings are the five expected "declaration uses `sorry`" warnings, at lines 76, 88, 97, 104 and 112.

## Gate

`gate NoncommutativeIntegration: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`--movable`): `depcheck: 239 roadmaps, 2344 edges, 0 problem(s)`. There are no UPWARD, CYCLE or `moved:` lines.
