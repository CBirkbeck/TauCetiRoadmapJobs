# Review of SmoothRepresentationsOfLocalGroups (pull request #3027 at 6f088b9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 306 changed lines since `b8f3652`. The new §SR.4.3a, §SR.5.2a and Layer SR.7, with the edited overview, scope and supplier contracts, were checked again at this head: every statement holds on the instances computed, every locator that could be read matches its source, no layer or item of `main` is removed, and every supplier citation resolves on `main`. Accepted with no findings, two small corrections (the description does not name what this roadmap gains; the Lean file's docstring does not say that the SR.7 theorems cannot be stated at the pins) and two format notes. For the human reviewers: one of their decisions was applied, and the licence of one author-copy link is open.

## C01 — The description does not say that this roadmap gains two sections and a new layer

In the part of the description I could read (it is cut off after the list of wrong statements on `main`), this roadmap appears once, where FiniteReductiveGroups is said to cite "SmoothRepresentationsOfLocalGroups (Layer SR.7, depth-zero representations)". A reader does not learn that this roadmap on `main` is revised by 283 added lines, nor what §§SR.4.3a and SR.5.2a are. Text that would be right, in the paragraph on published theorems sent to the general roadmaps: "SmoothRepresentationsOfLocalGroups gains §SR.4.3a (Macdonald's formula for GL_n over every nonarchimedean local field), §SR.5.2a (the Zelevinsky classification; Bernstein's irreducibility of products of unitarisable representations) and Layer SR.7 (the depth-zero Jacquet comparison, depth zero read on the cuspidal support, the depth-zero supercuspidal representations of GL_n). No section is removed or renumbered. It newly cites ReductiveGroups Layers 7c and 7e and further targets of ReductiveGroupsPartII, both suppliers it already had."

## C02 — The module docstring of `Suggested.lean` accounts for every layer except the new SR.7

The docstring says, layer by layer, which headline theorems are stated and which cannot be stated at the pins (SR.1, SR.2a, SR.4, SR.5, SR.6). The new layer adds three headline theorems (*depth-zero-jacquet*, *depth-zero-support*, *depth-zero-supercuspidals*) and the file neither states them nor says why not, so a reader cannot tell an omission from a decision. They are not statable: the pinned Mathlib and Tau Ceti have no Moy–Prasad filtration, parahoric subgroups, smooth compact induction or cuspidal representations (searched by object). One sentence would do, for example: "The depth-zero theorems (SR.7) require the Moy–Prasad filtration, the reductive quotients of parahoric subgroups and smooth compact induction." The Zelevinsky classification of SR.5.2a could be named with the SR.5 sentence, since it needs normalised parabolic induction and segments.

## N01 — The Checks of *depth-zero-jacquet* use B for two different groups

In the first Check (line 5036) B is the Borel subgroup (P = B). In the last (line 5043), `V^B ≅ (V_N)^{M₀}` keeps the notation of *borel-casselman-invariants*, where B is the Iwahori subgroup. Writing `V^{G_{x,0}}` there, or "B the Iwahori subgroup", would remove the clash.

## N02 — The Checks of *macdonald-formula-general* do not test the Hall–Littlewood parameter

Both Checks (lines 3083–3084, λ = (1, 0) and n = 1) give the same value for every t, so they cannot tell t = q⁻¹ from t = q or t = 0. One that could: for n = 2 and λ = (2, 0), `S(1_λ) = q(X₁² + X₂²) + (q − 1)X₁X₂`, which follows from `1_{(1,0)} * 1_{(1,0)} = 1_{(2,0)} + (q + 1)·1_{(1,1)}`; with t = q the coefficient would be `q − q²`.

## Questions for the author

- Does [Ber84] assume that F has characteristic zero? *unitary-product-irreducibility* (line 4542) is stated "for every nonarchimedean local field". [Tad86] quotes the theorem at 2.5 (i), p. 346, with no restriction, but A.12 (ii), p. 380, speaks of a conjecture of the same paper "in the zero characteristic case". I could not read [Ber84] (see Not verifiable), so I could not check whether 0.2 Corollary carries a restriction. If it does, positive characteristic needs another source.
- The converse in (v) of *zelevinsky-classification* (line 4525) is an owned input theorem for which no cited text gives a proof: [Zel80] 9.3 (Zel80 lines 1309–1310) says the proof is omitted. Is there a published proof the route could name? None of the texts cited here contains one.

