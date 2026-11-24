# Review of SmoothRepresentationsOfLocalGroups (pull request #3027 at f3b4ab1)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 306 changed lines since `74a09b7`. The new §SR.4.3a, §SR.5.2a and Layer SR.7 and the edited overview, scope and supplier contracts were checked: every statement holds on the instances computed, every locator that could be read matches its source, nothing of `main` is removed, and every supplier citation resolves on `main`. Accepted with no findings, one small correction (the description does not say that this roadmap gains two sections and a layer) and two format notes. For the human reviewers, one of their decisions was applied and the licence of one author-copy link is open.

## C01 — The description does not say that this roadmap gains two sections and a new layer

A reader of the description learns only that FiniteReductiveGroups "now cites … SmoothRepresentationsOfLocalGroups (Layer SR.7, depth-zero representations)". Nothing says that this roadmap on `main` is revised, gaining 283 lines. The text that would be right, in the paragraph on published theorems sent to the general roadmaps: "SmoothRepresentationsOfLocalGroups gains §SR.4.3a (Macdonald's formula for GL_n over every nonarchimedean local field), §SR.5.2a (the Zelevinsky classification; Bernstein's irreducibility of products of unitarisable representations) and Layer SR.7 (the depth-zero Jacquet comparison, depth zero read on the cuspidal support, the depth-zero supercuspidal representations of GL_n). No section is removed or renumbered. It newly cites ReductiveGroups Layers 7c and 7e and further sections of ReductiveGroupsPartII, both suppliers it already had."

## N01 — The Checks of SR.7.1 use B for two different groups

In the first Check (line 5036) B is the Borel subgroup (P = B). In the last Check (line 5043) `V^B ≅ (V_N)^{M₀}` uses the notation of *borel-casselman-invariants*, where B is the Iwahori subgroup. Writing `V^{G_{x,0}}` there, or "B the Iwahori subgroup", would remove the clash.

## N02 — The Checks of *macdonald-formula-general* do not test the Hall–Littlewood parameter

Both Checks (lines 3083–3084, λ = (1, 0) and n = 1) give the same value for every t, so they cannot tell t = q⁻¹ from t = q or t = 0. A suitable Check: for n = 2 and λ = (2, 0), `S(1_λ) = q(X₁² + X₂²) + (q − 1)X₁X₂`. This follows from `T₁² = T_{(2,0)} + (q + 1)T_{(1,1)}`, and the variant with t = q would give the coefficient `q − q²` instead.

## Questions for the author

