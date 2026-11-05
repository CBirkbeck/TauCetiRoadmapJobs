# GATE-AdicCoefficientsAndComparisonsPartII~1: answers to the review of 4dd1d9c

The review comments on head 4dd1d9c. The branch already carried one repair commit (236f4bb) answering all three findings; this round verified those repairs against the sources and suppliers, found two defects in the text they added, and replaced the newly planned Zariski lemma by an import from its owner. Head after this round: d6d93fd (three commits on top of 236f4bb, README only; `Suggested.lean` unchanged).

## H01 (CBirkbeck) — applied differently

`gap:very-tame-local-quotient` (README line 124) no longer bundles four asks: it is one contract, functoriality of the equivariant log resolution f(G, X, Z) of LefschetzPencilsAndVanishingCycles §0.10 with respect to λ-equivariant strict inert morphisms (ilo14 VIII Theorem 5.6.1(ii), ilo14 line 5868; inert morphisms ilo14 line 5593; used through ilo14 X Theorem 3.1.5(i), line 7194), in the three instances §PA.4.4 consumes (G-stable opens, local schemes, strict localizations; README line 1075). The former parts (a)–(c) were not split into three further slugs but dropped: no target of this roadmap uses the abelian-inertia or strict-local form of the very tame quotient or the openness of the very tame locus (README line 130 now says so, and a search of the README for those notions finds no other consumer), so a contract on them would be an ask with no consumer. The supplier at the head of its pull request states the equivariant log resolution (its lines 783–790) and no functoriality for inert morphisms, so the one remaining gap is real. There is no `design/plan.json` in the pull-request folder (README, Suggested.lean, metadata.toml only), so nothing else carries the old slug.

## H02 (CBirkbeck) — applied

`gap:closed-subset-log-structure` (README line 108) asks only that O_X ∩ j_*O_U^× is a log structure on the étale site for reduced locally noetherian X and nowhere dense closed Z; the former clause (b) is now a remark that for regular X and Z = |D| it is literally the M_D of CrystallineCohomology CR.5:log-algebra.4, which at the head of that pull request defines M_D = O_X ∩ j_*O_U^× (its lines 8060–8063). The §PA.4.1 route (README line 992) says the same and asks the supplier for nothing in that case.

## H03 (CBirkbeck) — applied differently

The repair commit 236f4bb had added the definiteness statement as an own target of §PA.6.11a with a proof. The ownership search by object (all open roadmap heads and main, pattern "Zariski's lemma / negative definite on") found an owner: AlgebraicModuliForArithmeticGeometryPartII §4.6 (merge order line 251, earlier than this roadmap at 366) states, for a regular surface S with f : S → Z proper flat onto a regular one-dimensional scheme with O_Z = f_*O_S, exactly items (i)–(iv) including negative definiteness on every proper subset of the components, citing stacks Semistable Reduction Lemma 9.7, Tag 0C66 (line 2982). Since a roadmap never re-plans what another plans, the lemma is now imported: supplier contract at README line 147, scope bullet at line 17, `*Needs:*` at line 1709 and the Layer 6 dependencies name §4.6. What §PA.6.11a owns is only the reduction (README line 1668): the route's regular model X̄ has H⁰(X̄, O) = R′, the integral closure of R in the purely inseparable extension K′ = H⁰(X̄_K, O), so X̄ → Spec R′ is its Stein factorization (SchemeAndStackFoundations §4.9) and satisfies §4.6's hypothesis O_Z = f_*O_S; over the unique point b′ above b with residue degree d and ramification index e, X̄_b = e X̄_{b′} and the §5.9 pairing over b is d times the pairing over b′ (local formula, [κ(P) : κ(b)] = d [κ(P) : κ(b′)]), so definiteness transfers. Four Checks (README lines 1672–1675) pin the reduction: the split unramified P¹ over R′ where the reduction's hypothesis fails and the form vanishes on one component; e = 1, d = p (matrix p·[[−1, 1], [1, −1]] over b against [[−1, 1], [1, −1]] over b′); e = p, d = 1 (multiplicity p over b, 1 over b′, (C · C) = 0 both ways); and d = e = 1 on the blow-up of P¹_R. The reviewer's suggested own target with its own proof would have duplicated §4.6; the restated proof at 236f4bb also carried an unweighted identity `2 aᵗAa = −Σ a_ij (a_j − a_i)²` after rescaling only the coordinates, which gives −4 instead of 2(E · E) = −2 on the vector (0, 1, 0) of the fibre C_1 + 2E + C_2 (stacks Semistable Reduction line 121 rescales the matrix entries by m_i m_j). The route sentence (README line 1664) now cites §4.6 through the reduction; moretbailly89 §§3.5–3.6 (lines 365, 377) stays as the locator of the step in Moret-Bailly's proof.

## H04 (CBirkbeck) — applied

The sentence naming MotivesAndAlgebraicCycles §0.5c as a consumer was deleted at 236f4bb; "Downstream consumers" (README line 1755) now names LogicAndDefinabilityInNumberTheoryPartII §2.1 (merge order line 369; its design §2.1 names the odd-degree alteration supplier for the Dittmann–Pop argument) and EtaleDualityAndPerverseSheavesPartII (merge order line 367; its README line 88 cites §§PA.0.2–PA.0.8, PA.0.11, PA.1.2–PA.1.4, PA.4.1–PA.4.8, PA.5.1–PA.5.4), both later than this roadmap (line 366).

