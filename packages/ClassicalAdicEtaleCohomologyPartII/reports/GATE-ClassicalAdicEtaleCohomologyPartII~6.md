# GATE-ClassicalAdicEtaleCohomologyPartII~6: reply to the review of head 24a6127

One review (CBirkbeck, 2026-10-26T13:40:25Z) with one finding. Its suggested fix makes four requests, numbered in the order they appear:
- H01: port AdicSpacesPartIIPartII to the roadmap repository, declare it a prerequisite and place it before this roadmap in the merge order;
- H02: recheck the section references against that port;
- H03: carry gap:finite-branched-covers and gap:proper-generic-smoothness into their designated supplier sections;
- H04: keep the arbitrary characteristic-zero field and the relatively proper scope.

The "Checks that were sound" section raises no defect. The repair is commit `e3fd1ca7`; only `TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/README.md` changed (lines 74, 78, 80 and 1178), and `Suggested.lean` is byte-identical to `24a6127`.

## H01 (CBirkbeck) — answered

The facts are right and the fix lies outside README.md and Suggested.lean: main (`dc87430a`) has no `TauCetiRoadmap/AdicSpacesPartIIPartII` folder, and the index of 362 open roadmap pull requests (2026-10-26T14:19Z) carries none. The roadmap exists as a job-board package (`packages/AdicSpacesPartIIPartII/README.md` at `2fad3dd`), accepted by its fourth package review (REV-PKG~4, "Verdict: accepted"), with a later red-team pass (RT~1b, "needs_changes") open against it. The merge-order file lists it at line 11, ahead of this roadmap at line 300, and the direction check reports no upward edge or cycle.

The README cites it by roadmap name and section, as the house rules require. Opening its roadmap pull request and naming it as a prerequisite of this one are submission steps, not README edits. This roadmap should not merge before that port exists.

## H02 (CBirkbeck) — answered

Every cited section was rechecked against `packages/AdicSpacesPartIIPartII/README.md` at `2fad3dd`; all match and no reference changed (supplier line numbers in parentheses):
- §§0.1–0.3: Zariski closed subsets, local dimension, nowhere-density criteria (147, 177, 207); §0.4: proper images are Zariski closed (223).
- §1.1 normalization (272), §1.4 irreducible components (346), §1.7 Riemann extension for normal spaces (410).
- §2.1 singular locus (453); §2.2 smooth equals regular over a perfect field (480).
- §§4.2–4.7: Shilov points, weakly Shilov points, Abhyankar bound, residue-transcendence criterion, avoidance of nowhere dense Zariski closed sets (674–780).
- §5.3 functorial resolution in characteristic 0 (863); §5.4 proper surjective resolution, isomorphism over the smooth locus, and the resolution of T_red for arbitrary T (878).

The supplier's Layer 4 ends at §4.7 and its Layer 5 at §5.4, so the destinations "following §4.7" and "following §5.4" are free. The references sit at README lines 11, 72, 80, 82, 1156, 1172, 1188, 1208, 1226 and 1267.

## H03 (CBirkbeck) — applied differently

Carrying the contracts into the supplier is the supplier's own edit; but the contract text to be carried was false as worded, and it is repaired here. Line 74 said "restriction identifies finite normal branched covers étale off that subset with finite étale covers of its complement" without defining the covers; it now defines a finite normal branched cover of X étale off Z as a finite surjective π:Y→X with Y normal, π étale over X∖Z and π⁻¹(Z) nowhere dense in Y (Han Definition 1.5, Han line 130), and the target as surjective finite étale maps to X∖Z.

Witnesses, now at line 78: over the closed unit disc D with Z={0}, both id_D and D ⊔ Spa K→D (point ↦ 0) are finite, surjective, normal and étale off Z with the same restriction, while D→D ⊔ Spa K is not an isomorphism; the nowhere-density condition excludes the second. For nonempty X the empty map to X∖Z is finite étale, but its only extension with π⁻¹(Z)=Y nowhere dense is Y=∅, which is not surjective; hence the surjective target.

