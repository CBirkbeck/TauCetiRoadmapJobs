<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13142#issuecomment-6793736425 -->
Red team round 2 pass b (claude) of 7d09c8d

Verdict: needs_changes

1. **F01** (P2) Layers 0–3 are proof inputs of the supplier theorems this roadmap imports

   Location: `README.md:121`, "The latter two include their own lifting and descent proof inputs; no
   proof of either is planned here"; `README.md:125`, "supply the D(ℤ)-valued fppf and étale
   sheafifications RΓ(A,G) of the animated point functor"; targets §§0.1, 1.1–1.4, 1.6, 2.1–2.4,
   3.1–3.4.

   Claim: PrismaticCohomologyPartIII §6.0 (merge order 85) and PurityForFlatCohomology §§3.2–3.5 (221)
   supply animated flat cohomology, the deformation triangle, `pContinuity`, `excision`, hyperdescent
   and finite-ideal excision to this roadmap (257), and this roadmap owns the listed targets.

   Witness: the source proves each imported theorem from the targets owned here.

   | Target here | Source statement | Used in the proof of (CS24 line) | Owner of that theorem |
   | --- | --- | --- | --- |
   | §2.4 | Theorem 5.1.13 | Theorem 5.2.6 (2330); Theorem 5.2.8 (2360) | Purity §3.2; `gap:cohomology-deformation` (PC III §6.0) |
   | §2.1 | §5.1.11 point functor | named in the gap sentence itself (`README.md:125`) | `gap:animated-flat-cohomology` (PC III §6.0) |
   | §§1.1, 1.4 | §§5.2.1, 5.2.3, 5.2.5 | construction of RΓ_fppf(A,G) by sheafification (2279–2288) | PC III §6.0 |
   | §1.3 | Lemma 5.2.2 | Lemma 5.4.3 (2815) | Purity §3.5 |
   | §1.6 | Corollary 5.2.7 | Theorem 5.3.5 (2449); Lemma 5.4.2 (2711) | PC III `pContinuity`, `excision` |
   | §3.1 | Lemma 5.3.1 | Theorem 5.3.5 (2478) | PC III `pContinuity` |
   | §3.2 | Lemma 5.3.3 | Theorem 5.3.5 (2502); Lemma 5.4.2 (2640, 2775) | PC III `pContinuity`, `excision` |
   | §3.3 | Lemma 5.3.4 | Theorem 5.3.5 (2498); Corollary 5.3.7 (2570) | PC III; Purity §3.4 |
   | §3.4 | Lemma 5.4.1 | Lemma 5.4.2 (2790, 2797) | PC III `excision` |
   | §0.1 | §4.1.5 | Lemma 4.1.6 (1547), used for Theorem 4.1.8 | PC III `perfectDieudonneComparison` |

   The *Needs* line of PC III §6.0 (its README l.126) names no owner for any of them. So either the
   suppliers prove these statements themselves (two owners: line 121 says so and Layers 1–3 plan them
   again) or they must take them from here (a cycle 85 → 257 → 85 that the dependency check cannot
   see, because the earlier roadmap does not cite the later one). Four of the targets, §§0.1, 2.4, 3.2
   and 3.4, are in no *Needs* line of this README: their only consumers are the supplier proofs.

   Repair (ownership moves down to the earliest consumer; all in this package):

   1. Delete §2.4, §3.2 and §3.4 as targets, with their mentions in the Summary, Scope (l.7),
      How to read (l.177), the Layer 3 title, Examples and Dependencies; delete §0.1 likewise, or keep
      only the paragraph on the stages if a consumer in this roadmap is named. Tested: after the
      deletion every remaining target of Layers 1–3 except §1.4 (item 3) is in a *Needs* line of
      Layers 4–6 or of a target that is (§1.2→§1.3→§6.1, §2.1→§2.2→§2.3→§4.3, §1.5→§4.4).
   2. Replace `README.md:121` last sentence by: "The proofs of these two theorems, of
      `gap:animated-flat-cohomology` and of `gap:cohomology-deformation` use the animated point functor
      and Theorem 5.1.13, flat animated maps and Lemma 5.2.2, the tower corollary 5.2.7 and Lemmas
      5.3.1, 5.3.3, 5.3.4 and 5.4.1 of CS24; they are part of those supplier contracts."
   3. For each target that stays because Layers 4–6 use it (§§1.1–1.3, 1.6, 2.1–2.2, 3.1, 3.3), state
      it under "From TauCetiRoadmap.PrismaticCohomologyPartIII" as a contract, one slug per target,
      `Section: §6.0`, the `needs` sentence being the present "Prove/Define" sentence of the target
      and the locator its present locator (for example `gap:tower-accuracy`: the statement of §1.6,
      CS24 Corollary 5.2.7, p.56), add the slugs to `design/plan.json` `gaps`, and cite the slug in the
      consuming *Needs* lines. §1.4 becomes part of the sentence of `gap:animated-flat-cohomology`
      ("on the étale and fppf topologies of animated A-algebras of CS24 §5.2.3"); its restriction
      bullets move to §5.0.
   4. Scope l.7 and Downstream consumers l.759: remove "animated points of ordinary groups and their
      cotangent deformation theory", "derived Beauville–Laszlo glueing" and "perfection across an
      unchanged derived divisor" from what this roadmap owns and exports.

   If the operator prefers the opposite direction (this roadmap owns CS24 §§5.1–5.3 and the flat
   cohomology block of PrismaticCohomologyPartIII §6.0 moves after it), nothing in this package can
   do it: that is a merge-order decision for a human.

