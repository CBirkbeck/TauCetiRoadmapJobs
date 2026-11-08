# Review of ComplexKahlerGeometry (pull request #1234 at 06e0a3f)

**Verdict:** needs changes

Incremental re-review of the 33 lines changed since `617869f` (README only; `Suggested.lean` is byte-identical, `git diff 617869f HEAD -- TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` is empty; nothing changed outside the folder). The diff is the folder half of the previous R01 (the K6.1.RelativeIntegration ownership sentence), the whole of R02 (locators for the three K5a structure theorems, two References entries) and the whole of R03 (the unimodular clause and the Tau Ceti field version). All three repairs are correct against the sources, the pinned library and the cited heads (values below), and they introduce no new problem. What remains is outside the folder: the pull-request description still says nothing about #1768's single-owner claim (R01) and nothing about the four heads that conflict with this one (R02). Both findings need no edit to any file in `TauCetiRoadmap/ComplexKahlerGeometry/`. The gate passes, the dependency check reports no problem, every Lean statement elaborates and nothing closes with one tactic.

## R01 (P2) — The open-pair relative de Rham theory still has two declared owners: this folder now records the move, DeRhamCohomologyAndDuality's head still claims it (previous R01, partly repaired)

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1756–1759`, "K6.1.RelativeIntegration owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1, which extend them to models with corners, consume these instances."; the pull-request description, whose only merge-order statement is "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1186".

Claim: the folder half of the previous repair is done and correct (the sentence resolves: §2.4 at `DeRhamCohomologyAndDuality/README.md:384`, §3.1 `:443`, §3.2 `:465`, §3.3 `:486`, §4.1 `:512` at head `1b57dbe`; "every real model with corners" at `:72–73`; the dependency check with this sentence reports 0 problems). The other half, one sentence in the description saying that #1768 replaces its single-owner sentence and its consumer paragraph by a citation of K6.1.RelativeIntegration, was not written, and #1768's head is unchanged: it still says the relative chain comparison, the relative complex, relative integration and the compact-support formula "have a single owner, this roadmap" and that K6.1 "consumes" them. Two open heads therefore own the same statements in opposite directions.

Witness: #1768 `DeRhamCohomologyAndDuality/README.md:70–76` ("have a single owner, this roadmap … consumed from §§2.4, 3.1–3.3 and 4.1") and `:695–702` ("ComplexKahlerGeometry K6.1 (analytic cycles) consumes the boundaryless instances of §§2.4, 3.1–3.3 and 4.1"), head `1b57dbe0`, the head the previous review read; `scratch/pull-request.md` has no sentence naming #1768.

Repair: description only; nothing in this folder changes. Add one sentence to the description's merge-order paragraph: #1768 replaces its single-owner sentence (`README.md:70–76`) and its consumer paragraph (`:695–702`) by a citation of ComplexKahlerGeometry K6.1.RelativeIntegration for the boundaryless open-pair complex, relative integration and the compact-support formula, and keeps the corners extension and §4.2. Which pull request yields is a decision for the two authors; this review records only that the folder side of the move is complete and that the other head has not followed.

## R02 (P3) — The pull-request description states no order against the heads that conflict with this one or renumber what it cites (previous R04, not repaired)

Location: the pull-request description (`scratch/pull-request.md`), unchanged since the previous review.

Claim: unchanged. #1398, #1807, #1808 and #1854 each conflict with this head in this folder's README (the first three also in `Suggested.lean`); DifferentialGeometry's open revision #886 drops or renames the sections this README cites as a supplier (DG 5.5 at `:868, 1175`, 6.2 at `:1202`, 8.3–8.5 at `:1753–1787` and `:2438`); #848, #1285 and #1186 still take the exponential segment from ComplexComparisonPartII C5.4 rather than K4.P. The description names none of them and no rebase order.

Witness: `scratch/overlaps.md`, "Other open pull requests that change this roadmap": #1398, #1807, #1808, #1854, each "conflict in `TauCetiRoadmap/ComplexKahlerGeometry/README.md`"; `scratch/pull-request.md:46`, the only merge-order line. The DG, #848, #1285 and #1186 witnesses are those of the previous report (its R04), re-read at the same heads.

Repair: the three sentences of the previous report's R04, in the description only: (1) which of #1398, #1807, #1808 and #1854 is rebased on this pull request and which this one is rebased on; (2) #886 merges after this pull request and gives old → new numbering for DG 5.5, 6.2, 8.3–8.5 and 12.1/12.4; (3) #848 drops the single-owner clause at its line 147 and, with #1285 and #1186, cites K4.P for the frame torsor, the exponential segment and the `c₁` identification. Nothing in this folder changes.

## Previous findings

- R01 — partly repaired: "K6.1.RelativeIntegration owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1, which extend them to models with corners, consume these instances." (`:1756–1759`); the description sentence is missing and #1768 is unchanged: R01 above.
- R02 — repaired: "(Hörmann–Steinbauer, *Lecture Notes on the Theory of Distributions*, Theorem 4.22, pp. 89–90: the cutoff, finite order N and the fundamental solution `E_(N+2)` …)" (`:921–923`), "(Hörmander, … Theorem 2.3.5, in the product chart)" (`:932–933`), "(Hörmander, Theorem 2.3.4; Hörmann–Steinbauer, Theorem 1.70, p. 35)" (`:940–941`), "this roadmap's own worked example, whose proof is the estimate that follows" (`:947–948`); the two References entries (`:2489–2494`). Each locator verified or, for Hörmander, matched to the uncertified numbering (table below).
- R03 — repaired: "Own, as the unimodular case `d_i=1` of the elementary-divisor normal form that AbelianSchemesAndArithmeticModuli A5.4 states in general, the algebra target" (`:2176–2178`) and "Tau Ceti's `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` is the same induction over a field, where every nonzero functional is surjective; the integral step is the primitivity of `ω(x,−)`" (`:2186–2188`).
- R04 — not repaired: the description's merge-order line is still "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1186": R02 above.

## Verified sound

**Gate.** The worker's `gate.md` reports every counter at 0. My re-run of the brief's command:

```text
gate ComplexKahlerGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

