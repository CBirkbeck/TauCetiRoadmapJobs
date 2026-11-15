# Review of AlgebraicModularFormsAndSerreWeights (pull request #928 at 8ff864c)

**Verdict:** accepted

No findings. Incremental re-review of the 91 lines changed since `364af81`, and of the pull request's title and description against this head.

## Previous findings

- R01 — repaired: `Suggested.lean:79–85` now reads `∃ (L …) (V : ValuationSubring L) (_ : Algebra O V) (j : ResidueField O →+* ResidueField V), … Function.Injective (algebraMap O V) ∧ …`; no `letI`; gate `statement-hygiene=0`.
- R02 — repaired: `README.md:1096` reads "functoriality of Ext along a nonzero morphism `F_D → F_D^D` from the constant `F`-vector-space scheme over `D` to its Cartier dual (for `F=𝔽₂`, the map `ℤ/2 → μ₂` sending `1` to `−1` …)".
- R03 — repaired, by a different route from the one proposed: the strong q-expansion principle is now §3.15 (`:948`), §2.2 is "Level-one and level-two base change" (`:276`, split out of §1.4), and `:471` no longer needs §3.1. No *Needs:* line names a later layer.
- R04 — repaired: the description's dependency paragraph now lists AutomorphicFormsOnReductiveGroups §§5.8, 7.3, ComplexComparisonPartII §§C−1.2, C0.4, C1.7–C1.9, C2.1–C2.2, C5.6, C6.3–C6.6 and the roadmaps on main by layer.

## Verified sound

| Statement (line) | Instances and computed values | Claim or competing model | Result |
| --- | --- | --- | --- |
| `deligneSerreEigenvalueLifting` (Lean 75), restated | `T=((0,ϖ),(1,0))`: `T e₂=ϖe₁≡0`, `a=0`; `X²−ϖ` irreducible over `K`; `V=O[√ϖ]`, `f′=(√ϖ,1)`: `Tf′=(ϖ,√ϖ)=√ϖ·f′`, `residue b=0=j(0)` | An arbitrary `Algebra O V` is excluded by `algebraMap O V x = algebraMap K L (algebraMap O K x)`; `M=0` makes `f≠0` unsatisfiable | Matches |
| §4.7 dyadic Ext step (README 1096), changed | `p=2`, `F=𝔽₂`: `ℤ/2→μ₂`, `1↦−1`; `−1≠1` in `D`, so nonzero; trivial mod 2; bijective on generic fibres | Coefficient-field map `𝔽_p→F` (identity for `F=𝔽₂`) | Matches the source (journal OCR line 1148, DVI line 978) |
| §2.2 level-one and level-two base change (276), moved from §1.4 | Orders `16=2⁴`, `96=2⁵·3`, `48=2⁴·3`; levels 3, 4 `≤11` so weight one is included; `A` of weight 1 over `𝔽₂`, 2 over `𝔽₃`; `ΔA` in weights 13, 14 | Level one without inverting 2, 3 fails; level two needs only 2 | Matches Katz Thms 1.8.1, 1.8.2, Remark 1.8.2.2 (lines 544–593) |
| §3.15 strong q-expansion principle (948), moved from §2.2 | `k=1`: only `p=2`; `K=𝔽₂`, `n=3`: `A` has weight 1 and expansion 1, and 2 is not injective on `𝔽₂`. `k=4`: `p∈{2,3,5}`, excluding `A` over `𝔽₅` | Dropping the injectivity hypothesis: refuted by `A` | Matches Katz Thm 1.12.1, Cor. 1.12.2 (lines 800, 845) |
| §7.3 theta twist (1551), moved from §3.3 | `Δ` mod 5: `a₂=−24≡1`, `θΔ` eigenvalue `2·1=2`; weight `12+6=18`; determinant `ℓ^17≡ℓ` and `ℓ^11·ℓ²=ℓ^13≡ℓ` mod 5 | Inverse twist `χ̄_p⁻¹`: determinant `ℓ^(k−3)` against `ℓ^(k+1)`; equal iff `ℓ⁴≡1`, which fails at `p=7`, `ℓ=3` (`81≡4`) | Matches Edixhoven 3.1 (DVI lines 260–267) |
| §3.9 Hasse sequence equivariance (781), moved from §2.11 | `p=2,N=5,ℓ=3`: one supersingular point, `dim SS_k=1`; `0→ω^(k−1)→ω^k→ω^k|_Z→0` | §3.9 needs §2.11 and §3.1 (both earlier); §2.11 no longer needs §3.1 | Matches |
| Layer order (98, all *Needs:* lines) | Every `§a.b` in a *Needs:* line compared with its section: 0 with a later layer; within a layer `2.2→2.3`, `2.3→2.4`, `2.6→2.8` | "The seven layers are in build order" | Matches |

