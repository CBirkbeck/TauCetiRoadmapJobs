# GATE-PadicHodgeRegulators~5: answers to the human review of `aada6bb`

One review (CBirkbeck, 2026-11-13T13:12:09Z) with two findings. F02 names two locations (§4.1 and §4.2), and its Sources line asks for a locator check, so it gives three points. Numbering: H01 = F01; H02 = F02 at §4.1; H03 = F02 at §4.2; H04 = F02's Sources line. Repairs are in commit `a63b5f6` on top of `aada6bb`. Only `TauCetiRoadmap/PadicHodgeRegulators/README.md` changed; `Suggested.lean` is unchanged.

Suppliers read at their open heads: SchemeKTheoryOperations at `46fa384` (§7.3a, T1–T8: two conditions, the projective bundle condition and the divisor condition, plus a Gysin criterion for the divisor condition), and KTheoryFiniteLocalFields at `e987a1b` (§1.8: the étale and ℓ-adic instances; the transfer identity i·(c_(i,j)(Nx) − N c_(i,j)(x)) = 0 for 2i−j ≥ 2; the consumer paragraph names this roadmap and says transfer holds only after multiplying by the weight or rationally).

## H01 (CBirkbeck) — applied

`TauCetiRoadmap/PadicHodgeRegulators/README.md` line 237: "define r^et_n … by reduction modulo p^ν, the compatible Soulé classes c_(n,1), and inverse limit" → r^et_n is the p-adic class c_(n,1) of KTheoryFiniteLocalFields §1.8 at Spec F (weight n, cohomological degree 1). On each factor field it is still Soulé's inverse limit, because H¹(F,ℤ_p(n)) → lim_ν H¹(F,μ_(p^ν)^⊗n) is an isomorphism: its kernel is lim¹ of finite H⁰ groups. Line 244, the transfer bullet: "cor ∘ etaleRegulator F' = etaleRegulator F ∘ N" → "n·(etaleRegulator F ∘ N_{F'/F} − cor ∘ etaleRegulator F') = 0; equal after rationalization, and integrally when p∤n, in particular for n = 1". Line 248 cites WeibelChern Proposition 4.4, p.22 (WeibelChern line 979): that proposition holds in every K-degree, so it also covers the Kummer case n = 1, which §1.8's 2i−j ≥ 2 leaves out. All other names and bullets are unchanged.

The Scope sentence (line 7) now says that SchemeKTheoryOperations §7.3a constructs Chern classes and that KTheoryFiniteLocalFields §1.8 states the étale instances. It names the étale regulator as §1.8's p-adic c_(n,1) over fields.

The same defect appeared in three other places, all fixed:
- Line 61, the KTheoryFiniteLocalFields contract: the unqualified "and transfer" now states §1.8's identity with the factor i, for finite separable extensions.
- Line 374, the completed-K₃ contract: "corresponding to corestriction under the Chern isomorphisms" now holds for odd p only; for p = 2 the two maps differ by an element killed by 2, since the weight is 2. Completed K₃(L;ℤ_p) is the limit of the K₃(L;ℤ/p^ν) because the K₄(L;ℤ/p^ν) are finite.
- Line 1237, the *Needs:* of §5.7: "and transfer" → "§1.8 for transfer after rationalization".

No consumer used the integral identity where p | n. §5.7's `localRegulator L ∘ transfer = Tr ∘ localRegulator L'` and §§6.3 and 7.6 are statements after rationalization.

## H02 (CBirkbeck) — applied differently

Line 932: "use universal syntomic Chern classes … through Gillet's formalism" → the classes `c^syn_{i,j}` are the syntomic instance of SchemeKTheoryOperations §7.3a (T1–T3). The theory is the rigid syntomic fibre in every weight i ∈ ℤ, as Zariski sheaves on the smooth R-schemes of finite type, with the products of CohomologyComparisonsPartII §2.3 and a first Chern class whose de Rham component is dlog. The proposed repair, which names only the projective bundle formula as "its condition", is incomplete. §7.3a at `46fa384` has two conditions, the projective bundle condition and the divisor condition. KTheoryFiniteLocalFields §1.8 proves both for the étale theory, and no supplier states either one for rigid syntomic cohomology:
- CohomologyComparisonsPartII §§2.1–2.3 give only the fibre, products and descent.
- Besser2000 computes its universal classes directly, from Grassmannians and rigid purity: Proposition 7.4 and (7.4), lines 802 and 839.

The README therefore states both conditions as proof obligations, each with a route:
- **Projective bundle condition.** ξ = c₁(O(1)) lies in F¹ and φ(ξ) = pξ. So the weight-i fibre of ℙⁿ_X splits as the sum of the weight-(i−a) fibres of X times ξ^a, and the weights i−a ≤ 0 are needed.
- **Divisor condition.** It follows by §7.3a's Gysin criterion. The rigid Gysin isomorphism of PadicDifferentialEquationsAndRigidCohomology §RD.4.40, which is new in the rigid-syntomic supplier contract (line 271), multiplies Frobenius by p. The logarithmic de Rham Gysin map raises F by one. Together they send the weight-(i−1) fibre of D to the weight-i fibre of Y, shifted by two.

The same paragraph keeps the characterisation of the universal classes by their de Rham image. Through Besser2000 (7.4) and Theorem 7.5 it identifies the instance with Besser's classes, which ColemanIntegration §L3.Fb.2 consumes. The ring-homomorphism property of `ch^syn` now also cites §7.3a T8. The *Needs:* lines (946, 1078) and the SchemeKTheoryOperations contract (line 69) were updated to match.

## H03 (CBirkbeck) — applied

Line 960. Old: "the same Chern-class compatibility holds for the Nekovář–Nizioł syntomic regulator: ρ_syn ∘ c^syn_{i,j} = c^et_{i,j}". New:
- `c^et_{i,j}`, with K-degree j, is the p-adic class of KTheoryFiniteLocalFields §1.8 tensored with ℚ_p. In §1.8's cohomological-degree indexing it is written c_(i,2i−j).
- The Nekovář–Nizioł theory is a §7.3a instance on smooth K-varieties. Its projective bundle condition is NN2016 Proposition 5.2 and Remark B.5. Its divisor condition comes from the Gysin morphisms of Proposition B.4(1) by §7.3a's Gysin criterion.
- ρ_syn commutes with products, units and c₁, sending a syntomic class to the Kummer class, in every weight r ≥ 0 (proof of NN2016 Proposition 5.7). So T7 gives ρ_syn ∘ `c^syn_{i,j}` = `c^et_{i,j}`.

The text says that T7's proof uses only nonnegative weights. The reason is that NN2016 defines ρ_syn only for r ≥ 0 (NN2016 line 2323), while a §7.3a theory has all integer weights; T1's uniqueness on a rank-N bundle uses weights 0…N only.

The Spec R comparison in the same paragraph is left as it was. Its target r^et_n is now §1.8's c_(n,1), which equals Huber–Kings' Soulé regulator (HK2011 line 307 to line 315), and HK2011 Proposition 2.3.4 (line 656 to line 680) proves it by carrying universal classes to universal classes.

The same pattern appears in §7.7, line 1580: "compatible Chern classes" → "Chern classes compatible with the p-adic étale ones (§4.2)".

## H04 (CBirkbeck) — answered

The NN2016 §5 locators were checked against arXiv:1309.7620v5, the version the References cite:
- Proposition 5.2: p.55, NN2016 line 2875, in the range 0 ≤ d ≤ r.
- Proposition 5.6: p.57, line 3003.
- Proposition 5.7: p.58, line 3027.
- Proposition B.4 and Remark B.5: p.63, lines 3283 and 3301.
- The étale target of ρ_syn is holim_n RΓ(X_et, ℤ/pⁿ(r)′)_ℚ, line 2579. That is continuous étale cohomology tensored with ℚ, as in §1.8.

The README does not cite Weibel's K-book Chapter V §11 directly. It consumes that material through SchemeKTheoryOperations §7.3a, whose T1–T7 carry the K-book locators (V.11.2.3–V.11.12), so no new source key was needed. The WeibelChern References entry gained "Proposition 4.4, p.22".

## Adversarial pass on the changed statements

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| r^et_n = §1.8's c_(n,1); on a field it is the inverse limit | F=ℚ, n=1, x=−1, p odd and p=2 | p odd: −1=(−1)^(p^ν), so the class is 0 at every level and in the limit, matching §1.8's ℓ-adic Kummer value 0. p=2: −1 is not a square, so the class is nonzero on both sides | holds |
| H¹_cont → lim H¹ injective over fields | F=ℚ_p, n=2 | the kernel is lim¹ of the finite groups H⁰(ℚ_p, μ_(p^ν)^⊗2), which is 0 | holds |
| n·(r(Nx) − cor r(x)) = 0 | F'=F | N=id, cor=id; both sides 0 | holds |
| same | n=1, any finite F'/F | the factor is 1; the integral Kummer–norm identity is WeibelChern Prop 4.4 at i=1 | integral |
| same | p=5, n=2 | 2 ∈ ℤ₅^×, so the identity holds integrally | integral |
| same | p=2, n=2 | only 2·d=0 is asserted; d dies after rationalization | weakened, as the source states it |
| completed-K₃ transfer | p=3; p=2 with K₃(ℚ₂;ℤ₂)=ℤ₂⊕ℤ/8 | p=3: 2 is invertible, so the maps are equal. p=2: d ∈ the 2-torsion {0,4} of ℤ/8 is not excluded, so no equality is claimed | p odd / p=2 split |
| §5.7 transfer, after rationalization | p=2, L'=ℚ₂(i), L=ℚ₂ | a 2-torsion d maps to 0 in H¹(ℚ₂,ℚ₂(2)), so Tr∘λ = λ∘N still holds | consumer unaffected |
| syntomic projective bundle split | X=Spec ℤ_p, ℙ¹, weight 1 | direct: on H², f(a,b)=((1−p⁻¹·p)a, a−b)=(0,a−b), so H²_syn(ℙ¹,1)=ker=ℚ_p and H³=coker=ℚ_p. Split: H⁰_syn(ℤ_p,0)ξ ⊕ H²_syn(ℤ_p,1) = ℚ_p⊕0, and H¹_syn(ℤ_p,0)ξ ⊕ H³_syn(ℤ_p,1) = ℚ_p⊕0 | equal; weight 0 is needed |
| same, wrong model with F^r=0 for r≤0 | as above | H⁰_syn(ℤ_p,0) would be 0, predicting H²_syn(ℙ¹,1)=0, but the direct value is ℚ_p | excluded by "weights i−a ≤ 0 included" |
| syntomic Gysin degree and weight | D⊂Y smooth divisor | (1−p^(−i)φ_Y)ι_* = ι_*(1−p^(−(i−1))φ_D); ι_*F^(i−1) ⊂ F^i; shift [−2] | weight (i−1) → i |
| divisor condition | Y=ℙ¹_X, D=∞ | ι*a=0 forces a=π*y·ξ, so a∪ξ = π*y·ξ² = 0 | holds |
| same | D=∅ | c₁(O_Y)=0 and ι_*1=0 | holds |
| universal syntomic c₁ fixed by its de Rham image | N=1, i=1, K=K₀ | H²_syn(B G_m,1) = {λx₁ : σ(λ)p = p λ} = ℚ_p·x₁; image x₁ excludes −x₁ and 2x₁ | determined |
| c₁ on units fixed by dlog | Spec R vs G_m | on Spec R the dR component is 0. On G_m two lifts of dlog t differ by a class from H⁰(A⊕C), pulled back from R; c₁(1)=0 then forces equality | determined |
| ch = T8 normalisation | i=2, i=3 | T8: ch=−c and ch=c/2; README: (−1)^(i−1)/(i−1)! = −1 and 1/2 | agree |
| c^et_{i,j} = §1.8's c_(i,2i−j) | (i,j)=(n,2n−1); (1,1); (2,3) | gives c_(n,1)=r^et_n, consistent with the Spec R line; c_(1,1)=Kummer; c_(2,1) has source K₃. Misreading it as §1.8's c_(2,3) gives source K₁ and target H³ | index conversion stated |
| T7 for ρ_syn | weights | NN's ρ_syn is defined for r≥0; T1's uniqueness on a rank-N bundle uses weights 0…N | restriction stated |

## Ownership, suppliers and direction

- **New supplier edge.** PadicDifferentialEquationsAndRigidCohomology §RD.4.40 (open, merge-order line 120; this roadmap is line 329), for the rigid Gysin isomorphism. It is cited by roadmap and section only.
- **Ownership of the syntomic instance.** No roadmap states the rigid syntomic theory as an instance of §7.3a. Searches for a syntomic projective bundle formula, Gysin map or Chern classes across main and the open heads found only this roadmap and the Besser-based ColemanIntegration §L3.Fb.2, which consumes Besser's classes. So the syntomic instance stays here, as the review asks.
- **Supplier positions.** SchemeKTheoryOperations (line 37) and KTheoryFiniteLocalFields (line 90) are new-roadmap pull requests earlier in the merge order. Neither is a revision.
- **Open pull requests checked.** Ownership against them was checked only for these suppliers and for syntomic/rigid Gysin and projective-bundle owners, using the roadmap search and show tools.
- `roadmaps resolve` reports only the earlier lead `FontaineBPR1994, §2.1`. That is the manifest key of a source, not a roadmap, so it is a false positive.

## Suggested.lean and signatures

`Suggested.lean` is unchanged: no declaration, import or docstring mentions the étale or syntomic Chern classes. The scratch signatures file holds the elaborated types of the 7 declarations from the unchanged file, and none has lost a section binder. They were compared with the README targets of §§5.5 and 9.1–9.11, which this round did not touch, and nothing changed.

## Build, gate and dependency check

- `lake build TauCetiRoadmap.PadicHodgeRegulators.Suggested`: `Build completed successfully (8976 jobs).` There are three `declaration uses 'sorry'` warnings, at lines 43, 81 and 102.
- Gate (committed state `a63b5f6`): `gate PadicHodgeRegulators: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 222 roadmaps, 1972 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
