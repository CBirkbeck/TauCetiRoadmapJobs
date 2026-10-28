# Design repair report

This round edits only `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/design/README.md`, `design/plan.json` and `sources.toml`. Every README target block is still generated verbatim from its `plan.json` entry; I re-checked all 21 blocks, the six layer Dependency lists, all 13 gap paragraphs and all 14 supplier paragraphs after editing. The review had five findings, and each one was checked against the sources before any edit.

## F01 (P1) — applied

Old: the §6.5 statement said "Equivalently these points have … ψ|U_E^{m+1}=θ|U_E^{m+1} … n>2m", and the §6.4 API said V(α,θ) occurrence detects membership. New: §6.4 defines a deep subset Σsc_{k,E,m}⊆Σsc_{k,E} with n>2m, and the equivalence is stated only for it. §6.5 proves it dense and gets the full set, and §5.4, by inclusion. Shallow-point Checks added.

## F02 (P2) — applied

Old: a LocallyAnalyticRepresentationsOfLocalGroups Layer LR.0 supplier, with gap:continuous-finite-index-induction. New: the supplier contract is ArithmeticGaloisRepresentations §1.3, cited in §3.2 Needs, the §3.2 proof sketch (coset formula m↦(x↦φ(xm)) on M∞), the Layer 3 Dependencies and the Scope section. The gap is deleted from both files. A nonsmooth Check was added: K=ℤ_5^×, H=1+5ℤ_5, χ(u)=u, dimension 4 on both sides.

## F03 (P3) — applied

Old: the Check said "M∞ is finite over R∞[[H]]; its testing quotient's reducedness is the arithmetic assertion imported from the parent." New, in both files: the model H=1, B=O[[x]], M=B/(x²), Θ=O. Here M is free of rank 2 over O, finite over B, and its own test. Ann_B(M)=(x²), and x²=0 but x≠0, so finiteness does not give reducedness.

## F04 (P3) — applied

Old: "this supplier must be packaged before this roadmap can be packaged or ported" (README and plan supplier entry) and "in particular the continuous-induction supplier must be packaged first". New: the first leaves with the supplier (F02); the second becomes "Each gap named in a *Needs:* line is a theorem stated by its supplier, not supplied by a citation alone."

## F05 (P2) — applied differently

Old: §§5.2 and 6.1 were stated only for p∤2d. New: both hold at every prime by the local route (BIPD), with the patched argument kept as a second route. New gaps: lift → ModularityAndLanglandsExtensions §2.1; closure and local benign points → parent §5.2a, owner of the trianguline variety and benign predicate (not LocalGaloisDeformationRings); Berthelot points and components → AdicSpacesPartIII §R2.9.

## Evidence for each verdict

- **F01.** EP Proposition 3.19 (EP lines 824–831) is an equivalence for one fixed V(α,θ). EP Theorem 5.1's proof (EP lines 1136–1138, 1161–1164) only places detected points inside the target set. For n>2m, ψ_α is nontrivial on U^n(𝔄) (EP lines 799–801), and EP requires m>0 (EP line 789). The reviewer's witness, recomputed: F=E=ℚ_3(ζ_3), with a character trivial on U_F^2 and nontrivial on U_F^1. Its restriction to U_F^1 is ψ_α with v(α)=−1, so n=1. U_F^2 is torsion free and ζ_3∈U_F^1∖U_F^2, so the least m is 1 and every deep n is at least 3; on U_F^n the character is trivial while ψ_α is not. The point is in the full set but in no deep set, and 3∤2. The inclusion deep ⊆ full holds: by the proof of Proposition 3.19, θ extends to a simple character of [𝔄,n,0,α] occurring in the same representation (EP lines 832–834), and θ restricts to ψ_α on U^{[n/2]+1}(𝔄) (EP lines 801–802).
- **F02.** ArithmeticGaloisRepresentations §1.3, at the indexed head of its open pull request, defines continuous induction for an arbitrary profinite Γ and open H, with both Frobenius reciprocities, duality, the projection formula and the finite-transversal homeomorphism. Its coefficient tiers include finite extensions of ℚ_ℓ for every ℓ (its Conventions). It is line 37 of the merge order. LocallyAnalyticRepresentationsOfLocalGroups is in neither the merge order nor the open pull-request index, so it could not have been a supplier anyway. ArithmeticGaloisRepresentations states the adjunction for finitely generated representations; for the compact module M∞, §3.2 now uses the same coset formula, which is continuous coordinatewise because the induced module carries the finite product topology.
- **F05.** BIP Remark 6.10 (BIP lines 2495–2498) says the Σcris case of Theorem 6.1 holds with no restriction on p, by BIPD Corollary 5.2 (BIPD lines 462–465). The route is:
  - BIPD Proposition 2.7 and Corollary 2.8 give the lifts (BIPD lines 281–319).
  - The components of the rigid generic fibre are the X□,χ (BIPD lines 329–339).
  - BIPD Theorem 3.3 does the closure step (BIPD lines 349–354) via IYE Proposition 5.10. IYE lines 871–880 confirm it is the framed case for a general residual representation.
  - BIPD Lemma 5.1 passes from the rigid fibre to Spec R (BIPD lines 454–461).

  Benign density follows by the pattern of BIPD lines 428–439, from NAK Lemma 4.2 (NAK lines 1356–1418), whose proof puts no condition on p. On ownership, the parent §5.2a defines benign points and constructs the framed trianguline variety X_tri(r̄); LocalGaloisDeformationRings §§1.1, 3.4, 3.10 define neither. Putting these contracts there would create a second benign definition. Faithfulness (§4.2) and §§5.3–5.4, 6.3, 6.5 keep p∤2d. BIP Remark 6.10 (BIP lines 2498–2500) says patching is the only known route for the fixed-weight sets.