## Previous findings

The previous review had no findings. Its small correction C01 (the description) is not repaired in the part of the description I could read and is C01 above. Its format notes N01 and N02 concern text this head leaves as it was, and are N01 and N02 above. The folder's only change since that head is one *Needs* line of SR.6 *finite-wild-representability*, which came from `main` and now cites ReductiveGroups §§9B and 9B.1; it is not part of this pull request's change.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| *macdonald-formula-general* (SR.4.3a) | n = 2, λ = (1,0), (2,0); n = 1 | (2,0): `S(1_{(1,0)})² − (q+1)X₁X₂ = q(X₁²+X₂²)+(q−1)X₁X₂`; formula `q·P_{(2,0)}(X;q⁻¹)` gives the same; (1,0): `q^{1/2}(X₁+X₂)` | holds | N02 |
| *macdonald-formula*, added sentence | E/F unramified quadratic | `q_E = q²`: `q_E^{⟨λ,ρ⟩}P_λ(X;q_E⁻¹) = q^{⟨λ,2ρ⟩}P_λ(X;q⁻²)`, the formula of `main` | holds | none |
| [HKP] 5.6.1 against the README's form | root α = e_i − e_j, i < j | `(1 − q⁻¹X_j/X_i)/(1 − X_j/X_i) = (X_i − tX_j)/(X_i − X_j)` at t = q⁻¹; `W_λ(t)` is `v_λ(t)` | matches | none |
| Zelevinsky (i), form Z(m) and order | m = [0,0]₁ + [1,1]₁ | decreasing x+y gives ν × 1; [1,1] not preceding [0,0], as Zel80 6.1 (a) asks; sub is `ν^{1/2}St` | consistent with *segment-representations* | none |
| Zelevinsky (i), subquotient clause | m₁ = [0,0], m₂ = [1,1]; characteristic | L(m₁+m₂) = `ν^{1/2}∘det` ⊂ 1 × ν; Tad86 A.1–A.7 stand before the characteristic-zero assumption (Tad86 line 1455) | holds for every F | none |
| Zelevinsky (ii) | [0,0]+[1,1]; [0,0]+[0,0] | linked: 1 × ν has length 2; unlinked: 1 × 1 irreducible | holds | none |
| Zelevinsky (iii) | Δ = [−1/2, 1/2]₁, GL₂ | trivial ⊂ `i_B(δ_B^{−1/2})`; `r_B(1) = δ_B^{−1/2} = ν^{−1/2} ⊗ ν^{1/2}`: increasing exponents | holds | none |
| Zelevinsky (iv) | degree 2 | `X_{[0]}X_{[1]} = [ν^{1/2}∘det] + [ν^{1/2}St]`, `X_{[0,1]} = [ν^{1/2}∘det]`: unitriangular change of basis | holds | none |
| Zelevinsky (v) | St and trivial of GL₂ | St = L([−1/2,1/2]): Jacquet exponent `ν^{1/2}⊗ν^{−1/2}` decaying; trivial: coefficient of modulus 1, not L² mod centre under any twist | holds | none |
| Zelevinsky (vi), "in particular" | linked Δ₁ = [a,b], Δ₂ = [c,d], a < c ≤ b+1 ≤ d | ρν^b ∈ Δ₁ and ρν^{b+1} ∈ Δ₂, so the excluded relation σ = σ′ν^{±1} occurs; contrapositive gives the clause | holds | none |
| *unitary-product-irreducibility* | χ₁ × χ₂ unitary; 1 × ν | reducible only if `χ₁χ₂⁻¹ = ν^{±1}`, not unitary; 1 × ν reducible, ν not unitary | holds; field generality is a question | none |
| *depth-zero-jacquet* | GL₁; GL₂ vertex, P = B: unramified, tame and wild principal series, St, trivial, depth-zero supercuspidal | dim π^J against dim `(π_N)^{T∩K¹}`: 2 = 2, 2 = 2, 0 = 0, 1 = 1, 1 = 1, `σ^{U(k_F)} = 0` = 0 | holds | none |
| *depth-zero-jacquet*, J a group with Iwahori decomposition | x in an alcove of GL₂, P = B and P = B̄ | `N ∩ G_{x,0}` normalises `G_{x,0+}`; both give J = pro-p Iwahori; with M attached to x, image of `N ∩ G_{x,0}` trivial, J = `G_{x,0+}` | holds | none |
| *depth-zero-jacquet*, role of `N ∩ G_{x,0}` | J replaced by `G_{x,0+}`, π depth-zero supercuspidal | `π^{K¹} ≅ σ ≠ 0` against π_N = 0 | the factor is needed, as the Check says | none |
| *depth-zero-support* | St of GL₂; χ∘det, χ of conductor 2; both directions of the sketch | `St^{K¹}` = St of GL₂(k_F) ≠ 0, support unramified; `det K¹ = 1+ϖO`, so `(χ∘det)^{K¹} = 0`, support `χν^{∓1/2}` of positive depth; `P ∩ nkG_{x,0+}k⁻¹n⁻¹ = P ∩ G_{nx,0+}` | holds | none |
| *depth-zero-supercuspidals* | n = 1; n = 2, q = 2; double cosets of F^×K and K¹ | n = 1: ω tame, π = ω; GL₂(𝔽₂) ≅ S₃: sign cuspidal, `sgn^U = 0`; `F^×K\F^×K/K¹` one coset, giving `σ^{K¹} = σ`; `F^× ∩ K = O^×`, so σ̂_ω well defined | holds | none |
| *depth-zero-supercuspidals*, depth zero iff `π^{K¹} ≠ 0` | facet F ⊂ closure of F′ | ReductiveGroupsPartII *pro-unipotent-radical-and-nested-facets* (3): `P_F^+ ⊂ P_{F′}^+`; all vertices of GL_n conjugate | holds | none |

