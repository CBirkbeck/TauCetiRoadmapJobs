# Review of GeometricSatakeAndFusionPartII (pull request #1836 at 3ef4ea3)

**Verdict:** accepted

Incremental re-review of the 28 lines changed since bb281a2 (14 insertions, 14 deletions, all in `TauCetiRoadmap/GeometricSatakeAndFusionPartII/README.md`; `Suggested.lean` and `metadata.toml` unchanged; nothing changed outside the folder). Both findings of the previous review are repaired, the repairs introduce no new problem, the gate passes at this head, and the dependency check shows no UPWARD, CYCLE or moved line. No finding remains.

## Previous findings

- R01 — repaired: §5.5 (line 929) now reads “Assume p>2 and a connected very special equal-characteristic companion level, in the sense of §5.1, for the standard local abelian-type data; no hypothesis on π₁(G^der) is imposed, since the rank-one comparison of §5.3 runs on the companion of the prime-to-p cover G′.” §5.1 (line 876) states that the companion group of the layer is that of the cover G′ of §1.5 through which §3.1 builds M^can, that the strata are the companion-parahoric orbits on M^can_k agreeing with the G^ad-orbits (KZ line 2130, 2164), and that p∤|π₁(G′^der)| holds by §1.5 (KPZ Proposition 3.2.11(1), line 867). §5.3 (line 909) bounds the kernel of G_α→G′^der inside ker(G′^sc→G′^der). The Layer 5 Examples add the GL₆/μ₃, p=3 instance of the previous report, recomputed below. *Needs:* lines of §§5.1 and 5.3 add §3.1 and §1.5 (both earlier layers; no new supplier).
- R02 — repaired: §0.5 (line 295) now cites DiamondsAndVStacksPartII §D10.15(1) for the uniqueness bullet, §3.2 (line 596) cites §D10.15(2) for the existence and uniqueness of the scheme map M→Gr(d,Λ)_(O_E), naming §1.6 as the discharge of its hypothesis M^v_(GL(Λ),μ_d)=Gr(d,Λ)^♦; D10.15 is added to both *Needs:* lines (307, 602), to the DiamondsAndVStacksPartII supplier contract (line 145) and to the Layer 0 Dependencies (line 337); the Layer 3 Dependencies (line 671) already listed it. The normalization-of-image statement of §3.2 remains this roadmap’s own, as the repair asked.

## Verified sound

**Gate and build.** Re-run at 3ef4ea3: `gate GeometricSatakeAndFusionPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. Dependency check: `depcheck: 239 roadmaps, 2344 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. Merge order: this roadmap at line 199, after GeometricSatakeAndFusion (121), DiamondsAndVStacksPartII (123) and RootSystemsPartII (197). `git diff --stat origin/main...HEAD` outside the folder: empty.

**Lean.** `lake env lean` on `Suggested.lean` (unchanged since bb281a2, 63 lines, module form with `public import Mathlib`): exit 0, no output. The file declares nothing; its docstring lists the headlines and the carrier each lacks (checked in r1 against the pins; nothing changed at the pins: lake-manifest.json still pins Mathlib f6090c7 and TauCeti 358314d). No `#check` was needed: there is no named declaration.

**Changed passages, resolved against the suppliers and sources.**

- DiamondsAndVStacksPartII at its open head (d2165a42), `README.md` lines 1306–1316, D10.15: (1) proper flat normal X, X′ with X^♢≅X′^♢ are isomorphic by a unique isomorphism inducing the given one; (2) for ρ:𝒢↪GL(Λ) extending a Hodge embedding and under the hypothesis M^v_(GL(Λ),μ_d)=Gr(d,Λ)^♢ there is a unique ρ_*:M^loc→Gr(d,Λ)_(O_E) whose diamond is the GS4 §4.18 map; its proof sketch is D10.12 applied to that map, which needs only proper, flat and normal, as §3.2 says. §0.5’s bullet and §3.2’s first sentences state exactly these two items; D10.12 stays cited in both *Needs:* lines for the action, base-change and merely-normal cases.
- §1.6 (line 413) states M^v_(GL(Λ),μ_d) as the diamond of Gr(d,Λ) (SW Proposition 21.6.9, line 7710), so the hypothesis of D10.15(2) is discharged where §3.2 says.
- §1.5 (line 403): (G′,μ′) with the same adjoint pair, p∤|π₁(G′^der)|, G′=∏Res_(K_i/F)H′_i tamely split, E′=E^ad — KPZ Proposition 3.2.11(1)–(4), lines 864–875, hypotheses p>2, abelian type, μ^ad nontrivial on every F-simple factor. §3.1 (line 573) builds M^can=M^pol_(𝒢′,μ′)⊗O_E after discarding μ-trivial factors — KPZ §3.2.12 and (3.2.13), lines 882–889. So “p∤|π₁(G′^der)| by the construction of §1.5” is exactly KPZ 3.2.11(1).
- §5.1’s new sentence: KZ line 2130 (M is a union of Schubert varieties in the affine flag of a group over F_p((t)) attached to the KPZ §3 construction, i.e. to G′) and line 2164 (G^ad-orbits and 𝒢-orbits on M_k agree). The adapter is stated for an abelian-type datum with p>2 and consumed only by §5.5, which is stated for standard data; the μ-nontrivial part of any abelian-type datum with p>2 is itself tame and classical (KPZ Remark 3.1.6, lines 726–729), so §1.5 applies to it as §5.1 claims.
- §5.5 against KZ Proposition 5.2.3 (lines 2179–2183): y∈M^λ(F_q), λ≠μ in Adm(μ)_J; smooth geometrically connected C/F_q, φ:C→M_(F_q), y′∈C(F_q) with φ(y′)=y, φ⁻¹(M^(λ′)) open dense for some λ′≻λ. KZ’s standing hypotheses (§5.1.1, line 2071: p>2, strongly acceptable triple, Definition 4.2.2 lines 1482–1491: Hodge type, G^der a product of restrictions of split groups, Z^c a product of induced tori, very special parahoric) carry no condition on π₁(G^der). Matches the statement as now written.
- §5.3 against KZ proof of Proposition 5.2.3 (line 2179 ff.) and PR §6.a.1 (line 916, the p∤|π₁| hypothesis for the neutral-component identification): the hypothesis is now imposed on G′, where it holds.