**Dependency check** (`--movable`), exact output:

```text
depcheck: 237 roadmaps, 2333 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The two new prose citations (DeRhamCohomologyAndDuality §§2.4, 3.1–3.3, 4.1 at `:1757–1758`; AbelianSchemesAndArithmeticModuli A5.4 at `:2177`) are in the README that this run read, so the direction of both is confirmed mechanically. The roadmap is on main and not in `ORDER.txt`.

**Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ComplexKahlerGeometry'` is empty; `changes.md` lists no file outside the folder.

**Lean.** `Suggested.lean` is unchanged since `617869f` (md5 `c3be558e…`). `lake env lean` on a scratch copy with `#check @` of all 33 declarations exits 0 in 11 s with exactly 25 `sorry` warnings (the 25 theorems) and nothing else. The worker's `signatures.md` counts 35 declarations and reports two elaboration errors: its two extra "declarations" `on` (line 27) and `in` (line 30) are words of the module docstring ("the Dolbeault–Grothendieck lemma on an open polydisc", "the Newlander–Nirenberg theorem in its local form") that its scanner took for a `lemma` and a `theorem`; the file declares neither, and `grep -c '^lemma'` is 0. The four "looks dropped" leads are the same four definitions as in the previous round (`dolbeaultCocycles`, `dolbeaultCoboundaries`, `DolbeaultCohomology` without `[FiniteDimensional ℂ E]`; `lefschetzMap` without the finiteness, boundaryless, Hausdorff and compactness instances), whose bodies do not need the binders and whose theorems carry them; the elaborated types are those of the previous report, which compared each with its README statement.

**Padding probe.** On a scratch copy every `sorry` was replaced by `first | rfl | infer_instance | fun_prop | (simp; done) | (simp_all; done) | (exact ⟨inferInstance, inferInstance⟩) | decide | sorry` (24 tactic-line sorries in one run, the one-line `complexBesselSymbol_temperate` in a second); both runs exit 0 with 25 `sorry` warnings, so every fallback was used and nothing closes with one tactic. The headline list and the docstring reasons are unchanged from the previous report.

**Seeded sample, locators.** The sampled targets the diff touches are K5a.DistributionLocalStructure and K6.1.RelativeIntegration; the other thirteen are untouched text whose locators the previous report opened (its table, lines 124–144) and which this round did not re-open. Opened this round in `hormann-steinbauer-distributions` (cache `56f9d146`; printed page headers at the lines given):