2. **F02** (P2) `gap:perfection-covers` does not give the perfection step of §6.2

   Location: `README.md:129`, "For morphisms of 𝔽_p-algebras, perfection preserves faithful flatness
   and ind-fppf maps"; `README.md:745`, "allowing refinement of the cover by its perfection";
   `README.md:747` *Needs* `gap:perfection-covers`.

   Claim: the gap supplies the step of CS24 line 3389 (the perfection A″ of A′ still has
   faithfully flat derived Koszul reduction over the perfect A).

   Witness: there A→A′ is only faithfully flat after /^L(a₁,…,a_r). A=𝔽_p[t^(1/p^∞)], a=t, A′=A×𝔽_p
   (t↦1 on the second factor): A/^Lt→A′/^Lt=A/^Lt×0 is faithfully flat, A→A′ is not flat (𝔽_p is
   t−1-torsion over the domain A). The gap speaks of faithfully flat maps only.

   Repair: drop `gap:perfection-covers` from `README.md:129`, from the §6.2 *Needs*, the Layer 6
   Dependencies and `design/plan.json` (it has no other consumer), and insert in the §6.2 route after
   "allowing refinement of the cover by its perfection": "Since A is perfect, A″=colim_φ A′ is the
   filtered colimit of the A-algebras A′_n, equal to A′ with structure map a↦s(a^(p^n)); A′_n/^L(a_i)
   is A′/^L(a_i^(p^n)) over A/^L(a_i^(p^n))≅A/^L(a_i) through φ_A^n, faithfully flat by §1.3, and a
   filtered colimit of faithfully flat animated modules is faithfully flat." Add "§1.3 flatness after
   a nilpotent thickening" to the §6.2 *Needs*. Tested on the instance: A′_n=A×𝔽_p for every n,
   A″=A×𝔽_p, reduction A/^Lt×0, faithfully flat.

3. **F03** (P2) `gap:torsor-limit-descent` asks for what is provided or not used

   Location: `README.md:105`, "G-torsors, their isomorphisms and every finite diagram of such data
   descend to some finite stage"; consumers `README.md:441, 652, 667, 747`.

   Claim: §§3.1, 5.2, 5.3 and 6.2 need descent of torsors under a flat affine finitely presented,
   possibly noncommutative, group along filtered colimits.

   Witness: the passages the gap cites are limits of cohomology of commutative groups (CS24 lines
   2390, 2470–2471) and descent of an fppf algebra (2417). The first is PurityForFlatCohomology §0.3,
   already cited at `README.md:133` ("colim_λ H^i_fppf(X_λ,G)≃H^i_fppf(X,G)", all i, hence torsors and
   their isomorphisms for commutative G). The second is not about torsors. The only noncommutative
   group in the README, PGL_n in §4.2, is used without limits.

   Repair: delete the gap (README l.105, the four *Needs* lines, three Dependencies paragraphs,
   `design/plan.json`). In the §3.1 route replace "Descend any finite-presentation cover of the final
   colimit to a finite step" by "Descend a faithfully flat finitely presented R̃-algebra S̃ to a flat
   finitely presented R_n-algebra S (SP Tags 05N9 and 02JO, as in §0.1); S is faithfully flat because
   Spec(S⊗R̃)→Spec R̃→Spec R_n is surjective, R_n→R̃ being faithfully flat, and factors through Spec S".
   Tested: R=k algebraically closed, R_n=R̃=k, S=S̃ nonzero of finite type, surjective onto a point.