## Checks run

Dependency check (exit code 0):

```text
candidate: CompletedCohomologyAndLocalGlobalCompatibilityPartII is not in the merge order yet; checked as if placed after ModularityAndLanglandsExtensions (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 639 edges, 0 problem(s)
```

It reports no UPWARD or CYCLE line. Other checks:

- **Citation resolver** on the edited README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."
- **Manifest:** `sources check` on `sources.toml` reports 0 problems.
- **README/plan agreement:** every target block re-renders from the plan, layer Dependencies equal the union of target Needs, and every `gap:` slug in the README is declared exactly once. Nothing is declared and left unused.
- **Gate failures:** none were listed for this round.

## Sources

Four sources were fetched through the sources service and recorded with full metadata:

| Key | Work |
| --- | --- |
| BIPD | arXiv:2206.06944v1; the published version is Proc. Natl. Acad. Sci. USA 2023, but it is cited in the arXiv numbering |
| IYE | Iyengar, arXiv:1904.05996v4 |
| DEJ | de Jong, Publ. Math. IHÉS 82 |
| CON | Conrad, Ann. Inst. Fourier 49 |

BIPD is the same key the reviewer used; the reviewer's entry was not in this checkout. NAK and EG gained `cited_for` entries. Two other things to know:

- The service reordered keys inside the existing entries; their content is unchanged.
- No text was unreadable, so there is no `needs-references.toml`.

## Suggested.lean and elaboration