- Source locators checked against the text: 32. [Zel80] 3.1, 3.4, 4.2, 6.1, 7.5, 8.5, 9.3, 9.7 (a) with their printed pages; [Tad86] 2.5, A.4, A.12; [Hen02] §§2.6, 2.8; [MP96] 4.2, 4.3, 5.2 (1), 6.3, 6.4, 6.6, 6.7, 6.8; [Dat09] 2.11, 3.1, 6.2 (i), 6.3 (ii), Théorème 5.8 (5.4 in the arXiv version, confirming the numbering note); [HKP] 5.3.1, 5.5.1, 5.6.1; [BH-eff] §§3.4, 3.5, 4.1. The seeded sample lies in text the change neither alters nor affects; the targets of it that the new sections name in *Needs* (*jacquet-invariants*, *jacquet-module*, *frobenius-reciprocity*, *cuspidal-representations*, *admissibility-of-irreducibles*) were read and supply what is used.
- Cross-roadmap citations resolved: ReductiveGroupsPartII *moy-prasad-filtration*, *moy-prasad-isomorphism*, *pro-unipotent-radical-and-nested-facets*, *iwahori-factorization*, *iwasawa-decomposition*, *parahoric-double-cosets*, *cartan-decomposition*, *gl-building-lattice-chains*, and ReductiveGroups Layers 7c and 7e, each on `main` and at this head; 35 internal short names resolve to sections before their use.
- Record kept: from the merge base to the head 0 headings removed, 0 layer ids changed, 7 headings added (new ids SR.4.3a, SR.5.2a, SR.7), 0 Lean declarations changed; no file outside the roadmap folders changes.
- Library: the pinned Mathlib and Tau Ceti have no Hall–Littlewood polynomials, multisegments, Zelevinsky classification, Moy–Prasad filtration or supercuspidal representations (searched by object; the hits for "depth zero" are unit filtrations of local fields).
- Decision: LocalFactorsOfTwistsAndTypes 2.1, 3.2, 4.1 and FiniteReductiveGroups 6.0–6.3 carry "Corollary of" lines naming SR.7.1, SR.7.2, SR.4.3a, SR.5.2a; each SR section states the cited theorem, (vi) and the subquotient clause of (i) in a wider form than the family's.
- Dependency check: `depcheck: 9 roadmaps, 106 edges, 0 problem(s)`; the automatic checks all passed.
- Elaboration: `Suggested.lean`, which the change does not touch, gives 12 `sorry` warnings and nothing else; the three declarations whose binders look dropped are definitions of untouched layers. No statement was added, so the one-tactic probe had nothing to test.