4. **F04** (P3) "pro-fppf" is given a meaning the cited source does not give it

   Location: `README.md:183`, "A single faithfully flat pro-ppf morphism with this covering condition
   is called pro-fppf … (CS24, §4.1.5, p.37)".

   Witness: CS24 line 1542 defines pro-fppf as pro-ppf and faithfully flat, with no covering condition.
   ⊔_p Spec ℤ_(p)→Spec ℤ is pro-ppf (ℤ_(p)=colim ℤ[1/n], p∤n) and faithfully flat, hence pro-fppf in
   CS24, but no finite union of quasi-compact opens of the source maps onto Spec ℤ, so it is not
   pro-fppf in the README.

   Repair: "A faithfully flat pro-ppf morphism is called pro-fppf; it is a singleton cover when it also
   satisfies the covering condition." Add the instance above as a Check ("pro-fppf, not a cover").

5. **F05** (P3) §0.1 Check asserts "not ind-syntomic" without an argument

   Location: `README.md:203`, "not syntomic, since its fibres … are not complete intersections. It is
   therefore neither ind-fppf nor ind-syntomic".

   Witness: not syntomic does not give not ind-syntomic: the factorization criterion makes a finitely
   presented ind-syntomic algebra a retract of a syntomic one, and the Check gives no reason why such
   a retract is a complete intersection. The Check is a restatement of a claim, not a computation.

   Repair: "It is therefore not ind-fppf, and it is not syntomic; the class of stages contains it as a
   constant system, so its stability is not obtained from the ind-fppf case of PerfectoidQuotientsPartII
   §Q7.3." and in l.185 replace "neither faithfully flat nor syntomic, so the stability of ind-fppf
   and ind-syntomic maps … does not cover it" by "not faithfully flat, so the stability of ind-fppf
   maps … does not cover it". Tested: 𝔽_p[t]→𝔽_p[t,t⁻¹] alone already has empty fibre over t=0.

6. **F06** (P3) supplier sections listed with no consumer; one consumer without its owner

   Location: `README.md:165`, "Layer 0 §§0.1, 0.4–0.6: … ring operations and completion";
   `README.md:745`, "Proposition 2.1.11 (e)" step ("completion to reach perfect A").

   Witness: no *Needs* line cites PerfectoidQuotients §0.5 or §0.6 (only §§0.1, 0.4 at l.733). The
   §6.2 route completes a perfect 𝔽_p-algebra derived I-adically and uses that the result is perfect
   (CS24 line 3376), with no owner in the §6.2 *Needs*.

   Repair: add "PerfectoidQuotients Layer 0 §0.6" to the §6.2 *Needs* and Layer 6 Dependencies if §0.6
   states that the derived I-completion of a perfect 𝔽_p-algebra is a perfect 𝔽_p-algebra; otherwise
   state it as a gap there. Change l.165 to "§§0.1, 0.4, 0.6".

Round 2. Part 1 checks the eleven round-1 findings at this head. Part 2 is the new pass; new
findings are S01–S06. Files reviewed: `packages/SchemeAndStackFoundationsPartII/README.md` (782
lines, all read) and `packages/SchemeAndStackFoundationsPartII/Suggested.lean` (138 lines, all read).

## Part 1 — round-1 findings at this head