- Does [Ber84] assume that F has characteristic zero? *unitary-product-irreducibility* (line 4542) is stated "for every nonarchimedean local field". [Tad86] A.12 (ii), p. 380, records that Bernstein stated his Conjecture 8.10 of that paper in characteristic zero. I could not read [Ber84] itself (see Not verifiable), so I could not check whether 8.2 Corollary carries the same restriction. If it does, positive characteristic needs another source.
- The converse in (v) of *zelevinsky-classification* (line 4525) is an owned input theorem with no source that proves it, because [Zel80] 9.3 omits Bernstein's proof. Is there a published proof the route could name? I found none in the texts cited here.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| *macdonald-formula-general* (SR.4.3a) | n = 2, λ = (1,0), (2,0); n = 1; λ = (1^r, 0^{n−r}) | (2,0): Hecke `T₁² − (q+1)R` gives `q(X₁²+X₂²)+(q−1)X₁X₂`; formula `q(X₁²+X₂²+(1−q⁻¹)X₁X₂)`, equal; (1^r): `⟨λ,ρ⟩ = r(n−r)/2`, `P = e_r` | holds | N02 |
| *macdonald-formula* (new sentence) | E/F unramified, `q_E = q²` | general formula `q_E^{⟨λ,ρ⟩}P_λ(X;q_E⁻¹) = q^{⟨λ,2ρ⟩}P_λ(X;q⁻²)`, the formula of `main` | holds | none |
| [HKP] Thm 5.6.1 vs README | stabiliser polynomial, root factor | `W_λ(t) = Σ_{W_λ} t^{ℓ(w)} = v_λ(t)`; `(1−q⁻¹π^{−α∨})/(1−π^{−α∨}) = (X_i − tX_j)/(X_i − X_j)` at t = q⁻¹ | matches | none |
| Zelevinsky (ii) | [0,0]+[1,1]; [0,0]+[0,0] | linked: 1×ν has sub `ν^{1/2}∘det`, quotient `ν^{1/2}St`, length 2; unlinked: 1×1 irreducible | holds | none |
| Zelevinsky (iii) | Δ = [−1/2, 1/2]₁ | `r_B(1) = δ_B^{−1/2} = ν^{−1/2} ⊗ ν^{1/2}`, increasing exponents as stated; Zel80 3.1 p. 180 | holds | none |
| Zelevinsky (iv) | degree 2 | `X_{[0]}X_{[1]} = [ν^{1/2}∘det] + [ν^{1/2}St]`, `X_{[0,1]} = [ν^{1/2}∘det]`: unitriangular | holds | none |
| Zelevinsky (v) | St, trivial of GL₂ | St = L([−1/2,1/2]) square-integrable; trivial: coefficient modulus 1 on SL₂(F)/±1, infinite volume, any twist | holds | none |
| Zelevinsky (vi) | shared vs adjacent supports | link [a,b]_ρ, [c,d]_ρ forces ρν^b ∈ supp π₁, ρν^{b+1} ∈ supp π₂, excluded; 1×1 irreducible, 1×ν reducible | holds (stronger than LocalFactorsOfTwistsAndTypes 4.1 (vi)) | none |
| Zelevinsky (i), subquotient | m₁ = [0,0], m₂ = [1,1] | L(m₁+m₂) = `ν^{1/2}∘det`, a subrepresentation of L(m₁)×L(m₂) = 1×ν; Tad86 A.4 p. 372 | holds | none |
| *unitary-product-irreducibility* | unitary characters; 1×ν; St×St | χ₁×χ₂ irreducible; ν not unitary, 1×ν reducible; St×St irreducible by (ii) | holds; field generality: question | none |
| *depth-zero-jacquet* | GL₁; GL₂ vertex, P = B: unramified PS, St, trivial | GL₁: identity; dim π^J vs dim (π_N)^{T∩K¹}: 2 = 2, 1 = 1, 1 = 1 | holds | none |
| *depth-zero-jacquet*, role of `N ∩ G_{x,0}` | J replaced by G_{x,0+}, π depth-zero supercuspidal | `π^{K¹} ≅ σ ≠ 0` vs `π_N = 0`: map not injective | the factor is needed, as the Check says | none |
| *depth-zero-support* | St of GL₂; χ∘det, χ of conductor 2 | St^{K¹} = St(k_F) ≠ 0, support ν^{∓1/2} depth zero; `det K¹ = 1+ϖO`, so `(χ∘det)^{K¹} = 0`, support χν^{∓1/2} positive depth | holds | none |
| *depth-zero-supercuspidals* | n = 1; n = 2, q = 2 (GL₂(𝔽₂) ≅ S₃); unramified twist | ω tame; sign is cuspidal of dim q−1 = 1, `π^{K¹} = sgn`, Iw₁-invariants `sgn^U = 0`; `π(σ,ω)⊗χ∘det = π(σ,ωχ²)` | holds | none |
| *depth-zero-supercuspidals*, K¹-invariants | t = diag(ϖ^{a_i}) non-scalar | image of `K ∩ tK¹t⁻¹` in GL_n(k_F) contains the lower unipotent radical of the parabolic of the jumps of a; `σ^{Ū} = 0` | only the trivial coset contributes | none |