**Seeded sample.** Of the fifteen seeded targets only 5.5 falls in the diff; it is re-verified above. The other fourteen (0.1, 0.2, 1.2, 1.4, 1.6, 2.2, 2.3, 2.8, 4.3, 4.10, 6.1, 6.2, 7.8, 8.1) are untouched and were verified at their locators in the previous report (its Verified sound section, which this review carries forward). The three passages that cite the changed sections (§3.1 citing §1.5 and D10.15; §5.2–§5.4 citing §5.1; Layer 5 Examples) were re-read; their statements did not change.

**Ownership and duplication.** The diff introduces no new object: D10.15 is now cited rather than restated (the point of R02), and the GL₆/μ₃ example is a Check-style instance. The r1 ownership search (open pull requests and main, by object) stands; no `Suggested.lean` name can clash since the file declares nothing.

**Declared gaps.** Unchanged: 44 slugs in plan.json and 44 “What X must provide” paragraphs; the diff touches none.

**Adversarial table.** Rows for the changed statements carry computed values; rows for untouched statements are carried from the previous report (PRREVIEW-GeometricSatakeAndFusionPartII~1, Verified sound, 35 rows), which this review cites rather than recomputes.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| §0.5 uniqueness bullet via D10.15(1) | two normal flat projective representatives M, M′ with comparison maps c, c′ to M^v | composite c′⁻¹∘c : M^♢≅M′^♢ over Spd O_E; D10.15(1) hypotheses: proper (projective ✓), flat ✓, normal ✓ ⇒ unique isomorphism inducing it | holds | none |
| §3.2 existence of M→Gr(d,Λ) via D10.15(2) | M normal flat projective with M^♢≅M^v; GL(Λ), μ_d | hypothesis M^v_(GL(Λ),μ_d)=Gr(d,Λ)^♢ = §1.6; D10.15(2) states it for M^loc (reduced special fibre); its proof is D10.12 on the §4.18 map, needing proper+flat+normal only, and D10.12 is in §3.2’s *Needs:* | holds | none |
| §3.2 degenerate instance | G=GL(Λ) itself, μ_d | D10.15’s own example: ρ_* = identity of Gr(d,Λ)_(O_E); normalization of image = identity | holds | none |
| §5.1 companion of G′ | KZ line 2130/2164; datum G=GL₆/μ₃, p=3 | G′=GL₆ (KPZ 3.2.11: same adjoint PGL₆, π₁(SL₆)=1 so 3∤1, E′=Q₃=E^ad); companion over F₃((t)) is GL₆; 𝒢-orbits on M^can_k = G^ad-orbits (KZ 2164) | holds | none |
| §5.3 kernel bound on G′ | root SL₂ ⊂ SL₆=G′^der; SU₃ image at p=3 | ker(SL₂→SL₆)=1 ⊂ ker(G′^sc→G′^der)=1; order 1 divides \|π₁(G′^der)\|=1; SU₃ simply connected, π₁=1, 3∤1 | holds | none |
| §5.5 without π₁ hypothesis | GL₆/μ₃, μ=(1,0⁵), p=3, hyperspecial | \|π₁(SL₆/μ₃)\|=3 (μ₃⊂μ₆), so the old hypothesis fails; KZ Prop. 5.2.3 hypotheses (p>2, strongly acceptable) hold as computed in r1 (Hodge type via Λ³, weights {0,1}; G^der split; hyperspecial ⇒ very special); §5.5 now asserts the curve | holds | none |
| Layer 5 Example, SL₂∩μ₃ | root SL₂ on ⟨e₁,e₂⟩ inside SL₆; ζI₆ with ζ³=1 | ζI₆ fixes e₃ only if ζ=1 ⇒ SL₂∩μ₃=1; rank-one subgroups of SL₆/μ₃ are SL₂ | holds | none |
| Layer 5 Example, μ′ on the standard representation | G′=GL₆, μ′=(1,0⁵) | weights {0,1}: minuscule Hodge embedding; on Λ³ the weights of μ are sums of three distinct coordinates ∈{0,1} | holds | none |
| Remaining 35 rows (Conventions, §§0.4–0.5 Checks, 1.2, 2.1–2.8, 3.4, 3.7, 4.1–4.9, 5.2, 6.5–6.6, 7.x, 7.8, 8.1–8.4) | as in the previous report | as in the previous report, untouched by the diff | holds | none |

**Shape.** The diff keeps the README shape: the four edited sections remain prose with *Needs:* lines; the new example sits in the Layer 5 `### Examples`; no LaTeX, process word, pull-request number or machine path was added (gate forbidden=0, prnum=0, latex=0, private-paths=0).

## Not verifiable

None. Every locator used above was read in the cached texts (KZ, KPZ, SW, PR) and at the DiamondsAndVStacksPartII open head; no source needed fetching.

## Source issues

- none (the five issues recorded in the previous report are unchanged; the passages re-read this round, KZ lines 1482–1491, 2071–2075, 2119–2183 and KPZ lines 710–736, 860–898, contain none).