| Round-1 id | Status | Repaired passage (README line) and witness |
| --- | --- | --- |
| 1a/F01 (P3) DJ locator for torsor limits | repaired | l.105: "(CS24 Lemma 5.3.1, Claim 5.3.5.3 and Corollary 5.2.10, pp.57–59)"; l.29: "(Gabber's theorem; DJ Theorem 1.1, p.1)". CS24 lines 2378, 2408, 2459 lie on pp.57–59. The locator is right; the gap itself is S03 below. |
| 1a/F02 (P1) unowned Tor spectral sequence | repaired | l.147: "What EnhancedDerivedSheaves must provide (gap:animated-tensor-spectral-sequence) … E²_(s,t)=Tor_s^(π_*A)(π_*N,π_*M)_t ⇒ π_(s+t)(N⊗^L_A M)"; named in §1.2 route and *Needs* (l.255, 257); slug present in `design/plan.json` `gaps` (20 slugs, 20 README lines). |
| 1a/F03 = 1b/F01 (P2) Weil-restriction smoothness asked of a supplier | repaired | l.84–85 rows `TauCeti.Algebra.WeilRestriction.instSmooth` (RingTheory/WeilRestriction/Smooth.lean:60) and `LaurentPolynomial.instSmooth` (Algebra/Polynomial/Laurent/Smooth.lean:35), both found at those lines of the pin; l.123 gap no longer has the smoothness clause; l.89 "It is not part of any supplier gap below." |
| 1b/F02 (P2) stability of pro-ppf stages unowned | repaired | l.185: "This class … is stable under base change along any ring map A→C and under composition"; route l.207 through `ind_iff_exists` (Ind.lean:140) and `ind_of_preIndSpreads` (Ind.lean:186), both at the pin. Instances recomputed: ℤ→ℚ→ℚ[X] gives colim ℤ[1/n][X]; 𝔽_p⊗ℚ=0 flat f.p.; ℤ→𝔽_p not flat. |
| 1b/F03 (P2) converse ind-fppf claim too wide | repaired | l.193: "conversely, if A→A′ is faithfully flat and A′ is a filtered colimit of flat finitely presented A-algebras, then A→A′ is ind-fppf (PerfectoidQuotientsPartII §Q7.3). Here the presentation of A′ is global". §Q7.3 states exactly this (its README l.887–888). |
| 1b/F04 (P3) §4.2 *Needs* listed Kummer | repaired | l.521 has no `fppf_kummer_sequence`; has `henselian_pair_permanence`, `smoothGroup_fppf_etale_comparison`, `finite_pushforward_exact`. Matches CS24 lines 2984–2994. |
| 1b/F05 (P3) page of Corollary 5.6.12 | repaired | l.685: "(CS24, Corollary 5.6.12, p.77)"; CS24 line 3223 is after the p.77 marker (3216). |
| 1b/F06 (P3) invented phrases | repaired | l.315: "the henselization of the pair (A,I) of SchemeAndStackFoundations §0.12, on `TauCeti.Henselization.algebra`"; l.177: "flat cohomology of ordinary algebras on the pinned carriers". |
| 1b/F07 (P3) wrong *Needs* edges, §3.4 route | repaired | l.455, 469, 591 as described; §3.4 route l.481 now follows CS24 lines 2596–2607. Recomputed: A[aⁿ]=A[a] for perfect A since (ax)ⁿ=aⁿxⁿ=0; φ(aⁿA)=a^(pn)A. |
| 1b/F08 (P3) slice comparison attributed to Mathlib | repaired | l.60: "It is only a definition"; l.87 row for `cohomologyPresheafObjIsoOverH` (Over.lean:141, `Sheaf J AddCommGrpCat.{v}` at the pin) with the universe caveat; API bullet l.610. |

No repair introduced a false statement. Two repairs left a consequence that is raised below: the
§0.1 Check added for 1b/F02 asserts "not ind-syntomic" without an argument (S05), and the corrected
locator of 1a/F01 shows that the gap it annotates is not what its consumers use (S03).

## Part 2 — new findings

## Declaration table (Suggested.lean)