Overlap check: read LocalFactorsOfTwistsAndTypes and FiniteReductiveGroups (both cite the new SR sections as the general theorems: owner SmoothRepresentationsOfLocalGroups), SmoothRepresentationsOfLocalGroupsPartII (one worked example mentions depth-zero supercuspidals of PGL₂; nothing shared), LocallyAnalyticRepresentationsOfLocalGroups, ModpRepresentationsOfGL2OverLocalFields, ExoticMonoidalStructuresAndAbstractAutomorphicity (cites SR sections; nothing shared), ExceptionalThetaCorrespondencesForG2 and LocalLanglandsCorrespondenceForG2 (specific G₂ depth-zero supercuspidals only; nothing shared). No other open pull request changes this roadmap.

Source independence: 16 passages compared with 6 sources (Zel80, Tad86, Hen02, MP96, Dat09, HKP), changed passages only, none shared beyond formulas and standard names. Largest share of the README's locators: [Ber92], about 43. Contents compared for the added Layer SR.7 with [MP96], its most cited source: SR.7.1 joins 4.2–4.3, 6.3–6.7 and 5.2 (1) with [Dat09], SR.7.2 joins 6.6 and 6.8 with [BK93]; no one-to-one run, and the order is forced because *depth-zero-supercuspidals* needs *depth-zero-jacquet* and *depth-zero-support*. Independent. [Ber84], [Mac], [BK93] and [BH06] could not be read.

Research link: SR.7 states the depth-zero comparison of Jacquet modules with parahoric restriction of Moy and Prasad (1996) and Dat (2009); SR.5.2a states Zelevinsky's classification (1980) and Bernstein's unitary irreducibility (1984). By the README's Summary, its integral GL_n families serve local–global compatibility and modularity lifting. Rests on the README and on [MP96], [Dat09], [Zel80].

## Not verifiable

- [Ber84] 0.2 Corollary p. 51, 8.2 Corollary (a) p. 89, Theorem A, 5.1, 5.4: the sources service does not accept the linked copy as an author's own page; only the quotation in [Tad86] 2.5 (i), p. 346, was checked.
- [Mac] Chapter V: a book with no open copy; the formula was checked against [HKP] Theorem 5.6.1 and by computation.
- [BK93] (5.5.10), (6.1.2), §6.2, §8.4: a book with no open copy; checked only as [BH-eff] §§3.4–3.5 and 4.1 recall them.
- [BH06] §11, 11.4 Theorem pp. 80–81, 11.5 Lemma p. 82: a book with no open copy.
- The description of the pull request beyond the list of wrong statements on `main`: the copy I was given is cut off there.

## Source issues

- none

## For the human reviewers

- Decision applied (published theorems live in the general roadmaps): LocalFactorsOfTwistsAndTypes 2.1, 3.2, 4.1 and FiniteReductiveGroups 6.0–6.3 name SR.7.1, SR.7.2, SR.4.3a, SR.5.2a as the general theorems, and those sections state them.
- LocalFactorsOfTwistsAndTypes' ownership sentence (its README, line 1150) still lists 2.1, 3.2 and 4.1 as owned, while those sections are now corollaries of the SR sections; that folder's own review covers the sentence.
- Licence: the References link [Ber84] as an author copy under `~bernstei` on math.tau.ac.il. The sources service did not accept the URL as the author's page, and the text was not read.
