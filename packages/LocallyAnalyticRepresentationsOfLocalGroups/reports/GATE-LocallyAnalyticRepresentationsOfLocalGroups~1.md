# GATE-LocallyAnalyticRepresentationsOfLocalGroups~1: answers to the human review of `d39c938`

One comment (CBirkbeck, 2026-11-13T17:19:28Z) carrying three findings, F01–F03, numbered H01–H03
below. The comment was written against the board package, whose README differs from the pull
request head in 776 diff lines; every finding was re-checked against `d39c938`. Repairs are in
commit `c71cc7d` on top of `d39c938` (README only, 2 lines changed).

## H01 (CBirkbeck) — applied

The import was already at `d39c938` (scope line 13, supplier contracts lines 29 and 112, §4.1 (ii) line 807 "L(λ) is the finite-dimensional module L_k(λ) of ReductiveGroups §9A, item 5", §4.1 *Needs* line 811), and the quoted phrase "each absolutely irreducible and defined over k" no longer occurs. The one missing piece was Layer 4's Dependencies. Line 908 was "ReductiveGroups Layers 1, 4, 7 and 8; …; `TauCeti.VermaModule`, `TauCeti.irreducibleQuotient`". It is now "ReductiveGroups Layers 1, 4, 7 and 8 and §9A, item 5 (*The split-field producer used here*); …", and it adds the five Tau Ceti declarations that §4.1's *Needs* already names. Line 112 said "extends them to arbitrary rational highest weights of split reductive algebras over E" and now says "… over any field k of characteristic zero", which matches Layer 4's own field k.

Evidence: ReductiveGroups on main, README line 4373 (item 5, "The split-field producer used here"), constructs L_K(λ) for a split Killing-semisimple algebra over any characteristic-zero K and dominant λ, with the base change `K̄ ⊗_K L_K(λ) ≃ L_K̄(λ)`, extended componentwise and by a central character. That matches the supplier contract at line 112 of this README. §4.1 builds no second dominant module: its new work is (i) for arbitrary k-rational μ, plus (iii) and (iv).

## H02 (CBirkbeck) — applied

The requested repair is already present at `d39c938`, added with the port, so no edit was needed in this round. §9.3 (line 1511) defines `Hom_(P,g′)(T(L), E)` through the block determinants `det_(L_P) : T(L) → Z_(L_P)(L) ≅ (L^×)^r` (Ding (2.21), p. 21 = DING25 lines 859–860). It identifies the space with `∏_i Hom_(g′)` of the blocks, gives the dimension n + r·d_L (DING25 line 861), and defines `Ext¹_(F_P,g′)` as ζ_(F_P) of the blocks' `Ext¹_(g′)` (DING25 line 1888, p. 47). §9.1 (line 1482) identifies T_(w,i) as the induced B ∩ L_(P,i)-filtration of gr^i F_P (DING25 line 1869). §9.6 (3) cites (3.30) (DING25 lines 1889–1905, p. 47), and the Checks at lines 1527–1528 are the three that F02 asks for: P = B gives dimension n(1 + d_L); P = G gives n + d_L; blocks (2, 1) give dimension 5 against 4 and 6, with log_p(t_3) inside the space and log_p(t_1) outside it. The rest of the README has no other undefined domain of this kind: `Hom_(σ,g′)` in Layer 10 is defined in §8.1 (v), line 1238, as `Hom_g′ ∩ Hom_σ`.

## H03 (CBirkbeck) — answered

The finding is correct for the board package's manifest, `packages/LocallyAnalyticRepresentationsOfLocalGroups/sources.toml` line 443, where `authors = "Bernstein"`; BZ77 lines 6–7 and 25 name I. N. Bernstein and A. V. Zelevinsky. The pull request ships no `sources.toml` (its folder holds README.md, Suggested.lean and metadata.toml, and no roadmap on main carries one), and the README's reference at line 1761 already names both authors. So nothing in `d39c938` needs to change. The one-field correction to `"I. N. Bernstein, A. V. Zelevinsky"` belongs to the board manifest, which this job may not edit. The same entry's `title` also carries TeX markup (`${\\germ p}$`); the worker may want to normalise it in the same edit.

## Other notes

- The comment says it raises three questions for human reviewers "in the section of that name at the end", but the comment text has no such section. There was nothing further to answer.
- No suspicious instructions were found in the comment.

