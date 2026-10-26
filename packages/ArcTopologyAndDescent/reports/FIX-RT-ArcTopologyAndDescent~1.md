# Repair report: ArcTopologyAndDescent, red-team round 1

Two reviews were merged. Each finding is headed by its own review id. The first three sections (F01–F03, all P3) are pass a's findings: Checks and build order. The next five (F01–F05: two P2, three P3) are pass b's findings: supplier duplication, gap shape and citations. The two passes do not overlap, so each finding is settled once below.

## F01 (P3) — applied

§1.1 second Check "For sets, compute the matching equalizer and recover ordinary descent data" → a concrete fold. For Spec(k×k)→Spec k with affine-line sections, the arrows k²⇉k⁴ send (a,b) to (a,a,b,b) and (a,b,a,b). Their equalizer is the diagonal ≅ k. For F₂ it has two elements, whereas the unconstrained k² has four.

## F02 (P3) — applied

"How to read the build" now says the sections of each layer are built in their displayed order, except that §1.6 comes before §1.4, which uses it. It also records that §1.6 needs only the supplied refinement, scheme limits and right cancellation. A mechanical scan of every section's references found §1.4 → §1.6 to be the only forward dependency. The other forward mentions name consumers, not inputs.

## F03 (P3) — applied

§1.6 third Check (a generic warning) → a concrete case: A_i=k[x], B_i=k[x,x⁻¹], with both transitions sending x to 1. Both colimits are k and the limit map is id_Spec k, a v-cover, but no stage is a v-cover. The transitions are noncartesian, and right cancellation is unavailable. §4.2's matching vague sentence now cites this example.

## F01 (P2) — applied

§8.8: deleted the torsion-sheaf sentence and the sentence beginning "Extend G by zero". The locator is now BM21 Corollary 6.10 (line 2080), the route is spelled out, and the Needs list is reduced accordingly. The consumers §§8.9, 9.4, 10.1 and 11.5 now cite the punctured henselian comparison in PrismaticCohomology §2.0. The Scope row says that §8.8 enlarges that comparison.

Evidence: the open head of PrismaticCohomology, §2.0 ("If (A,I) is henselian, cohomology on Spec A \ V(I) agrees with …", citing BM21 Theorem 6.11) supplies exactly the deleted statement. G is given on the base there, which covers G on the punctured spectrum by extension by zero; the line 69 contract now says so. §10.1 ("Apply Fujiwara–Gabber") and §8.9 were further consumers of the same theorem that the review did not name, and both are repaired. The rigid-functor form (BM21 Corollary 6.10) is owned nowhere else: `roadmaps grep` for "Corollary 6.10" and "rigid arc-sheaf" found no other owner.

## F02 (P2) — applied differently

The gap is compound, but splitting it would leave two contracts that no target consumes, so `gap:bounded-torsion-punctured-approximation` is deleted from `design/plan.json` and from the README. §8.9 now follows BC22's own proof of Theorem 2.3.4 (BC22 lines 1230–1243). §10.1 now applies AdicEtaleGeometry §A1.0.5(a) after dividing out bounded π-power torsion, and §12.2 cites §A1.0.5 alone.

Why: §8.9 states only cohomological comparisons. Put W=U∩V(a); its complement in U is D(a). The localization triangle reduces the open statement to two comparisons:
- **Open terms.** These are compared by the punctured henselian comparison for (A,(a)).
- **Local-cohomology stalks.** At a geometric point z of W these are the a-supported cohomology of the strict henselizations B of A and B′ of Â_a. Both are henselian along a, and both reduce modulo aⁿ to (A/aⁿ)^sh, so they have the same completion. The punctured comparison therefore identifies their punctured terms, and both whole terms are the stalk F_z.

The support and I-adic statements then follow from the triangle together with Gabber's theorem. No finite étale approximation over an open is used.