| Target | Locator | Lines | Result |
| --- | --- | --- | --- |
| K5a.DistributionLocalStructure (a), continuous primitive | Hörmann–Steinbauer Thm 4.22, pp. 89–90 | 3737–3741 (one-variable `x_+^(k−1)/(k−1)!`, `C^(k−2)`, `k`-th derivative δ, `k≥2`), 3744–3753 (`E_k`, (4.7) `(∂₁⋯∂_n)^k E_k=δ`), 3751 (header "90 Chapter 4"), 3759–3772 (statement on bounded Ω; proof: cutoff ψ=1 on Ω, `ψu` of finite order N by 1.67(iii), `ũ=(∂₁⋯∂_n)^(N+2)E_(N+2)∗ũ`), 3809 (header "91", proof ends) | supports the statement as written: `H_m` is the one-variable `E_m`, the order is that of the cut-off distribution, `m=N+2`; the proof's last lines are on p. 91 |
| (b) point case | Hörmann–Steinbauer Thm 1.70, p. 35 | 1517 (header "35"), 1522–1528 (`⟨u,ϕ⟩=Σ_(|α|≤m)c_α∂^αϕ(x₀)` for supp u={x₀}), 1532 (some `c_α≠0`), 1802–1805 (= linear combination of `∂^αδ_(x₀)`) | supports the finite sum; linear independence is the README's own coefficient formula (row below) |
| (b) submanifold case | Hörmander ALPDO I, Thm 2.3.5; point case Thm 2.3.4 | uncertified key `hormander-alpdo1` | the numbering is that of §2.3 of the second edition (2.3.4 support in a point, 2.3.5 support in a submanifold, product coordinates `u=Σ u_α⊗∂^αδ`); not opened |
| (c) nonextension of `exp(1/‖x‖²)` | the roadmap's own worked example, `:947–948` | — | its estimate recomputed at `n=1` (row below) |
| K6.1.RelativeIntegration ownership sentence | #1768 `README.md:384, 443, 465, 486, 512; 72–73` | — | the five sections exist at head `1b57dbe0` and are stated over models with corners (R01 for the other direction) |