## Adversarial pass (statements changed or re-verified)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Layer 4 Dependencies (line 908) agrees with the *Needs* of §§4.1–4.6 | every *Needs* line of Layers 0–10 against its layer's Dependencies, compared mechanically | Layer 4 before: §9A item 5 and 5 of the 7 Tau Ceti declarations in §4.1 *Needs* were missing; Layers 0–3 and 5–10 had 0 missing | defect in Layer 4 only | added §9A item 5 and the 5 declarations |
| Line 112: 4.1 extends the theory "over any field k of characteristic zero" | k = ℚ_3, 𝐆 = GL_2, λ = (2, 0); k = ℚ_p, 𝐆 = 𝔾_m; non-split Cartan {(a, b; εb, a)} with ε a non-square in ℚ_p | GL_2: L(λ) = Sym², dim 3, weights (2,0), (1,1), (0,2), and scalar zI acts by λ(zI) = 2z on both sides; the base change to ℚ̄_3 still has dim 3. 𝔾_m: M(μ) = L(μ) = k_μ, dim 1. Non-split: ad eigenvalues ±2√ε ∉ ℚ_p, so there are no rational root spaces and the statement does not apply (Check at line 817) | holds; the earlier "over E" was narrower than Layer 4's k | "over E" → "over any field k of characteristic zero" |
| §4.1 (ii): L(λ) = L_k(λ) of ReductiveGroups §9A item 5 for dominant λ ∈ X | GL_2 over ℚ_3, λ = (2, 0) and λ = (1, 1); torus | (2,0): both constructions give dim 3 with the weights above; (1,1): det, dim 1; torus: one-dimensional character of weight μ | holds; one module, not two | none |
| §9.3: dim Hom_(P,g′)(T(L), E) = n + r·d_L | P = B; P = G; (2,1) with L = ℚ_p; (2,1) with d_L = 2; n = 0 | n(1+d_L) = n + n·d_L ✓; n + d_L ✓; 3 + 2 = 5 (Hom_g′ = 4, Hom = 6) ✓; 3 + 2·2 = 7 (Hom_g′ = 5, Hom = 9) ✓; r = 0 gives 0 ✓ | holds | none |
| §9.3 membership: log_p(t_3) is in Hom_(P,g′) and log_p(t_1) is not ((2,1), L = ℚ_p) | ψ − c·log_p(t_1t_2) − d·log_p(t_3) smooth | log_p(t_3): c = 0, d = 1 works ✓; log_p(t_1): the coefficients 1 − c, −c, −d must all vanish, which is impossible ✓ | holds | none |
| §9.6 (3): w_2w_1⁻¹ ∈ W_P preserves Hom_(P,g′) | (2,1), W_P = ⟨s_1⟩ against s_2 ∉ W_P, with (u·ψ)_i = ψ_(u⁻¹(i)) | s_1 fixes a·log(t_1t_2) + b·log(t_3) ✓; s_2·log_p(t_3) = log_p(t_2), which is not in the space (coefficients −c = 0 and 1 − c = 0) | restricting to W_P is necessary and is stated | none |

## Ownership and citations

The repairs add no new object. They add a citation of ReductiveGroups §9A item 5 (on main, README line 4373), which is the existing owner of the dominant split-field modules, and of Tau Ceti declarations checked at the pin:

- `TauCeti/Algebra/Lie/HighestWeight/Existence.lean:234`
- `TauCeti/Algebra/Lie/HighestWeight/CompleteReducibility.lean:259`
- `TauCeti/Algebra/Lie/Reductive/CompleteReducibility.lean:107`
- `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/Isomorphism.lean:106` (`IsAlgClosed` in its variables)
- `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/Isomorphism.lean:159` (`IsAlgClosed` in its variables)

No new statement was added, so there was nothing new to check for ownership against the open pull requests.

## Suggested.lean

Unchanged. It declares nothing (its docstring says why for each headline), so there was nothing to put in the `#check @name` comparison.

## Build and gate

- `lake build TauCetiRoadmap.LocallyAnalyticRepresentationsOfLocalGroups.Suggested`: `Build completed successfully (18239 jobs).`
- Gate after the commit: `gate LocallyAnalyticRepresentationsOfLocalGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check: `depcheck: 239 roadmaps, 2174 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