Line 80 now says that π⁻¹(Z) is nowhere dense by definition, which is what Riemann extension needs (Han Theorem 2.6 and Proposition 2.9, Han line 409 and Han line 435). It attributes nowhere density of the preimage of any larger nowhere dense Zariski closed Z′ to the components of §1.4 (Han Proposition 2.8, Han line 417). Line 1178 (§7.3) uses the defined term.

gap:proper-generic-smoothness was rechecked and is unchanged. When the supplier takes these contracts in, it must also narrow its Scope sentence (`packages/AdicSpacesPartIIPartII/README.md` line 21), which excludes "embedded rigid resolution" and "generic flatness or generic smoothness for arbitrary maps". The branched-cover route uses the algebraic embedded principalization of ResolutionOfSingularitiesCharacteristicZero §7.7 analytified on affinoid charts, not a global embedded rigid resolution. The smoothness contract concerns proper maps with smooth source and reduced target, not arbitrary maps.

## H04 (CBirkbeck) — answered

Both scopes are kept, and the supplier supports them as written. Its Conventions (supplier line 25) fix K complete for a nontrivial rank-one absolute value with no residue-characteristic restriction. Its §5.3 resolves every rigid space with nowhere dense nonreduced locus over characteristic-0 K by a proper π, with no properness over K; its §5.4 gives a proper surjection from the resolution of T_red for arbitrary T.

On this side, Conventions (line 17), §7.4 (line 1192) and §7.6 (line 1230) allow every complete characteristic-zero nonarchimedean K, residue characteristic zero included, and maps proper only over the base. Instance: K=ℂ((t)) with the t-adic absolute value is admitted on both sides; all its finite exponents use the prime-to-residue branch of ClassicalAdicEtaleCohomology §8.4 (line 110). For X=ℙ¹×D→D (proper over D, not over K), §5.3 resolves hypercover terms by proper π, so they stay proper over D.

## Build

`lake build TauCetiRoadmap.ClassicalAdicEtaleCohomologyPartII.Suggested`: `Build completed successfully (8976 jobs).` Only diagnostic: `warning: TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/Suggested.lean:70:8: declaration uses 'sorry'` (the headline `monomial_root_duality`).

Gate after commit `e3fd1ca7`:

    gate ClassicalAdicEtaleCohomologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK

Direction check (`gate --depcheck … --movable`):

    depcheck: 55 roadmaps, 638 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

## Signatures, citations, ownership, sources

- **Signatures.** `Suggested.lean` is unchanged from `24a6127`, so the elaborated `#check @name` types of its five declarations are those in the job's signature listing, which was elaborated from this file. Compared with README §3.7 (line 738 and its Checks): `monomialRootModule` and `monomial_root_duality` carry `[Fact (Nat.Prime p)]` in their own signatures; `monomialRootAlgebra`, `monomialRootAlgebraCharP` and `monomialClass` need no hypothesis; no section binder is dropped. Nothing changed.
- **Citation leads.** "AdicSpacesPartIIPartII Layer 5 found nowhere" is H01 (board package only; sections confirmed under H02). "`henselianComparison_bijective_of_spec` occurs nowhere" is a false positive: it is the Lean name of a ClassicalAdicEtaleCohomology §2.5 roadmap target, not a pinned-library declaration.
- **Ownership.** The repair adds no construction; the defined notion stays with AdicSpacesPartIIPartII, earlier in the merge order. `roadmaps grep` for "branched cover", "generic smoothness" and "Lütkebohmert" over main and the open heads finds only topological branched covers (BelyiMaps, SurfaceTopology) and Bosch–Lütkebohmert–Raynaud citations for Néron models; no other owner of rigid branched-cover extension or generic smoothness of rigid maps.
- **Sources.** No new source fetched. Read from the cache: Han lines 130–145 (Definition 1.5, Theorem 1.6, p.4) and 405–443 (Theorem 2.6, Proposition 2.8, p.10; Proposition 2.9, p.11). `needs-references.toml`: none.
- **Untrusted text.** The review contains no instruction to run commands, contact services or change the working method; nothing suspicious.

## Adversarial pass (statements added, changed or carried)

