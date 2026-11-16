# Review of PELModuliPartII (pull request #2453 at 8a49f22)

**Verdict:** accepted

No finding. Incremental re-review of the 48 lines changed since d85737d.

## Previous findings

- R01 — repaired: §6.5 imposes "the condition of RZ17 (8.2) with φ̄₀ as its distinguished embedding … for every CM type", defines signatures "of Mihatsch type", and §§7.6, 7.9, 9.7 follow it.
- R02 — repaired: §5.4 chooses "δ in O_K̆× with σ(δ)=−(u²/ϖ)δ", with existence by Lang's theorem and the ℚ₃(√−3) instance as a Check.
- R03 — repaired: the contract reads "with p>2 or the extension unramified (for p=2 this is RSZ21 Theorem A.1, p. 37)"; §§7.6 and 7.9 no longer use §0.6.
- R04 — repaired: §3.4 reads "(PaRa09, end of §5.c, p. 39, for even n≥4; at n=2, which PaRa09 §1.b.1 excludes, …)" and References adds "its §1.b.1 assumes n≥3".

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed (both sides) | Result | Change |
| --- | --- | --- | --- | --- |
| §6.5 Eisenstein condition at an inert v₀ | e=3, n=2, Φ_v₀={(σ,1),(σ,2),(σ̄,3)} | r=(1,2,0) on σ, (1,0,2) on σ̄: ranks 3,3. RZ17 (8.1): a·n+1=1·2+1=3. Mih19 Lemma 2.10: (r,6−r), r≤2 | holds | none |
| §6.5 Mihatsch type, both cases | e=3, n=2, Φ_v₀={(σ,1),(σ,2),(σ,3)}; A_ψ̄₀ full; e=1 | ranks 5,1: structural φ̄₀, r=1, ne−r=5, P(1,1). A full: Lie_ψ̄₀ rank n(e−1)+1=ne−r with r=n−1. e=1: both descriptions agree | holds | none |
| §6.5 "holds whenever F⁺_v₀/ℚ_p is unramified" | e=1, f=2; Mih19 line 257 | one embedding above each ψ, condition empty; Ψ₀ is a free choice of half, so Ψ₁={ψ: r=n} is allowed | holds | none |
| §6.5 route (two flat subschemes) | Mihatsch type, banal ψ | A_ψ empty: Q=1, rank 0; A_ψ full: Q is the Eisenstein polynomial, automatic; both models smooth (RZ17 line 1565, Mih19 line 396) | holds | none |
| §5.4 normalization of δ | K=ℚ₃, ϖ=3, u=a√−3; ϖ=u² | σ⟨Πx,y⟩=−(ϖ/u²)⟨Πx,y⟩, same for ⟨x,y⟩; u²/ϖ=−a²≠1; σ(δ)=−δ gives factor −a⁻²≠1; ϖ=u²: factor 1 | holds | none |
| §5.4 trace identity with the new δ | A=⟨Πx,y⟩, B=⟨x,y⟩ | Tr(u⁻¹δ(A+uB))=2δB, independent of the normalization of δ | holds | none |
| gap:unitary-multichain-stabilizer | p=2 unramified, F⁺_v ramified over ℚ₂; p=2 ramified | RSZ21 lines 1944–1951: O_F étale over O_F₀, every p, base field arbitrary; ramified at 2 excluded by §7.2 | holds | none |
| §3.4 chart at n=2 | π-modular hyperbolic plane, h(f₁,f₂)=π, F spanned by f₁+(a+bπ)f₂ | h=π(c̄−c)=−2bπ₀: b=0, block diag(a,a); det(π−u on F)=charpoly(u)=0, wedge automatic; dimension 1=n−1 | holds | none |
| §7.6 smoothness at the distinguished factor | inert v₀, mixed Φ_v₀ above; split v₀ | RSZ21 lines 1410–1412, 1441, 1484–1494: type (c) smooth by RZ17 Lemma 8.6, relative dimension n−1 | holds | none |
| §7.9 inert self-dual and almost self-dual cases | e=3 mixed Φ_v₀; place above 2 | self-dual: type (c), every Φ; almost self-dual: (a″) needs w₀ unramified over p (RSZ21 line 1501), which §7.9 assumes | holds | none |
| §9.7 (sample) | ramified F⁺_v₀, mixed Φ_v₀; Mihatsch type | mixed: ranks (3,3), no P(r,s), identification not asserted; Mihatsch type: P(r,s) and §0.5 apply | holds | none |
| §0.4 last sentence on P(r,s) | K₀=ℚ_p, e=3 | condition on Lie only; matches the global ranks for (5,1), not for (3,3) | holds | none |