This design package has no `Suggested.lean`, and none of the editable files is one. The README's headline section still says that no headline is statable at the pins. Its list now names crystalline density at every prime (BIPD Corollary 5.2) instead of attributing all three densities to BIP Theorem 6.1. There were no declarations, so the `#check @name` comparison had nothing to run on and no Lean command was run.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §6.4 full vs deep set (F01) | p=3, d=1, F=E=ℚ_3(ζ_3), conductor exponent 2 | n=1; least m=1, so deep n≥3; character trivial on U^3, ψ_α nontrivial there; full membership 1, deep membership 0 | Equality false, inclusion true | Deep subset, inclusion, Check |
| §6.4 deep ⊆ full | Any (α,θ), n>2m | θ restricted to U^{[n/2]+1}(𝔄) is ψ_α; Ind from H^{m+1} to H^1 of θ is a sum of θ̃∈C(0,α) | Holds | API bullet |
| §6.5 unramified case vs §5.4 | d=1, E=F, unramified χ | χ is in Σspcd_k=Σ_k; it contains no stratum with n>0, so it is not in Σsc_{k,F} | Sets differ; only inclusion holds | Check rewritten |
| §6.5 tame inference | p=5, d=2, E=ℚ_5(√5) | e=2, f=1, 5∤4, uniformizer minimal | Holds | None |
| §3.2 finite-index induction (F02) | K=ℤ_5^×, H=1+5ℤ_5, χ(u)=u | Index 4; χ(1+5^a)=1+5^a≠1 for every a; Ind has dimension 4; Hom_H(O[[K]],χ*) and Hom_K(O[[K]],(Ind χ)*) both have dimension 4 | Continuous induction needed and supplied | Supplier, Check |
| §3.2 coset adjunction on M∞ | φ:M∞→V* H-linear | Φ(m)(hx)=φ(hxm)=hΦ(m)(x); Φ(gm)(x)=Φ(m)(xg) | Equivariant; continuous on 4 (in general [K:H]) coordinates | Proof sketch |
| §3.2 reducedness Check (F03) | H=1, B=O[[x]], M=B/(x²) | Rank over O is 2; test = M; Ann=(x²); x²=0 but x≠0 | Finiteness does not give reducedness | Check |
| §5.2 at p=2 (F05) | d=1, F=ℚ_2, trivial ρ̄ | μ_{2^∞}(ℚ_2)={±1}, so 2 components; x↦x^n takes value (−1)^n at −1; 2 divides 2d=2 | Both components met; old hypothesis was false here | Positive Check |
| §5.2 at p=2, d=2 | F=ℚ_2, trivial ρ̄, diag(χ_a,χ_b) | (a,b)=(1,0) gives determinant −1 at −1; (2,0) gives +1; both regular, both residually trivial | Both components met; agrees with PadicLocalLanglandsForGL2Qp §3.6a's two components | Check |
| HT convention (BIPD, IYE) | (2,0), (1,1) | Negate and reverse: (2,0)→(0,−2), regular; (1,1)→(−1,−1), not regular | Same set Σcris | Convention Check |
| gap:crystalline-lift-prescribed-determinant | d=1; p=2, d=2 with irreducible ρ̄ | d=1: the lift is ψ itself; irreducible case is BIPD Prop 2.6 | No restriction on p or d | New gap |
| gap:berthelot-points-components | A=O; O[[x]]/(x²−ϖ); O[[u,v]]/(uv) | One point; one point with residue field L(√ϖ), irreducible; normalization O[[u]]×O[[v]] gives 2 components | Matches DEJ 7.1.9 and CON 2.3.1 | New gap |
| §5.2 rigid-to-scheme step | f∈R□[1/p] vanishing on Σcris | V(f) is all of X□, so f is in every maximal ideal, which is the nilradical of a reduced Jacobson ring, so f=0; R□⊆R□[1/p] | Vanishing ideal 0 | Proof sketch |
| §5.2 components disjoint | R□[1/p]=∏_χ R□,χ[1/p] | Each arithmetic point lies in exactly one X□,χ | Closure containing one point of X□,χ contains X□,χ | Proof sketch |
| §6.1 local route | Point x of (Spf R□,k_cr)^rig; empty k-locus | Complement of a Zariski-closed set containing all benign points is an admissible open neighbourhood of x with no benign point, a contradiction; an empty locus is vacuous | Holds | New route |
| §6.1 at p=2 | d=1, F=ℚ_2 | Benign = crystalline in rank one; both components met | Holds | Check |
| §1.2 at p=d=3 | 3 divides 6 | Faithfulness and fixed-weight densities excluded; §5.2 local route applies | Consistent with new §5.2 | Check rewritten |

## Ownership

The roadmaps on main and the 367 indexed open roadmap pull requests were searched by object with `roadmaps grep` (crystalline density, infinite fern, trianguline variety, crystalline lift with prescribed determinant, points and components of rigid generic fibres). Results:

- **PadicLocalLanglandsForGL2Qp §3.6a** states the two-dimensional ℚ_p special case. It is cited in Scope and in a Check as a special case.
- **Parent §5.2a** owns X_tri(r̄) and the benign predicate, so it receives the closure and local-benign contracts.
- **RigidAnalyticGeometry Layer 8** compares analytifications of finite-type schemes, not Spf R.
- **AdicSpacesPartIII §R2.9** owns the Berthelot-type functor, so it receives the point and component contract.

No owner exists for the general-F, general-d crystalline and benign density. This roadmap keeps §§5.2 and 6.1 as its own targets, which the review accepted.

## For the maintainer

- **New supplier gaps, each declared in plan `gaps` and under Exact supplier contracts:**
  - ModularityAndLanglandsExtensions §2.1: gap:crystalline-lift-prescribed-determinant.
  - CompletedCohomologyAndLocalGlobalCompatibility §5.2a: gap:crystalline-closure-components and gap:local-benign-crystalline-points.
  - AdicSpacesPartIII §R2.9: gap:berthelot-points-components.
- **Removed:** gap:continuous-finite-index-induction, together with the supplier LocallyAnalyticRepresentationsOfLocalGroups.
- **New supplier contracts:** ArithmeticGaloisRepresentations §1.3 and AdicSpacesPartIII §R2.9. Both lie earlier than this roadmap, and the dependency check shows no change of placement.
- **Consumers of §§5.2 and 6.1** can now rely on every prime. The other endpoints keep p∤2d.
- **Lean names:** this design declares none, so no Lean name that other roadmaps cite changed.
- **Prescribed-type density (§6.3)** keeps p∤2d. The sources read here give no all-prime local route for a fixed inertial type, so it was not widened.
- **Untrusted text:** the review contained no instructions outside its findings, and nothing suspicious was found.