The rows for untouched statements stand as in the previous review, of `364af81`.

- **Gate.** Run on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. Dependency check: `depcheck: 247 roadmaps, 2243 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/Suggested.lean`: exit 0, seven `declaration uses 'sorry'` warnings (lines 51, 75, 101, 130, 142, 155, 186), nothing else. The elaborated type of `deligneSerreEigenvalueLifting` is `∃ L V x j, … Function.Injective ⇑(algebraMap O ↥V) …` with the base change over `↥V`; it keeps the DVR, fraction-field, finite and free binders that README §5.10 names. The other six declarations are unchanged.
- **Sources checked (changed passages).** Katz 1973 lines 526–542 (Thm 1.7.1, p. 85), 544–593 (Thms 1.8.1, 1.8.2, diagram (1.8.2.1), Remark 1.8.2.2, pp. 85–87), 800 and 845 (Thm 1.12.1 p. 94, Cor. 1.12.2 p. 95); Edixhoven author DVI lines 244–267 (3.1, pp. 7–8) and 978; `edixhoven1992` journal scan lines 1143–1149 (end of §8.3). No target of the seeded sample has changed text. All locators the diff adds or moves are supported.
- **Cross-roadmap citations.** No open roadmap or roadmap on main cites this roadmap's §1.4, §2.2, §2.11 or §3.3 for the content that moved (searched every open head and main for `AlgebraicModularFormsAndSerreWeights` with a Layer 1–3 section number: §§2.1, 2.5, 2.9, 2.12, 2.16, 3.1–3.5, 3.8, 3.12 only). Layer 2 and Layer 3 numbering is otherwise unchanged; §3.15 is new.
- **Pull request text.** Title, summary block and prose agree with the head: the folder is new on the base, seven `sorry`'d theorems, and the dependency paragraph matches the sections the README cites (checked supplier by supplier against the README). The re-arrangement of §§1.4, 2.2, 3.15 changes nothing the text describes.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the roadmap folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- **Overlap check:** read SerreWeightAndLevelOptimisation, ClassicalSerreModularity, EllipticCurveModularity, AutomorphicGaloisRepresentations, GL2ModularityLiftingPartII (open) and ModularForms (main); nothing shared. No open pull request changes this roadmap or drops an id it cites.
- **Source independence:** changed passages only: 5 passages compared with 2 sources (Katz 1973 pp. 85–87, 94–95; Edixhoven DVI pp. 7–8 and the end of §8.3, journal p. 589); none shared beyond the forced "functoriality of Ext". Largest share Katz 1973, as in the previous review. Contents not compared again: no layer was added, removed or reordered.
- **Remarks (no change asked).** §2.2 needs the later §2.3 within Layer 2, as §2.3 needs §2.4 and §2.6 needs §2.8. The §3.3 locator line (`:663`) gives the same Edixhoven locator twice.

## Not verifiable

- The sub- and superscripts of the morphism at the end of Edixhoven §8.3: the OCR of both cached copies drops them; the previous review read them from the page image, and this review relied on that reading.

## Source issues

- none

## For the human reviewers

- none