| Statement | Instance | Computed values | Result | Change |
|---|---|---|---|---|
| gap:finite-branched-covers, old wording | D, Z={0}, Y=D ⊔ Spa K (point ↦ 0) | finite, surjective, Y normal, étale over D∖{0}; restriction = id(D∖{0}) = restriction of id_D; D→Y restricts to an isomorphism but is not one (fibres over 0 have 1 vs 2 points) | false: not an equivalence | definition with π⁻¹(Z) nowhere dense (line 74); witness at line 78 |
| same, new wording | same Y | π⁻¹(Z)={0} ⊔ {pt}; {pt} is a nonempty open of Y | Y excluded | — |
| same, target | X=D, Z={0}, Y′=∅→D∖{0} | Y′ finite étale, not surjective; an extension has π(Y)⊂Z, so π⁻¹(Z)=Y nowhere dense in Y forces Y=∅, not surjective onto D | old target "finite étale covers" not hit if read without surjectivity | target = surjective finite étale maps (line 74); witness at line 78 |
| same, target | Y′→X∖Z surjective finite étale | extension Y finite, π(Y) closed and ⊇ X∖Z dense, so π(Y)=X | surjective target is the right one | — |
| same, new wording | Z=∅, X normal | covers = surjective finite étale maps (Y étale over normal X is normal); restriction = identity functor | holds | — |
| same, new wording | X=D, Z={0}, π:S↦S², char K=0 | dπ=2S≠0 off 0, so étale over D∖{0}; π⁻¹(0)={0} nowhere dense; restriction = degree-2 Kummer cover | positive example | — |
| same, new wording | Y=Spa K⟨S²,S³⟩→D, T↦S² | finite (generated by 1, S³), surjective, étale off 0, same restriction as Kummer; Y is the cusp, not normal | excluded by normality, as needed | — |
| same, naturality | open U⊂X | π⁻¹(Z∩U)=π⁻¹(Z)∩π⁻¹(U) nowhere dense in π⁻¹(U); restriction is a cover of U étale off Z∩U | restriction to opens preserves the class | — |
| same, X=∅ | X=∅ | Z=∅, only Y=∅; target only ∅ | holds | — |
| same, characteristic | char K=p>0 | Han Theorem 1.6 gives only full faithfulness (Han line 144) | characteristic-zero hypothesis kept | — |
| line 80, Prop 2.8 claim | Kummer cover, Z′={0, a}, a≠0 | π⁻¹(Z′)={0}∪{±√a} (over a finite extension when √a∉K), finite, nowhere dense in D | holds | — |
| gap:proper-generic-smoothness (carried) | ∅→Y | f smooth over Y, S_f=Y | dense Zariski open | — |
| same | {a}↪D | not flat at a, empty fibre elsewhere; S_f=D∖{a} (Check line 1204) | holds | — |
| same | Spa K→Spa K[ε]/(ε²) | closed immersion, not flat; S_f=∅ in a one-point space | not dense: "Y reduced" needed | — |
| same | (projective cuspidal cubic)^an × D→D | every fibre singular, S_f=∅; X not smooth | "X smooth" needed | — |
| same | T↦T^p on D, char p | finite flat; fibres K[T]/(T^p−a) not geometrically reduced; S_f=∅ | characteristic 0 needed | — |
| supplier map (line 72) | §5.4 at T=Spa K[ε]/(ε²) | resolution of T_red is Spa K→T, proper, surjective on one point; supplier's Check gives the same | matches | — |
| scope (H04) | K=ℂ((t)) t-adic, n arbitrary | complete, rank-one, char 0, so supplier §5.3 applies; n invertible in O⁺, so ClassicalAdicEtaleCohomology §8.4 applies | admitted on both sides | — |
| Lean `monomial_root_duality` (unchanged) | n=0, m=1, e₀=p | A=𝔽_p (t₀=0); τ(class(t₀ᵖ))=τ(0)=0; right side class(t₀¹)=0. At e₀=0, τ(1)=1=class(1) | consistent with Check line 753 | — |
| same | p=2, n=1, m=1, e=(2,0) | τ(t₀²)=class(t₀), i.e. u=x² in the line 755 notation | consistent with Check line 755 | — |