For §10.1 the reviewer's own note holds. The π-henselization of R₀ is flat over R₀, so its π-power torsion N is bounded. Dividing out N keeps the ring henselian (SchemeAndStackFoundations §0.14), makes π a nonzerodivisor, and leaves both R[1/π] and R̂[1/π] unchanged, because the completed sequence 0→N→R̂→(R/N)^∧→0 is exact. §A1.0.5(a) then applies as stated. The AdicEtaleGeometry contract records this argument. The gaps in `plan.json` and the README now agree (4 slugs), and no node of `plan.json` referenced the deleted slug.

## F03 (P3) — applied differently

Lines 15 and 69: "torsion v/arc hyperdescent" → "descent". Line 1490: "the arc-hypersheaf supplied" → "the arc-sheaf supplied …; it takes values in `D(Z)^(>=0)`, so it is hypercomplete". §9.5's route now gives the upgrade (CS24 line 808), and §11.5 cites it.

The reviewer's argument includes the step "the sheaf is the limit of its truncations". That is Postnikov convergence, which is not automatic: EnhancedDerivedSheaves §E2.7 itself separates it from hypercompleteness. The argument used instead is that for each k≥0, Ω^(∞−k) of a `D(Z)^(>=0)`-valued sheaf is k-truncated, and truncated sheaves are hypercomplete. Constructible complexes keep "hypercomplete arc-descent", which the supplier does state.

## F04 (P3) — applied

Summary: "a finitary v-sheaf is an arc-sheaf precisely when it satisfies Milnor excision" → "a finitary v-sheaf with values in an infinity-category compactly generated by cotruncated objects is an arc-sheaf precisely when …" (BM21 Theorem 4.1, line 1009). The suggested second clause, that small-limit-valued arc-sheaves satisfy excision, is already the Summary's fourth sentence (BM21 Corollary 4.25, line 1499) and was not repeated.

## F05 (P3) — applied

Line 69: "BM21 lines 1560, 1780, 1976, 2093 and 2142" → "1560, 1776, 1976, 2087 and 2142". At the cached text, line 1776 opens Theorem 5.13 (line 1780 is the page-43 header), and line 2087 opens Theorem 6.11 (line 2093 is inside its proof). Lines 1560, 1976 and 2142 were confirmed. No other occurrence of 1780 or 2093 exists in the package.

## Checks run

