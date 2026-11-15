# FIX-RT-HigherHidaAndColemanTheory~1

Repair of red-team round 1 (passes a and b) of `packages/HigherHidaAndColemanTheory`. Files changed: `README.md`, `sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## RT-HigherHidaAndColemanTheory~1a/F01 (P2) — applied

Changed: Conventions gain the BP-Hida presentation convention (BP-Hida line 369–373): locally principal D carries s_D:L_D→O with image I, O(−D)=L_D, F(nD)=F⊗L_D^(⊗−n), natural maps possibly non-injective, plus a three-point Check. §2.8(c): "two inclusions" → "two natural maps of the presentations". §2.8 Check: "O(D+) is e_aO" → O(D+)=O, map ×e_a, pullback (1,1,0).

Pattern: the Conventions twist formulas and §8.1's tildeωκχ(m(D+−D−)), (D+), (−D−) now read through the same convention. The gap text is unchanged.

## RT-HigherHidaAndColemanTheory~1a/F02 (P1) — applied differently

Changed: §2.2 gains refinement items (1)–(5) (BP-Hida Lemmas 2.1.12–2.1.13, 2.1.29–2.1.32, proof of Theorem 2.7.4) with three Checks (ℙ³ syzygy bundle, non-Cartier three points, ℤ/4). The routes of §2.4 and §2.7 cite §2.2(3)–(5). There is a new supplier block, AdicCoefficientsAndComparisons L2/strict-from-dense, L2/cartier-boundary-cofinal and L2/vector-bundle-extension-cofinal, and the pinned Tau Ceti compactification and blow-up declarations are cited.

Evidence for the difference: the gap the reviewer proposes on SchemeAndStackFoundations §4.12 would plan again a statement that already has an owner. AdicCoefficientsAndComparisons, earlier in the merge order, states BP-Hida Lemma 2.1.6 over every noetherian affine base (its Layer L2, *Compactifications to which a vector bundle extends*). The finding itself is right: BP-Hida line 1211–1213 uses Lemmas 2.1.6, 2.1.12 and 2.1.30, and none was stated. Lemma 2.1.30 is also used for §2.4 (BP-Hida line 971).

## RT-HigherHidaAndColemanTheory~1a/F03 (P3) — applied differently

Changed: the three restating Checks of §8.1 are replaced by computed ones:
- the vertical twist on ℤ_p[x,y]/(xy−p);
- support, compared with the completion and with RΓ(Z,i^!) of a scheme structure;
- the factorization over (ℤ/9)[x].

The §8.1 sentence "not ordinary local cohomology at a reduced divisor" → a precise description of RΓ_Ẑ.

Evidence for the dispute: the reviewer's second Check is false. BP-Hida line 1479 defines RΓ_Ẑ(Y,F)=RΓ(Ẑ,î^!F), and line 3180–3181 gives its triangle with RΓ(U∖Z). For 𝔽₃[t] this object has H¹=𝔽₃[t,t⁻¹]/𝔽₃[t]; the completion 𝔽₃[[t]] belongs to the other triangle (line 1401).

## RT-HigherHidaAndColemanTheory~1b/F01 (P1) — applied differently

Changed: §6.5 now has four parts:
- (0) the algebraic BGG resolution by `TauCeti.VermaModule` of the derived algebra (Humphreys-BGG §§6.1–6.3, uncertified; Jones-BGG §5);
- (1) analytic exactness (Jones-BGG Theorem 26 and Proposition 24; BP-Coleman for normalization);
- (2) finite slope;
- (3) distributions.

It also gets a proof route and two Checks. LocallyAnalyticRepresentationsOfLocalGroups §§1.4 and 5.1 supply closed images.

Evidence for the difference: the reviewer's route ("a formal primitive converges on a smaller neighbourhood") is not Jones's argument. Jones uses weight decomposition and closed images (Jones-BGG Proposition 24, p. 24), and germs arise as the colimit over the open M₁M_n(F). Urban 2011 is paywalled and not needed. Ownership: no roadmap on main or at the open heads states the BGG resolution by Verma modules, so (0) belongs here.

## RT-HigherHidaAndColemanTheory~1b/F02 (P3) — applied

Changed: the subsection "From TauCetiRoadmap.LieHighestWeight" is deleted, along with its §6.5 and Layer 6 edges. "From Tau Ceti" gains `TauCeti.VermaModule` (Verma.lean:195) and `TauCeti.existsUnique_lieModuleHom_apply_vermaGenerator` (:305), noting the `IsKilling` hypothesis, so the derived algebra is used. Scope line 20 is reworded. Confirmed by LieHighestWeight's Scope on main ("a consumer cites the declaration").

## RT-HigherHidaAndColemanTheory~1b/F03 (P3) — applied

Changed:
- `gap:coherent-correspondences` is removed from §§5.4, 5.4a, 5.5, 5.7, 6.1, 6.6b, 6.10, 7.1, 9.6 and 9.7.
- AutomorphicBundlesPartII §3.2 is removed from §§5.4a, 5.5, 6.1 and 6.6b.
- AdicSpacesPartIII §R3.8 is added to §§5.4, 5.7, 6.1, 6.10 and 9.6.
- §9.7 now cites AutomorphicBundlesPartII §3.2.

The Dependencies of Layers 5, 6, 7 and 9 were recomputed mechanically. Confirmed: AutomorphicBundlesPartII §3.1 is for finite-type schemes, and no listed target uses K+−/K−+.

## RT-HigherHidaAndColemanTheory~1b/F04 (P3) — applied

Changed: §3.7 "the right-hand operator convention is the classical normalized action" → T(ℚ_p) acts on the right-hand side through t_naive, units by χ, and ord is the factor where t_κ=ν_w(κ)(t)t_naive has unit eigenvalues. A p=3 example (U_naive eigenvalue 3 ordinary, 1 not) is added. Verified against BP-Hida Corollary 4.5.5 (line 2683–2688). There is no other occurrence of the phrase.

## RT-HigherHidaAndColemanTheory~1b/F05 (P3) — applied differently

Changed: the first step of the §9.5 route ("from Proposition 5.1.5.1") is replaced by a computation: B\G/Kli has 4 cosets, so π^Kli is 4-dimensional; then the Iwahori decomposition of Kli(p) for P_Kli with the central contracting a=diag(p²,p,p,1). It uses SmoothRepresentationsOfLocalGroups §SR.2.3 *jacquet-invariants* and §SR.2.2 *geometric-lemma*; §SR.2.3 is added to the Needs.

Evidence for the difference: the "[24], coro. 3.2.2" locator is not added, because Pilloni-Singular line 5066 lists [24] as Gan–Takeda, so the quoted source cannot be identified with certainty.

## Checks run

- `lake env lean packages/HigherHidaAndColemanTheory/Suggested.lean` (from the content checkout): exit 0, no messages. The file declares nothing, so the `#check @name` comparison has nothing to compare; it was not needed and nothing changed.
- Dependency check: `depcheck: 245 roadmaps, 2232 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. The new edges are AdicCoefficientsAndComparisons and LocallyAnalyticRepresentationsOfLocalGroups, both earlier in the merge order; the LieHighestWeight supplier edge is gone.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. A first run flagged the key "Humphreys-CategoryO" as a roadmap "CategoryO"; the key was renamed `Humphreys-BGG` (introduced this round).
- No gate failures were listed for this round.

## Adversarial pass (new or changed statements)

| Statement | Instance | Computed | Result |
| --- | --- | --- | --- |
| Conventions: presentation line bundles | Xbar={a,b,c}, D=V(e_a) | O(D) ranks (1,1,1); e_aO and its dual (1,0,0); colim of ×e_a is O_a=j_*O | holds; Check added |
| §2.8(c) Check, non-factorization | σ(a)=a, σ(b)=a, σ(c)=b | σ*(e_a)=(1,1,0); T(0,1,0)=(0,0,1) | T does not factor |
| §2.2(1)–(2) strict pullback | ξ=id; continuous ξ⁻¹(int A)⊆int ξ⁻¹A | unchanged; interiors pull back | holds |
| §2.2(3) blow-up, non-Cartier | three points, V(e_a) | Bl = {a}; boundary ∅; strict | holds; Check |
| §2.2(3) product ideal | IJ invertible | I·(J/f)=R, so I invertible | holds |
| §2.2(4) necessity | ℙ³_{𝔽_p}∖pt, Frobenius, syzygy F | (x^p)⊂(x)^p, s=1/p (s=1/2 at p=2); stalk needs 3 generators for rank 2; rank-2 kernel on blow-up | holds; Check |
| §2.2(4) nonreduced base | A=ℤ/4, ℙ¹_A, F=O | identity compactification; unit ideal Cartier | holds; Check |
| §2.2(5) unions | strict exponents s₁≤s₂ | (I′)^(a′b)⊆I^(bb′) for a/b≤a′/b′; s=max works | holds |
| §8.1 twist Check | ℤ_p[x,y]/(xy−p) | y/x∉R (y≠0 in 𝔽_p[y]); x·(y/p)=1 in R[1/p] | holds |
| §8.1 support Check | 𝔽₃[t], Z=V(t), V(t²) | H¹=𝔽₃[t,t⁻¹]/𝔽₃[t] both; completion H⁰=𝔽₃[[t]]; Ext¹(B/t^k,B) dims 1,2 at k=1,2 | holds |
| §8.1 factorization Check | (ℤ/9)[x], D+=V(x) | T=x factors; 1,3∉(x); (x)^a⊆(x)^b false for a<b | holds |
| §3.7 convention | GL₂, k=2, p=3, t=diag(1,3) | ν(t)=1/3, twist ×3; U_naive 3↔t_κ 1 (ord), U_naive 1↔t_κ 1/3 (slope −1) | holds |
| §6.5(0) SL₂ | κ=1; κ=0 | s·1=−3: ch M(1)−ch M(−3)=e¹+e⁻¹; s·0=−2; Hom(M(−1),M(1))=0 since e·fv₁=v₁ | holds; Check |
| §6.5(0) centre | GL₂, κ=(3,1) | s·κ=(0,4), sum 4=4; 𝔰𝔩₂ restriction 2↦−4=s·2 | holds; Check |
| §6.5(0) degenerate | W_M={1} | M(κ)=Vκ one-dimensional | holds |
| §6.5(1) colimit | M₁M_n(F) open | Iwahori decomposition N̄₁N̄_n×T(ℤ_p)×N₁N_n (M_n normal); m-analytic for some m≥n by compactness | holds |
| §6.5(2) | SL₂, p=3, f(z)↦f(9z) | 1_{3ℤ₃} ↦ constant after one step; finite slope = constants | holds |
| §9.5 route | GSp₄ | \|W\|/\|W_Kli\|=8/2=4; a: N-entries scale by p,p,p²; a₁a₄=a₂a₃=p²; (1,1,9,9), p=3 → 1/3, 3, 3, 27 as in the Check | holds |
| §9.7 Needs | AutomorphicBundlesPartII §3.2 | needs proper p₁; the compactified Klingen correspondence (ShimuraCompactifications §6.16) is proper | holds |
| Layer Dependencies | Layers 1–9 | Needs-union minus Dependencies = ∅ both ways | holds |

## Sources

- `Jones-BGG` (arXiv:0912.4756v2) was fetched through the sources service and is certified, open-repository.
- `Humphreys-BGG` (GSM 94, DOI 10.1090/gsm/094) is recorded as uncertified (paywalled), cited by its locator.
- Urban 2011 is not cited; there is no `needs-references.toml`.
- BP-Hida and BP-Coleman locator strings now include the newly cited items (§2.1.14, Lemmas 2.1.4–2.1.6, 2.1.12–2.1.13, 2.1.29–2.1.32, §§2.3.1, 2.9.1, 2.10; §§6.2.1, 6.2.4, Lemma 6.2.13, Remarks 6.2.14–6.2.15).
- Gate repair (manifest value over 1000 characters): the BP-Coleman locator went from 1014 to 973 characters. Removed are §§2.4.7, 2.4.8 (already inside §§2.4–2.6), §5.9.8 (already inside §5.9) and the words "revised author PDF" in the closing parenthesis (the `version_note` already names that version). Every cited item is still covered, and no other field or file changed. The BP-Hida locator is 946 characters.

## For the maintainer

- `design/plan.json`'s `gap:coherent-correspondences` entry still lists, under `neededBy`, the analytic nodes (C4/level-invariance, C4/bruhat-cousin, C4/proved-slopes, F5/analytic-hecke, E6/eigenvariety, X8/klingen-analytic-family, X8/klingen-small-slope) whose Needs no longer name the gap. This job may only add gaps, so it was left.
- New supplier edges are AdicCoefficientsAndComparisons (L2 targets) and LocallyAnalyticRepresentationsOfLocalGroups §§1.4, 5.1. Both are still open new-roadmap pull requests, and both are earlier in the merge order.
- No section id of this roadmap changed. §2.2 and §6.5 gained numbered items. PadicFamiliesPartII's citations (§§1.1, 2.3, 5.x, 9.4–9.8) are unaffected.
- No suspicious instructions were found in the reviews or fetched texts.