| Declaration | Context (own binders; no `variable` block in the file) | README | Values computed | Result |
| --- | --- | --- | --- | --- |
| `pointsAddFunctor` (def, real body) | `{R} [CommRing R] (G)` | §5.0 | trivial G: Hom(R,A) one point, group 0; μ_p, A=𝔽_p: {x^p=1}={1} | determines G(A) |
| `coefficientSheaf` (def, real body) | same | §5.0 | values in `AddCommGrpCat.{u+1}`; sheafification exists for that universe (objects in `Type (u+1)`) | as README |
| `flatCohomology` (def, real body) | `[HasExt.{w} …]` kept in signature | §5.0 | n=0: Hom(ℤ[h_A],G)=G(A); covariant: `opOp ⋙ (yoneda ⋙ …).op ⋙ (extFunctor n).flip.obj` types check | as README |
| `flatCohomology_henselian_invariance` | `(I) [HenselianRing R I] (G) (n)` | §5.2 | (ℤ_p,p), μ_p, p odd: H¹ ℤ/p→0 onto, not injective; H² 0→0; I=0 identity; R=0 all 0; (𝔽_p[[t]],t), α_p: H¹≠0→0, H²=0 | true as typed; equals CS24 Cor. 5.6.9 (line 3190) |
| `IsHenselianNonunitalSubring` (def, real body) | `{B} [CommRing B] (B′)` | Conventions, §5.0 | pℤ_p yes; {0} yes; ℤ⊂ℤ no (2(1+y)=1); 3ℤ_(3): T²−T−3, disc 13, no root, so no; Dorroh: value of f at (1,r) lies in 0⊕B′ and maps injectively to B | equals SP 09XI / BC22 (2.1.1.1) |
| `flatCohomology_algebraization` | `[UniformSpace B] [IsUniformAddGroup B] [IsTopologicalRing B] [HasExt …] (B′) hB′_open hB′_hens hB′_basis (G) (n) (hn)` | §5.3 | discrete B: B′=0, B̂=B, identity; indiscrete B: B′=B forces −1 quasi-invertible, B=0; B=A, B′=I coarse: B̂=A/I, gives §5.2 for n≥2; (ℤ_(3),3ℤ_(3)) excluded by the criterion, where Br(ℤ_(3))[3]≠0=H²(𝔽₃,μ₃) | true as typed; equals CS24 Cor. 5.6.10 (line 3209) and BC22 Thm 2.1.15 (line 458) |

The six elaborated signatures in the worker's `signatures.md` were compared with the README
statements: no binder lost, nothing differs. No padding: three definitions with real bodies, each
needed by a headline, and two headlines. Headlines of the README (l.3): §4.5, §5.2, §5.3, §6.2;
§5.2 and §5.3 are stated, §4.5 and §6.2 are named in the module docstring with the missing carrier.

## Adversarial table (README targets)

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Conventions, V−1 | 𝔽_p: ℤ/p; μ_p | V=σ⁻¹=id, V−1=0, H⁰=H¹=𝔽_p = RΓ(𝔽_p,ℤ/p); V=0, V−1=−1, fibre 0 = RΓ(𝔽_p,μ_p) | consistent with CS24 lines 1495–1500 |
| §0.1 stages | ℤ→ℚ; ℤ→𝔽_p; 𝔽_p→0 | colim ℤ[1/n]; Tor₁=𝔽_p≠0; flat f.p. | holds |
| §1.1–1.2 | A=k⊕k[1], M=k; M=A, N=k[1] | π₁A⊗k=k≠0=π₁M; π₁=k both sides | holds |
| §1.3 | ℤ/4→𝔽₂, M=𝔽₂; ℤ→ℚ | Tor₁=𝔽₂, not flat on both sides; ℤ/2⊗ℚ=0, ℤ/2≠0 | holds; localization excluded |
| §1.5 | I=0; I=(1) | A^h=A; π₀ henselian for (1) forces 0 | holds |
| §2.2–2.3 | μ_p over 𝔽_p; over ℤ | d(x^p−1)=px^(p−1)dx: [𝔽_p→0 𝔽_p]; [ℤ→p ℤ], p null-homotopic | holds |
| §2.4 | μ_p, 𝔽_p[ε]→𝔽_p | fibre 1+ε𝔽_p; μ_p(𝔽_p)=1→Ext¹(C_G,𝔽_p)=𝔽_p not onto | holds, connective only |
| §3.3 | ℤ, p; ℤ/p² | π₁=0, ℤ_p; π₁ tower: two transitions compose to p²=0, lim¹=0, π₀=ℤ/p² | holds |
| §3.4 | a=1; a=0 | both quotients 0; A⊕A[1]≃A′⊕A′[1] gives A≃A′ | holds |
| §4.2 | (ℤ_p,p), μ_p; (ℂ[[t]],t), μ_n | Br(ℤ_p)[p]=0=H²(𝔽_p,μ_p); Pic/n=0, Br=0 both sides | holds; five-lemma chase rechecked |
| §4.6 | ℤ_p, μ_p, p odd; p=2 | μ_p(ℤ/pⁿ)=1+p^(n−1)ℤ/pⁿ, transitions 0, lim¹=0; lim H¹(ℤ/pⁿ)=ℤ/p; (ℤ/2)² generated by −1, 5 | holds; equals CS24 lines 3162–3180 |
| §4.7 | 𝔽_p[[t]] | (1+th₁(t^p))/(1+th₂(t^p))∈𝔽_p[[t^p]] and basis 1,t,…,t^(p−1) give h₁=h₂ | holds, also p=2 |
| §5.1 | (ℤ_(p)^h,p), F=id; F constant | injective into ℤ_p; identity | holds; retraction argument rechecked |
| §5.4 | R=𝔽_p, μ_p | t is a nonzerodivisor in R{t} (flat over R[t]); completion R[[t]][1/t]; Br[p]=ℤ/p both sides | holds |
| §5.5 | I=0; I=(1) | cofibre C with π₀A⊗C=0 has lowest homotopy 0, so A≃A′, U empty; ring 0 | holds |
| §5.6 | I=0; ℤ_(p)^h→ℤ_p, U=D(p) | R≃R′; ℤ/p→ℤ/p | holds |
| §6.1 | A=𝔽_p, I=0, M=A[1]; M=0 | reduction A[1] not flat, excluded; discrete 0 | holds |
| §6.2 | I=(1); empty tuple | both sides 0; fpqc hyperdescent | holds; perfection step is S02 |

