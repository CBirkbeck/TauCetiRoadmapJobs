# FIX-RT-GSp4NonregularModularityLifting~2: red-team round 2 repaired

Reviews settled: RT-GSp4NonregularModularityLifting~2a (six findings) and RT-GSp4NonregularModularityLifting~2b (two findings). Every finding was verified against the sources in the cache, the supplier roadmaps at their current heads through the roadmap service, and by direct computation where the witness is numerical. All eight are applied (one applied differently). Files changed: `packages/GSp4NonregularModularityLifting/README.md`, `design/plan.json` (top-level `gaps` only), `sources.toml`. `Suggested.lean` is unchanged.

## RT-GSp4NonregularModularityLifting~2a/F01 (P1) — applied

Verified: on k² with T=diag(c,c+1), Q=diag(d+1,d) the joint selector is 0, the complement is k², and det(T−c)=det(Q−d)=0, so "on its complement one of them is invertible" is false as a global statement. §1.2 now says the complement is the direct sum of the T-invertible factor and the (T-nilpotent, Q-invertible) factor, with at least one unit difference on each joint local factor and neither operator invertible on the whole complement. The Check was recomputed with the two factors ke₂, ke₁ (the invertible differences act by 1) and the two determinants 0. No other place in the README asserted global complement invertibility (searched "invertible" and "complement").

## RT-GSp4NonregularModularityLifting~2a/F02 (P3) — applied

Verified: ν(zI₄)=z², so π⊗(χ∘ν) has central character ωχ²=ω² when χ²=ω. The third paramodular-contract Check now twists by χ⁻¹∘ν, giving ωχ⁻²=1, with the witness 2·(√2)⁻²=1 at the uniformizer versus 4 for the wrong twist, and notes that χ is trivial on ν(K(ℓⁿ))⊂ℤ_ℓ^×. The contract statement itself (unramified central character) was correct and is unchanged.

## RT-GSp4NonregularModularityLifting~2a/F03 (P2) — applied