## Build, gate, dependency check

Build: `lake build TauCetiRoadmap.AdicCoefficientsAndComparisonsPartII.Suggested` completed successfully (8954 jobs), warnings only for the two `sorry` declarations at `TauCetiRoadmap/AdicCoefficientsAndComparisonsPartII/Suggested.lean` lines 127 and 137; no errors. `Suggested.lean` is unchanged from 4dd1d9c.

Gate at d6d93fd:

    gate AdicCoefficientsAndComparisonsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check (`--movable`, after adding the AlgebraicModuliForArithmeticGeometryPartII §4.6 edge):

    depcheck: 237 roadmaps, 2105 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

## Signatures

`Suggested.lean` was not changed. The six elaborated types in the worker's signature listing (four definitions, two theorems) were compared with the README statements of §PA.5.2b (lines 1317–1355): both theorems carry `[NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]`, the subfield k with `[IsAlgClosed k] [CompleteSpace k]`, the nontrivial-norm witness and the finiteness over `completedRationalSubfield`, as the README states; no binder is missing and nothing changed.

## Ownership

The Zariski lemma now cites its owner (H03). The Stein-factorization reduction, the two supplier gaps of H01–H02 and the consumer list were searched by object in the open heads and on main through `roadmaps grep`; no other roadmap owns the reduction of a model with purely inseparable constant field to the contraction hypothesis of §4.6, so this roadmap keeps it. Ownership was checked against the 460 open pull requests indexed by the tool, not only the sibling checkouts listed in the brief.

## Adversarial pass on the statements changed this round

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Reduction: form over b = d · form over b′ | R = F_p(s)[[t]], R′ = F_p(s^{1/p})[[t]], blow-up of P¹_{R′} at a κ(b′)-point | e = 1, d = p; over b′: [[−1, 1], [1, −1]]; over b: node term [F_p(s^{1/p}) : F_p(s)] · 1 = p, (C · C)_b = −p from (C + E) · C = 0; matrix p·[[−1, 1], [1, −1]] | holds; both restrictions to {C} negative | Check added (line 1673) |
| Reduction: X̄_b = e X̄_{b′}, definiteness unaffected | R = F_p[[t]], R′ = F_p[[t^{1/p}]], X̄ = P¹_{R′} | e = p, d = 1; div(t) = p · div(t^{1/p}); one component, multiplicity p over b and 1 over b′; (C · C) = 0 both; proper subsets: only ∅ | holds vacuously; kernel vector differs by e, as stated | Check added (line 1674) |
| Reduction needs K′/K purely inseparable | P¹_{R′}, R′ ⊂ split unramified quadratic | B′ has 2 points over b; fibre = 2 disjoint P¹; (C_1 · C_1) = 0 ≠ negative | hypothesis necessary; excluded by geometric irreducibility of X̄_K | Check added (line 1672) |
| d = e = 1 witness | blow-up of P¹_R at a κ(b)-point, locally uv = π | [[−1, 1], [1, −1]]; (1, 1) in kernel; −1 on {C} | holds, agrees with §4.6 | Check added (line 1675); the Weil-divisor Check at line 1682 now names this proper model instead of the affine chart, whose components are not proper |
| Quadratic-form identity in the interim proof (236f4bb) | A = [[−2, 1, 0], [1, −1, 1], [0, 1, −2]], m = (1, 2, 1), a = (0, 1, 0) | aᵗAa = −1; weighted sum with b_ij = a_ij m_i m_j and y = (0, ½, 0): −(2·2·¼ + 2·2·¼) = −2 = 2 aᵗAa; unweighted sum: −4 | interim identity false; corrected, then the whole lemma replaced by the §4.6 import | lemma removed |
| §4.6 hypotheses vs the route | Dedekind base of dimension 0 (a field) | §4.6 needs a regular one-dimensional Z; Moret-Bailly's R is a Dedekind ring whose residue fields are algebraic over finite fields, so dim B = 1 unless R is itself such a field, in which case X is proper over a field and the conclusion is trivial | no gap | base kept as in the route |
| H01 contract: functoriality for strict inert morphisms covers the three instances | G-stable open U with λ = id; Spec O_{X,x} with G_x → G; strict localization | each is a λ-equivariant strict inert morphism: boundary pulled back (strict); inertia at y maps isomorphically onto inertia at its image (inert, since the inertia of G_x at x is G_x itself) | holds; ilo14 lines 5876–5878 give functoriality of all four pieces of f(G, X, Z) for strict inert morphisms | none |
| H02 contract: O_X ∩ j_*O_U^× is a log structure | cusp k[x², x³] with Z the origin; regular X with snc D | cusp: not fine (the §PA.4.1 Check), still a log structure; snc case: equals M_D by the supplier's definition | holds; the contract is the general case only | none |

## Source issues

None new. All locators cited in the changed text were opened at their lines: ilo14 5593, 5863–5878, 7190–7196; moretbailly89 365–378; stacks Semistable Reduction 115–134 (Lemma 2.3, Tag 0C5X) and 2982–2995 (Lemma 9.7, Tag 0C66).