## Verified sound

- Declarations read: 6 of 6. Bold or named README targets read: 31 sections (§0.1–§6.2) and 20 gap
  contracts.
- Source locators verified against the cached texts: 34. CS24: §2.3.3 with footnote 13 (line 980,
  p.24), §4.1.2 (1495, p.36), §4.1.5 (1538, p.37), Lemma 4.1.6 (1547), §5.1.11–Remark 5.1.14
  (2149–2192, pp.52–53), §5.2.1 (2200), Lemma 5.2.2 (2216), §5.2.3 (2241), §5.2.5 (2279),
  Corollary 5.2.7 (2345, p.56), Theorem 5.2.8 (2356, p.57), Lemmas 5.3.1, 5.3.3, 5.3.4 (2408–2437,
  p.58), Lemma 5.4.1 (2591, p.62), Lemmas 5.6.2, 5.6.3 (2974, 2982, p.71), 5.6.4 (3000, p.72),
  5.6.5 (3081, p.74), Theorem 5.6.6 (3138, p.75), Example 5.6.7 (3162), Remark 5.6.8 and
  Corollaries 5.6.9, 5.6.10 (3181–3212, p.76), Example 5.6.11 and Corollaries 5.6.12, 5.6.13
  (3217–3254, p.77), Lemma 5.7.1 and Theorem 5.7.2 (3261, 3288, pp.78–81). BC22: §2.1.1 (214, p.5),
  Lemma 2.1.3 (253, p.6), Proposition 2.1.4 and Theorem 2.1.6 (283, 306, pp.7–8), Theorem 2.1.15
  (458, p.11), Corollary 2.3.5(c) (1247, pp.30–31). SP: Tags 09XI (15.11.6), 0G1S (15.11.15, the
  elementwise step of §4.1, inside the range cited by SchemeAndStackFoundations §0.14), 0954
  (47.8.2), 0A6R (47.9.1), 00QO, 07C3, 05N9 (10.127.3, .4, .8), 02JO (10.168.1).
- Pinned declarations: all 31 rows of the Mathlib and Tau Ceti tables found at the stated file and
  line of the pins (including `ind` l.61, its cobase-change instance l.124, `PreIndSpreads` l.173).
  `HenselianRing` at the pin has `jac` and `is_henselian` only, as the README says.