- **Lean elaboration:** `lake env lean` on `packages/ArcTopologyAndDescent/Suggested.lean`, run from the content checkout, exited 0. There were exactly five `declaration uses sorry` warnings (lines 55, 67, 89, 111, 122) and no errors. The Tau Ceti module's object file was present, so nothing was built. `Suggested.lean` is unchanged: no finding concerned it, and no Lean name of this roadmap changed.
- **Signature check:** a scratch file with `#check @name` for all ten declarations exited 0. Each elaborated type agrees with its README statement (§§2.7, 7.8, 10.0, 10.8), there is no section-variable block, and no binder is lost. Nothing changed.
- **Dependency check:** `gate --depcheck … --name ArcTopologyAndDescent --order merge-order/ORDER.txt --movable` exited 0:

  ```text
  depcheck: 56 roadmaps, 654 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line. No new supplier was added; the new Needs entries name PrismaticCohomology §2.0, SchemeAndStackFoundations §§0.12–0.14, 2.7 and 2.15, and EnhancedDerivedSheaves §§E0.1–E0.5, all of which were already suppliers.
- **Citation resolution:** `roadmaps resolve` on the README lists no cross-roadmap citation and no Lean name found nowhere.
- **Sources:** all texts used were already in `sources.toml`. Locators were added to existing keys only: CS24 (proof of Theorem 2.2.5, line 808; Remark 2.2.6, line 821; `cited_for` gains §9.5) and BC22 (proof of Theorem 2.3.4, line 1230). There is no new key and no missing-reference request. HUB96 stays uncertified.
- **Gate failures:** none were listed in the brief.

## Ownership and citation audit

- **PrismaticCohomology §2.0:** read at its open head through `roadmaps show`. It states torsion étale "arc descent and excision", hypercomplete arc-descent for `Dᵇ_cons`, formal gluing, the punctured henselian comparison and the arc_p sheaf.
- **AdicEtaleGeometry §A1.0.5(a):** read on main. It needs t to be a nonzerodivisor and (R,tI) henselian, and it treats D(t) only.
- **EnhancedDerivedSheaves §§E2.6–E2.7:** read on main. They supply bounded-below hypercover descent and space-valued sheaves, and they separate hypercompleteness from Postnikov convergence.
- **SchemeAndStackFoundations:** read on main. §0.14 covers permanence under quotients and that complete pairs are henselian; §2.7 the localization triangle and local-to-global spectral sequence; §2.15 Gabber's theorem, strictly henselian vanishing and limits.
- **Other owners:** `roadmaps grep` over main and all open heads for "Corollary 6.10", "rigid arc-sheaf", "Fujiwara", "Theorem 2.3.4", "Lemma 3.1.2" and bounded-torsion henselian approximation found no other owner of BM21 Corollary 6.10 or of CS24 Lemma 3.1.2. The hits were other papers' numbering, plus ClassicalAdicEtaleCohomology's Huber–Fujiwara comparison, which compares Spec with Spa and is distinct.

## Adversarial mathematics pass (changed or added statements)

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Summary: finitary v-sheaf with cotruncated compactly generated target is arc ⇔ excisive | terminal functor; v-sheaf image H of the rank-two split (§4.3) | terminal: arc true, excisive true. H: arc false (split is an arc-cover, H(V)∌pair), excisive false (prime square fails) | agrees | hypothesis added |
| Contract: punctured henselian comparison, G on Spec A | (Z_p,(p)), Z/ℓ; (Z_(p)^h,(p)), p=3, ℓ=2; I=0; I=A | Z_p: identity. Z_(3)^h[1/3] vs Q_3: H⁰=Z/2, H¹=(Z/2)² (Q_3^×/(Q_3^×)²≅(Z/2)²), H²=Z/2 on both sides. I=0: both punctures ∅, 0=0. I=A: A=0 | agrees | none |
| Contract: G on puncture via extension by zero | j:U→Spec A open, G on U | j*j_!G=G, so the punctured terms for G and j_!G coincide | agrees | sentence added |
| Contract/§9.5: `D(Z)^(>=0)` sheaves are hypercomplete | RΓ(Spec Q_3,Z/2) | π₀=Z/2, π₋₁=(Z/2)², π₋₂=Z/2, πⱼ=0 for j>0. Ω^(∞−2) has π₀=Z/2, π₁=(Z/2)², π₂=Z/2, higher 0: 2-truncated | argument holds | justification replaced |
| Contract: bounded π-torsion quotient keeps R[1/π], R̂[1/π] | R=Z_p[x]/(px); unbounded R=Z_p⊕⊕ₙZ/pⁿ (square-zero) | bounded: N=xF_p[x], c=1, R/N=Z_p, R[1/p]=Q_p=(R/N)[1/p], R̂=R, R̂[1/p]=Q_p. Unbounded: z=Σₙpⁿ·1_(2n)∈N̂ has p^m z≠0 for all m, so R̂[1/p]⊋Q_p | bounded case holds; boundedness needed | contract text |
| §1.1 Check: fold equalizer | k=F₂ | F(Spec k)=2 elements. Eq{(a,b): (a,a,b,b)=(a,b,a,b)}={(0,0),(1,1)}=2. Unconstrained k²=4 | agrees | Check replaced |
| §1.6 Check: noncartesian diagram | A_i=k[x], B_i=k[x,x⁻¹], x↦1 | colim A=colim B=k. B_i⊗_(A_i)A_(i+1)=k[x]≠k[x,x⁻¹]. Fibre of Spec B_i→Spec A_i over x=0: ∅. Limit: id_Spec k, v-cover. B_i⊗_(A_i)k=k | stagewise covering fails; §4.2 hypothesis violated | Check replaced; §4.2 cites it |
| How to read the build: §1.6 before §1.4 | all Needs clauses | the only forward Needs edge is §1.4→§1.6. §1.6 Needs: PrismaticCohomology §2.0, SchemeAndStackFoundations §0.9 and right cancellation; no Layer-1 target | agrees | sentence added |
| §8.8 (BM21 Cor 6.10) | F=RΓ(−,Z/2), (Z_(3)^h,(3)); I=0; I=A; non-rigid F=RΓ(X_perf,O) on (F_p[t]^h,(t)) | Z_(3)^h: H¹=(Z/2)² both sides. I=0: F(∅)=0 both. I=A: A=0. Non-rigid: F(A)=(F_p[t]^h)^perf≠F(A/t)=F_p, and the punctured perfections F_p[t]^h[1/t]^perf vs F_p((t))^perf differ, so rigidity is needed | agrees | torsion sentence deleted, route explicit |
| §8.8 route: (Â_I,IÂ_I) henselian, A/I≅Â/IÂ | I=(p) in Z_(p)^h; I=0 | Z_p complete along (p): henselian. Z/p=Z/p. I=0: Â=A | agrees | none |
| §8.9 open statement, new route | A=Z_(3)^h, a=3, U=Spec A; a=0; a unit | RΓ(Spec A,Z/2)=RΓ(F_3,Z/2) (H⁰=H¹=Z/2) = RΓ(Spec Z_3,Z/2). Stalk at closed point: B=Z_(3)^sh, B′=Z_3^sh, B/3ⁿ=B′/3ⁿ=W_n(F̄_3). a=0: Â=A, D(0)=∅. a unit: A=0 | agrees | route replaced |
| §8.9 I-adic statement via triangle | noetherian A=k[x,y]^h at (x,y), I=(x,y); I=0; I=A | whole: RΓ(A)=RΓ(k)=Λ=RΓ(k[[x,y]]). Punctured: punctured comparison. I=0: RΓ_∅=0 both. I=A: A=0 | agrees | route replaced |
| §9.4: E_t via R^h_t | R=Z_p[x], t=p; t=0; t unit | R^h completes to Z_p⟨x⟩, both punctures compared. t=0: R^h=R, R[1/0]=0, E=0 both. t unit: R^h=0=R̂, E=0 | agrees | supplier cited |
| §10.1: descend via §A1.0.5(a) after torsion quotient | R₀=O_K[X,T]/(gT−f) with π∈{f_i}; n=0 model K | quotient by bounded N leaves R[1/π] and R̂[1/π] (row above); §A1.0.5(a) needs a nonzerodivisor (true after quotient) and (R,π) henselian (quotient of henselian) | agrees | route and Needs |
| §11.5: henselized vs completed punctured functors | R=Z_p, I=(p); I=0; I=A | Z_p: R^h=R̂=Z_p. I=0: punctures ∅, value 0. I=A: R^h=R̂=0. All five functors are `D(Z)^(>=0)`-valued | agrees | supplier cited; upgrade explained |
| Scope row: §8.8 enlarges the supplied comparison | F=RΓ(−,G), G torsion | finitary (continuity), arc-sheaf (supplied), rigid (Gabber), so it is an instance of §8.8 | agrees | row text |

## Maintainer notes

- **Gap removed.** `gap:bounded-torsion-punctured-approximation` is deleted. This roadmap no longer asks AdicEtaleGeometry for anything beyond §§A1.0.5 and A1.15 as they stand.
- **Stronger reliance on PrismaticCohomology §2.0.** That roadmap is still an open pull request, and four targets here (§§8.9, 9.4, 10.1, 11.5) now cite its punctured henselian comparison. Its §2.0 should keep that statement (BM21 Theorem 6.11, I finitely generated).
- **§8.8 has no internal consumer.** It remains the owned, exported rigid-functor form (BM21 Corollary 6.10).
- **§8.9 hypotheses.** The new §8.9 route does not use the bounded-torsion or noetherian hypotheses, only that the ideal is finitely generated. The statements keep the hypotheses of CS24 Lemma 3.1.2, which is the generality the cited sources state.
- **Names.** No Lean declaration changed, and no name cited by another roadmap changed.
- **Reviews.** The review texts contained no instructions to act on and nothing suspicious.