The rows for untouched statements stand as in the previous review, of d85737d.

- Source locators checked against the cached texts: 17, in RZ17 (3: lines 1492–1497 on p. 28, line 1565 on p. 30, lines 187–190), RSZ21 (6: lines 1365–1376, 1305–1315, 1410–1412, 1441, 1484–1494, 1944–1973), Mih19 (4: lines 257, 344–350, 363–382, 396–410), Zhang21 (1: lines 1846–1849), LZ22 (1: lines 3560–3565), HLSY23 (1: lines 66–68), PaRa09 (1: lines 343–346). The one seeded target in a changed passage, §9.7, is among them.
- Library declarations: the diff changes no Lean and no library claim; none opened.
- Cross-roadmap citations in changed passages: ReductiveGroupsPartII §RG2.3.5 resolved on main; the README's Layer 7 dependency list agrees with the *Needs:* lines of §§7.1–7.10 after §0.6 was dropped (no §0.x left in them; §0.6 is still consumed by §1.2).
- Gate: every check passes. Dependency check: `depcheck: 262 roadmaps, 2545 edges, 0 problem(s)`. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `TauCetiRoadmap/PELModuliPartII/Suggested.lean` exits 0 with no message; the file is unchanged and declares nothing, so there is no `#check` comparison and no padding.
- Pull request text: title and description agree with this head; the change removes no section, headline or supplier.
- Remarks, no change asked: the step "the conjugate summand is its orthogonal complement" of §§7.6 and 7.9 is carried out in RSZ21 at the proof of Theorem 5.2, p. 24, which the cited proof of Theorem 5.4 invokes and §7.5 cites. The board's plan still records the `needs` of gap:unitary-multichain-stabilizer with "For p>2"; the README sentence is the wider one, and the announcement to ReductiveGroupsPartII should carry it.
- Overlap check: read GrossZagierAndArithmeticHeightsPartII, IgusaVarietiesAndTorsionConcentration, HilbertModularVarietiesAndShimuraCurves, PELModuli, SelmerIwasawaCohomologyPartII, AbelianSchemesAndArithmeticModuli, CrystallineCohomology as in the previous review; the changed passages add no object. GeometricSatakeAndFusionPartII states the Drinfeld model of RZ17 §5, not the Lubin–Tate local model of RZ17 §8 used here. The LTXZZ22 models remain D01. Nothing else shared.
- Source independence: changed passages only; 8 passages compared with 7 sources (RZ17, RSZ21, Mih19, Zhang21, LZ22, HLSY23, PaRa09), none shared beyond formulas; largest share LL22 as in the previous review; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- Zhang21 p. 908 (footnote 3) in the published version (Annals 193) is paywalled; the footnote was read on arXiv v3, p. 32.

## Source issues

- **Gap** in Zhang21 at §7.3, footnote 3 (arXiv v3 p. 32): the source says the absolute and relative Rapoport–Zink spaces coincide by Mihatsch's theorem for the Eisenstein condition of RSZ21 case (2); it should restrict to local CM types whose Lie ranks Mihatsch's signature condition prescribes; affects a stated result.
- **Gap** in LZ22 at §13.1, footnote 5, p. 81: the source says Mihatsch's theorem applies when v₀ is ramified over p because his structural clause specializes to the model's Eisenstein condition; it should restrict to local CM types with Mihatsch's Lie ranks; affects a stated result.

## For the human reviewers

- Licence: RZ96 (Princeton Annals of Mathematics Studies 141) is read from a scan on the author's Bonn page (References entry of `TauCetiRoadmap/PELModuliPartII/README.md`). Whether that copy is licensed for this use is for a human to decide.