- Sibling citations checked: 46 section or name citations resolved at main, at the open head or in
  the board package; statements read, with their hypotheses, for the ones marked "read" below, the
  rest resolved by heading or name only. SchemeAndStackFoundations on main: §§0.12, 0.14, 0.15, 0.21,
  1.13–1.15, 1.18–1.22, 2.1–2.7, 2.9–2.11, 2.15, 2.22, Layer 4 and the ten named targets (read:
  `henselian_pair_characterisations`, `henselian_pair_permanence`, `henselian_smooth_lifting`,
  `popescu_colimit_of_geometricallyRegular`, `smoothGroup_fppf_etale_comparison`,
  `finite_pushforward_exact`, `gabber_affine_proper_base_change`, §2.5). PerfectoidQuotientsPartII §§Q7.1–Q7.3 (board package; Q7.1 and Q7.3 read).
  PurityForFlatCohomology §§0.2, 0.3, 2.1, 3.2–3.6, 7.10 at its open head (§§0.3, 3.2, 3.3 read).
  PrismaticCohomologyPartIII §6.0 with its three names (read); HeightsRationalPointsAndObstructions §2.6c; DerivedDeRhamCohomology
  §1.22; EnhancedDerivedSheaves E1.3, E2:towers.1, E3.2, E5:animation.1–.4, E5:cotangent-export.1
  and five names; DerivedModuleAlgebra §§0.5, 0.K.1, 0.10–0.13, 1.E.0, 1.1–1.9 and
  `DerivedDeRham.ordinaryQuotientCompletion_of_boundedTorsion` (its §1.5, any f with bounded
  torsion); PerfectoidQuotients §§0.1, 0.4–0.6; ReductiveGroupsPartII RG2.0a.1–.3;
  ArcTopologyAndDescent §§11.2, 11.5, 12.7. The six leads of the worker's `citations.md` all resolve
  (one board package, five names in open roadmap heads).
- Checks: 110 Check bullets and 7 Examples paragraphs read against the statements of their sections;
  the ones recomputed are in the two tables above and in Part 1. None is false; the inference in
  S05 is unsupported.
- Gaps: 20 slugs in the README, the same 20 in `design/plan.json`; none has supplier `none`.
  Raised: S02, S03. The others were read for precision and minimality and not raised.
- Ownership: `roadmaps grep` by object for the CS24 §5.6–5.7 statements, the pro-fppf site and
  the names of `Suggested.lean`; no other roadmap states §§4.1–6.2, and no roadmap or pinned library
  declares `pointsAddFunctor`, `coefficientSheaf`, `flatCohomology` or `IsHenselianNonunitalSubring`.
  The shared ownership found is S01.
- Policy: the pull request changes only `packages/SchemeAndStackFoundationsPartII/`; no `lemma`, no
  `set_option`, no pull-request number or process text in the README or docstrings; imports are
  `Mathlib` and two existing Tau Ceti modules.
- Dependency check output:

```text
depcheck: 237 roadmaps, 2147 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line. It cannot see S01, where the earlier roadmap does not cite the
  later one.
- No suspicious instruction was found in the texts read.

## Not verifiable

- Elaboration of `Suggested.lean`: not run (read-only pass); the worker's elaborated signatures
  were used.
- That `Ext` in `Sheaf (CommAlgCat.fppfTopology R) AddCommGrpCat.{u+1}` computes classical fppf
  cohomology independently of the universe: asserted in §5.0, standard, not checked in Lean.
- Y18, BG80, R70 and C19 locators: not reopened this round; round 1 checked them.
- Whether PerfectoidQuotients §0.6 states perfectness of the derived completion of a perfect ring
  (S06): the section exists; its statement was not read.
- S05: whether the rank-3 algebra is in fact not ind-syntomic was not decided; only the missing
  argument is raised.
- The proofs of the declared supplier gaps: by the brief, not raised.

## Source issues

- **Misprint** in CS24 at §5.2.1, printed page 53: the source says the homotopy of the tensor product with a flat module is given by a single degree of the first factor; it should be the same degree, or π_*, on both sides; affects a stated result.
- **Misprint** in CS24 at Example 5.6.7, printed page 75: the source says the two-case statement is for degrees at least two; it should say degrees at least one, as the displayed cases do; affects nothing.
- **Misprint** in CS24 at proof of Theorem 5.7.2, printed page 79: the source says the fibre satisfies the analogues of the first, second and second displayed identities; it should be the first, second and third; affects the proof.
- **Misprint** in CS24 at proof of Theorem 5.7.2, printed page 81: the source says faithful flatness holds modulo the tuple indexed up to n; it should be indexed up to r, the length of the tuple; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7d09c8df6132f724460d511f7d792ed9de1cf82f", "job": "RT-SchemeAndStackFoundationsPartII~2b", "model": "fable", "worker": "chris-l"} -->