Verified at the head of LocalGaloisDeformationRings (service copy, #923): §6.31 "Regularity of the GSp₄ ordinary flag scheme at characteristic-zero points" gives, for a flagged characteristic-zero point, regularity on a unique component of dimension sixteen under purity with distinguished characters, transferred to the image ring when the point is distinguished, resting on §6.29 which is stated for any p; §1.22 gives regularity of pure points away from p; §2.24 gives constancy of the full type (hence conductor) between pure points on a common component lying on no other component. These are the three uses BCGP25 §7 makes (BCGP25 line 7438, line 8078 and line 8082 cite Lemma 6.2.2(3), BCGP21 Lemma 7.1.3 and the conductor). The gap `dyadic-ordinary-local-regularity` is removed from the README and from the plan's `gaps` (19 gaps remain, slugs and `needs` sentences identical between README and plan). The LocalGaloisDeformationRings contract now cites §6.31 (with §6.29), §1.22 and §2.24 and states how §2.24 is applied through the underlying rank-four representation; the eight `*Needs:*`/Dependencies occurrences in §§10.1, 10.5, 10.7, 11.2, 11.4, 11.5 and the Layer 10 and Layer 11 Dependencies lines cite "§§6.29 and 6.31 (ordinary points) and §§1.22 and 2.24 (pure points away from p)". No further comparison was intended, so no replacement gap is declared.

## RT-GSp4NonregularModularityLifting~2a/F04 (P2) — applied

Verified: Yam14 line 1164 defines the scalar operator as the composite θ̃₁∘θ̃ of two projected derivatives (Proposition 3.8), with Fourier multiplier det(Q), quadratic in the index (Q=I gives 1, 2I gives 4 at p=7); H¹_dR has rank four and splits as the rank-two Hodge bundle plus the rank-two unit-root part (Yam14 line 1018), so "Hodge line bundle" was a slip; and Yam14's construction is §3.3 (line 901), not §3.2 (the Gauss–Manin section, line 788). §4.2 step 1 now splits H¹_dR by the rank-two Hodge bundle ℋ, defines a projected derivative, builds θ₁ as one derivative plus the contraction into Sym^(j−k−2)ℋ⊗det²ℋ, and Θ as two projected derivatives followed by the Schur projection onto detᵏ⁺²ℋ (p>3), normalized to multiplier det(Q), with first- and second-order change-of-frame laws (Yam14 Propositions 3.5, 3.7, 3.8). Step 2 now covers the second-order pole cancellation with one Hasse factor. The construction citation and the `sources.toml` Yam14 locator now read §3.3, Propositions 3.5–3.10 and 3.13, pp.17–25. A Check with the values 1, 4 versus 2 was added.

## RT-GSp4NonregularModularityLifting~2a/F05 (P3) — applied

Verified: the bullets "A U₂ prime uses Klingen" and "The pairing constraints involve αδ and βγ" restate the definitions. §0.4 keeps the Q=∅ degenerate Check and replaces the two restatements by three computed ones: at p=11, a=4, q=5 the multiplier at Frob_q is (5⁻¹)⁻³=5³≡4, scalar roots (2,2,2,2) pass and (1,5,3,4) fail through the ratio 5=q; at p=5, Q={11} the diamond group has order 10 and its p-quotient order 5; full level 3 excludes −I₄ (reduces to 2I₄) while level 2 does not. §0.5 keeps the 𝔽₁₃ rejection and replaces the two remaining bullets by the relabelling (2,11,4,9) (paired products 5, 5; plane products 9≠10) and the depth witness x=11 (v₅(10)=1, rejected) versus x=101 (v₅(100)=2, accepted). All values recomputed.

## RT-GSp4NonregularModularityLifting~2a/F06 (P1) — applied

Verified by enumeration over 𝔽₅: for H=⟨A⟩, A=[[0,1],[4,1]] of order six, D=diag(2,1), D∨=diag(1,2), D∨ lies in neither N(H)DH nor HDN(H), for the normalizer in SL₂(𝔽₅) (order 12) and in GL₂(𝔽₅) (order 48); the six conjugates n_jAn_j⁻¹ are the three matrices of the review's table and none is A or A⁻¹; the same holds for the other composition order; and no normalizing element n gives HD∨H=HDH·n or nHDH. The claimed universal normalizer transport at every neat tame level is therefore false. §4.7 now keeps Δ∨=Γ diag(1,p) Γ as a second correspondence, makes the forward and reverse maps on the level/cusp Fourier spaces with their actual tame Hecke and diamond actions, the two-correspondence recurrence, and the deduction of the scalar exclusion from the §0.1 root condition explicit targets and premises of the scalar endpoint; a same-level transport is used only where Γ diag(1,p) Γ=nΓ diag(p,1) Γn⁻¹ is proved (principal level, n=[[0,1],[−1,0]], verified). The level-15 example was added as a negative-control Check, and the Γ(5) Check now says why its transport exists. The round-1 reverse-coset reciprocity is unchanged.

## RT-GSp4NonregularModularityLifting~2b/F01 (P3) — applied

Verified at the head of ShimuraCompactifications (service copy, #1053): the layers are numbered 0–8; 4.2 level maps, 4.3 toroidal Hecke correspondences, 4.9 boundary ideal along refinements, 4.10 cone-system independence, 7.12 logarithmic Kodaira–Spencer with Sym²E≅Ω¹(log D) in the Siegel case, 7.13–7.18 Hodge-line semiampleness through quasi-projectivity. Every "C3.9–C3.10" (2), "C5.12" (3), "C5.13–C5.18" (5), the contract line and "ShimuraCompactifications C5" in §3.1a were replaced by 4.9–4.10, 7.12, 7.13–7.18, "Layer 4, especially 4.2–4.3 and 4.9–4.10; Layer 7, especially 7.12 and 7.13–7.18" and "Layer 7". The resolver reports no ShimuraCompactifications lead. The plan's section-level supplier tags "ShimuraCompactifications:C3/C5" outside the `gaps` list are not editable in this job.

## RT-GSp4NonregularModularityLifting~2b/F02 (P3) — applied

Verified: two "### From TauCetiRoadmap.ModularityAndLanglandsExtensions" headings (lines 76 and 124). The second subsection was deleted and its paragraph (GSp4ClassificationInputs contract, twisted weighted fundamental-lemma hypothesis) appended to the first, which now cites §§3.2, 3.5(vii), 3.9, 3.26 and 3.30, all headings at the supplier's head (#1180).

## Checks

- Elaboration: `lake env lean` on `packages/GSp4NonregularModularityLifting/Suggested.lean` from the content checkout: exit 0, no output. The file declares nothing (module docstring and namespace only), so the `#check @name` signature audit has an empty declaration list; nothing changed in it.
- Worker warning (repair pass): the targeted build reported that `Suggested.lean` imports `Mathlib`, a package designed for the module system, without a `module` header. Repaired in place: the file now begins with `module` followed by `public import Mathlib`, the header form of the most recently merged roadmap on main (`TauCetiRoadmap/CoboundaryExpansion/Suggested.lean`). Nothing else in the file changed; it still has one import, no Tau Ceti module, no `set_option` and no declaration. After the change `lake env lean` on the file again exits 0 with no output, and the dependency check (below) is unchanged.
- Dependency check, complete output, exit 0:

```text
depcheck: 204 roadmaps, 1764 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line.
- Citation resolver: one remaining lead, OrdinaryAutomorphicFormsAndModularityLiftingPartII at README line 13, which is the accepted board design cited as a supplier in earlier rounds and unchanged here; no ShimuraCompactifications lead and no Lean-name lead remain.
- README/plan gap agreement: 19 slugs, identical `needs` sentences, every `gap:` reference in the README resolves to a plan entry.
- No gate failures were listed for this round.

## Adversarial pass on the changed statements

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| §1.2 complement decomposition | k², T=diag(c,c+1), Q=diag(d+1,d) | selector 0; T-invertible factor ke₂ (T−c acts by 1), T-nilpotent Q-invertible factor ke₁ (Q−d acts by 1); det on k²: 0, 0 | agrees; Check rewritten |
| §1.2 local-factor dichotomy | local factor of a finite O-algebra | T−c is a unit iff its residue differs from c, else in the maximal ideal, topologically nilpotent | agrees |
| Paramodular Check | ω(ℓ)=2, χ(ℓ)=√2 | ωχ⁻²=1; ωχ²=4 | agrees |
| §0.4 multiplier/ratio Check | p=11, a=4, q=5; roots (2,2,2,2), (1,5,3,4) | 5³=125≡4; 1·4=4, 5·3=15≡4; ratios {1} vs 5=q | agrees |
| §0.4 diamond cover Check | p=5, x=11 | ord (ℤ/11)^×=10, p-part 5 | agrees |
| §0.4 neatness Check | q=3, 2 | −1≡2 (3); −1≡1 (2) | agrees |
| §0.5 relabel Check | 𝔽₁₃ (2,11,4,9) | 18≡5, 44≡5; 22≡9, 36≡10 | agrees |
| §0.5 depth Check | p=5, N=2; x=11, 101 | v₅(10)=1, v₅(100)=2 | agrees |
| §4.2 scalar multiplier degree | p=7, Q=I, 2I | det 1, 4; one derivative 2 | agrees |
| §4.2 weight bookkeeping | Θ: two derivatives + one Hasse factor; θ₁: one derivative + contraction + Hasse | (k,k)→(k+2+p−1)=(k+p+1); (j,k)→(j+p−1,k+p+1), Sym degree j−k−2 | agrees with Yam14 Propositions 3.10(1a), 3.13(1) |
| §4.7 principal-level transport | w=[[0,1],[−1,0]], D=diag(2,1) over 𝔽₅ | wDw⁻¹=diag(1,2) | agrees |
| §4.7 level-15 Check | H=⟨[[0,1],[4,1]]⟩, D, D∨ over 𝔽₅ | ord A=6; D∨∉N(H)DH, ∉HDN(H) for N in SL₂ (12 elements) and GL₂ (48); conjugates [[0,4],[1,1]], [[3,2],[4,3]], [[4,1],[2,2]] | agrees |
| LGDR §6.31 content vs BCGP25 Lemma 6.2.2 | BCGP25 line 6486–6502 | dimension 16, unique component, (2b) pure + p-distinguished, (3) transfer to R△ when distinguished | agrees |

## For the maintainer

- The supplier gap `dyadic-ordinary-local-regularity` on LocalGaloisDeformationRings no longer exists; nothing outside this package cited it by slug.
- ShimuraCompactifications is cited by its current numbering (Layers 4 and 7). The plan's non-gap supplier tags still use the old "C3/C5" labels and were left untouched, as this job may only edit the plan's `gaps`.
- Ownership against open pull requests was checked through the roadmap service index of 2026-11-04 and the sibling checkouts the brief names; no new target was introduced, so no new ownership question arises.
- No source passage was copied; no text needed fetching, and `needs-references.toml` was not created.