The README flags no locator as unverified. The two References entries are in house form (title, locator, what they are cited for; the Hörmann–Steinbauer URL is the university's own page, recorded in the manifest as `institutional`, `certified`; Hörmander has no URL and stays `uncertified`).

**Pinned declarations opened** (Tau Ceti `2fd255d`): `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` at `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:357`, stated for a nondegenerate alternating `B` on a finite-dimensional space over a field `K`, giving `Basis (Fin m ⊕ Fin m) K V` with matrix `Matrix.J`; `IsAlt.even_finrank` at `:365`. Neither admits a ring, as the README's clause says. The other declarations the changed passages name (`smoothSingularSubcomplex`, `SmoothSimplex.integral`, `realFundamentalClass`, `fundamentalClassOn`, `integralCup_self_add_self_eq_zero`, `singularUniversalCoefficientEquiv`, `singularKronecker`) are unchanged text, resolved by the previous report at the same pin.

**Cross-roadmap citations resolved this round:**

| Citation | Copy | Result |
| --- | --- | --- |
| DeRhamCohomologyAndDuality §§2.4, 3.1–3.3, 4.1 | #1768 `1b57dbe0`, `README.md:384, 443, 465, 486, 512` | exist; `:70–76, 695–702` still claim single ownership (R01) |
| AbelianSchemesAndArithmeticModuli A5.4 | #849 via `roadmaps show`, "### A5.4 Polarization types and the Pfaffian", item (1) | elementary-divisor normal form `[[0,D],[−D,0]]`, `d₁|⋯|d_g`, unique; its own sentence names the field version `exists_basis_toMatrix_eq_J` with every `d_i=1` |
| DifferentialGeometry 8.3–8.5, DG5 `integralTopForm` (unchanged `*Needs:*` at `:1787–1790`) | main `DifferentialGeometry/README.md:836, 845, 852` | as before |
| resolver lead "ComplexManifolds M2.1" (`:115`) | main `ComplexManifolds/README.md:197`, "## Milestone 2: the canonical real orientation" | Milestone 2 item 1; a false positive as in every previous round |
| resolver lead `CompactFormPair.operatorDomainV` (`:1299`) | VariationalMethods #1028 `Suggested.lean:185` (`def CompactFormPair.operatorDomainV`) | exists at that head; untouched text, cited with its roadmap and section |

**Ownership by object.** `scratch/overlaps.md`: no dropped id in either direction, no id only an open revision defines; the four conflicting heads are R02. The two sanctioned move-downs are now recorded in the README (the open-pair relative theory at `:1756–1759`, the unimodular symplectic normal form at `:2176–2178`); the first still has a second owner at #1768 (R01), the second does not (A5.4 keeps the general elementary-divisor statement and names the field version only). Ownership against the open pull requests whose files the brief lists was checked for these two objects only; the rest is untouched text.

**Adversarial pass.** The previous report's rows for the 25 Lean statements and the untouched sampled targets (its table, lines 150–180, and the recomputed values listed at its line 148) are carried forward unchanged, since neither the Lean file nor those passages changed. Rows computed this round, one per changed statement:

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `H_m(t)=t_+^(m−1)/(m−1)!` is `C^(m−2)` with `D^mH_m=δ` (`:913`) vs H–S (4.7) | `m=2`; `m=3` | `t_+`, continuous, `D t_+=H`, `D²t_+=δ` (H–S line 3733); `t_+²/2∈C¹`, `D³=δ`; H–S `E_k∈C^(k−2)`, `k`-th derivative δ, `k≥2` (3737–3741) | Pass | — |
| pairing needs `H_m(x−t)∈C^k` in `t` for `w` of order `k` | `m=k+2`; `m=k+1` | `C^(m−2)=C^k` ⊆ test class, pairing defined; `C^(k−1)` would not be, so `m≥k+2` is the exact bound and is H–S's `N+2` | Pass | — |
| H–S Thm 4.22 hypotheses vs the README's | bounded Ω ⊂ ℝⁿ, arbitrary `u∈D′(ℝⁿ)` vs interval `I`, `J⋐I`, `u∈D′(I)` | `w=χu` extended by 0 is in `E′(ℝ)` with `w=u` near `J̄`, so H–S applies with `Ω=J`; the order `N` is that of `w`, as the README says at `:924–926` | Pass | — |
| Thm 1.70 vs "finite delta-derivative sums and linear independence" | `u=Σ_(|α|≤m)c_α∂^αδ`, test `x^β` | `⟨u,x^β⟩=(−1)^|β|β!c_β`, so the `c_β` are determined: independence; this is the README's own coefficient formula `(-1)^|β|β!u_β` at `:936`, specialised to a point | Pass | — |
| Hörmander 2.3.5 form `Σu_α⊗∂_z^αδ(z)` vs the README | `S={z=0}⊂ℝ²`, `u=δ(z)⊗f(y)`; `u=∂_zδ(z)⊗1` | `N=0`, `u_0=f`; `N=1`, `u_(1)=1`, `u_0=0`, and `z·u=−δ(z)⊗1` gives `(−1)^1·1!·u_(1)=−1` as the formula at `:936` predicts | Pass | — |
| nonextension `exp(1/‖x‖²)` as the roadmap's own example | `n=1`, `c=1/8`, `φ_ε` | support `[ε(1−c),ε(1+c)]`, `1/x²≥(1+c)^(−2)ε^(−2)` there, integral `≥ C′ε·exp((1+c)^(−2)ε^(−2))`; a finite-order bound `Cε^(−N)`, with `‖∂^jφ_ε‖_∞=(cε)^(−j)‖∂^jφ‖_∞`, is polynomial in `1/ε`: contradiction for every `N` | Pass | — |
| ownership sentence `:1756–1759` | direction; content | CKG on main is the supplier, DRCD (#1768) the consumer: depcheck 0 problems; §§2.4, 3.1–3.3, 4.1 exist at `1b57dbe0` and are stated "over every real model with corners" (`:72`), so "extend them to models with corners" is what that head says | Pass | R01 (other head) |
| unimodular clause `d_i=1` of A5.4 | `[[0,1],[−1,0]]`; `[[0,2],[−2,0]]`; `g=0` | A5.4 (1) gives `D=diag(1)`, the README's basis; `D=diag(2)`, det 4, excluded here by unimodularity (no integral basis with `ω(a,b)=1`, since `ω(L,L)=2ℤ`); empty basis, `d=1` in both | Pass | — |
| "over a field every nonzero functional is surjective; the integral step is primitivity" | `L=ℤ²`, `ω=[[0,2],[−2,0]]`, `x=e₁`; same over ℚ | `ω(x,−)=2e₂^*`, image `2ℤ≠ℤ`: not surjective, and indeed no symplectic basis; over ℚ the same functional is surjective and `exists_basis_toMatrix_eq_J` applies (`e₁, e₂/2`): the field proof does not descend, exactly the clause's claim. Unimodular case: adjoint `L≃Hom(L,ℤ)` sends primitive `x` to a primitive functional, whose image `gcd(coefficients)·ℤ=ℤ` | Pass | — |
| References entries `:2489–2494` | house rules | no pull-request number, no process word, locators present, one entry per work, keys `hormann-steinbauer-distributions` and `hormander-alpdo1` in the manifest | Pass | — |

Ten rows computed this round; none failed. The only changes requested are the two description sentences.

## Not verifiable

- Hörmander's *The Analysis of Linear Partial Differential Operators I* is settled as uncertified; Theorems 2.3.4 and 2.3.5 are cited by the numbering of the second edition without the text. The manifest entry `hormander-alpdo1` carries the title "Linear Partial Differential Operators" (Hörmander's 1963 book, whose numbering differs); the key, the year 1990 and the README's title all mean the 1990 second edition of volume I, so the README is right and the manifest title is loose. A review edits no manifest.
- The Hörmann–Steinbauer text is the authors' 2009 draft (its pages carry a draft banner); the cited theorems are complete in it.
- DeRhamCohomologyAndDuality #1768 and AbelianSchemesAndArithmeticModuli #849 were read at the heads the brief gives (#1768 by checkout, #849 via `roadmaps show`); #1398, #1807, #1808 and #1854 were not elaborated, only their conflicts taken from `scratch/overlaps.md`.
- The adversarial rows check instances; they are not proofs.
- Whether #1768 or this pull request yields the open-pair relative theory is a decision for the two authors; this review records only that both heads now claim it.

## Source issues

- none