- Source locators checked against the text: 31: [Zel80] 3.1, 3.4, 4.2, 6.1, 7.5, 8.5, 9.3, 9.7 (a); [Hen02] §§2.6, 2.8; [Tad86] A.4, 2.5, A.12; [MP96] 4.2, 4.3, 5.2 (1), 6.3, 6.4, 6.6, 6.7, 6.8 (any characteristic, p. 99); [Dat09] 2.11, 3.1, 5.8, 6.2 (i), 6.3 (ii) in both versions, confirming the numbering note; [HKP] 5.3.1, 5.5.1, 5.6.1; [BH-eff] §§3.4, 3.5, 4.1. The seeded sample lies entirely in untouched text.
- Cross-roadmap citations resolved: 8 ReductiveGroupsPartII targets (RG2.2.4, RG2.3.3, RG2.3.6, RG2.4.2, RG2.4.4), all at the merge base, and ReductiveGroups Layers 7c and 7e on `main`; 31 internal short names resolve to earlier sections.
- Record kept: merge base to head, 0 headings removed, 0 layer ids changed, 7 headings added, 0 Lean declarations changed.
- Library: pinned Mathlib and Tau Ceti have no Hall–Littlewood polynomials, multisegments, Zelevinsky classification, Moy–Prasad filtrations or depth-zero/supercuspidal representations (searched by object).
- Decision: LocalFactorsOfTwistsAndTypes §§2.1, 3.2, 4.1 and FiniteReductiveGroups §§6.0–6.3 cite SR.7.1, SR.7.2, SR.4.3a, SR.5.2a as "Corollary of"; each SR section states the cited theorem ((vi) in a stronger form).
- Dependency check: "depcheck: 132 roadmaps, 1465 edges, 0 problem(s)"; the worker's checks all passed.
- Elaboration: `Suggested.lean`, unchanged by the diff, gives 12 `sorry` warnings and nothing else; the three binders flagged as dropped belong to untouched definitions that do not use them.

Overlap check: read LocallyAnalyticRepresentationsOfLocalGroups, ExceptionalThetaCorrespondencesForG2 (its §1.8 builds specific G₂ depth-zero supercuspidals only), ExoticMonoidalStructuresAndAbstractAutomorphicity, ModpRepresentationsOfGL2OverLocalFields, FiniteReductiveGroups and LocalFactorsOfTwistsAndTypes (both cite the new SR sections: owner SmoothRepresentationsOfLocalGroups), SmoothRepresentationsOfLocalGroupsPartII (cites the SR.5.3 involution only); nothing else shared, and the other open pull request editing this README changes only the *Needs* line of SR.6 *finite-wild-representability*, with no conflict.

Source independence: 14 passages compared with 7 sources (Zel80, Hen02, Tad86, MP96, Dat09, HKP, BH-eff), changed passages only, none shared beyond formulas and standard names. Largest share of the README's locators: [Ber92], 42 of about 393. Contents compared for the added Layer SR.7 with [MP96] (its largest source, 6 of the new locators): SR.7.1 joins 6.7 and 5.2 (1), SR.7.2 joins 6.6 and 6.8; this is no one-to-one run, and the order is forced because *depth-zero-supercuspidals* needs *depth-zero-jacquet*. Independent.

Research link: SR.7 states Moy and Prasad's (1996) and Dat's (2009) depth-zero comparison of Jacquet modules with parahoric restriction, and SR.5.2a Zelevinsky's (1980) classification with Bernstein's (1984) unitary irreducibility. Per the README's Summary, its integral GL_n families serve local–global compatibility and modularity lifting (Emerton–Helm, Helm). Rests on the README and [MP96], [Dat09], [Zel80].

## Not verifiable

- [Ber84] 0.2 Corollary p. 51, 8.2 Corollary (a) p. 89, Theorem A, 5.1, 5.4: the sources service did not accept the Tel Aviv URL as the author's own page; only Tadić's quotation ([Tad86] 2.5 Theorem (i), p. 346) was checked.
- [Mac] Chapter V: a book with no open copy.
- [BK93] (5.5.10), (6.1.2), §6.2, §8.4: a book with no open copy; checked only as [BH-eff] §§3.4–3.5 and 4.1 cite them.
- [BH06] §11, 11.4 Theorem pp. 80–81, 11.5 Lemma p. 82: a book with no open copy.

Automatic checks set aside as false positives: the rule that a pull request changes nothing outside its roadmap folder, which keeps edits to other roadmaps out of a review that cannot see them, flagged the 118 files of the other roadmap folders when I reran the checks without the pull request's list of its own folders; every one of those folders belongs to this pull request and has a review of its own.

## Source issues

- none

## For the human reviewers

- Decision applied: published theorems leave the family for the general roadmaps. LocalFactorsOfTwistsAndTypes §§2.1, 3.2, 4.1 and FiniteReductiveGroups §§6.0–6.3 now cite SR.7.1, SR.7.2, SR.4.3a, SR.5.2a, and those sections state the cited theorems.
- Licence: the References link [Ber84] as an author copy on math.tau.ac.il under `~bernstei`. The sources service did not accept the URL as the author's page. The manifest records the same host as an author page for ber87. The text was not read.
