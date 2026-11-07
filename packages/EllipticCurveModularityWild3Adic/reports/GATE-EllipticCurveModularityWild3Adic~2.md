## H01 (roed-math) — applied differently

The README no longer cites LocalFieldsRamification layer numbers. Each citation now names the pinned Tau Ceti declarations that hold the content, so it reads the same on main and at the head of the open LocalFieldsRamification revision. Old → new, in `TauCetiRoadmap/EllipticCurveModularityWild3Adic/README.md`:

- Scope, line 32: "(TauCetiRoadmap LocalFieldsRamification Layers 0, 2, 3)" → the same material described as already in the library (Tau Ceti `NumberTheory/LocalField`, which realizes the completed LocalFieldsRamification), with a pointer to the supplier contract.
- *From Tau Ceti*, line 73: new bullet with each declaration, its file and the hypotheses used (old Layer 0 → `TauCeti.finiteIntermediateField_isNonarchimedeanLocalField`, `TauCeti.normalizedValuation`, `TauCeti.ramificationIndex`, `TauCeti.IsTotallyRamified`, `TauCeti.inertiaDegree`, `TauCeti.ramificationIndex_mul_inertiaDegree`; old Layer 2 → `TauCeti.IsUnramified`, `TauCeti.unramifiedExtension`, `TauCeti.existsUnique_isUnramified_finrank_eq`, `TauCeti.frobeniusAlgEquiv`, `TauCeti.zpowers_frobeniusAlgEquiv`; old Layer 3 → `TauCeti.IsTotallyRamified.isEisensteinAt_minpoly`, `TauCeti.isTotallyRamified_iff_exists_eisenstein_generator`, `TauCeti.isTotallyRamified_unramifiedExtension_inertiaDegree`, `TauCeti.LocalFieldsRamification.lowerRamificationGroup`, `TauCeti.inertiaSubgroup`, `TauCeti.wildInertiaSubgroup`). The bullet "**LocalFieldsRamification** Layers 0, 2, 3" under *From TauCetiRoadmap on main* (old line 78) is deleted.
- *Needs* of 1.2–1.7 (lines 283, 300, 319, 338, 354, 374) and the Layer W3.1 *Dependencies* (line 584): "LocalFieldsRamification Layer 3" or "Layers 2–3" → the specific declarations above.

Why not cite the revision's structure: at that head (`893faab`, `Completed/LocalFieldsRamification/README.md`) this content is in no layer of the roadmap. Lines 155–260 list it as Tau Ceti declarations under *Exact supplier contracts → From Tau Ceti*. Its new "Layer 0" (line 298, complements on the native carriers) and "Layer 2" (line 475, Hasse–Arf) still exist but hold other content, so "Layer 0" or "Layer 2" would silently point at the wrong material. Citing the revision's subheadings would also make an unmerged revision a dependency. The declaration names cited here are the ones that head lists, and they also resolve on main, where Layers 0, 2 and 3 (main lines 72, 576, 724) are completed and realized by the same Tau Ceti files.

## H02 (roed-math) — disputed

After H01 no citation depends on the revision of LocalFieldsRamification, so it is not a dependency of this roadmap. `grep LocalFieldsRamification` now finds only the roadmap's name, with no layer number, at README lines 32 and 73. Every replacement name elaborates at the PR branch's Tau Ceti pin `a91d3aaf` and is present at the content repository's pin `2fd255d9` (for example `NumberTheory/LocalField/Eisenstein/TotallyRamified.lean:119,180`, `ResidueCorrespondence.lean:164,186`, `RamificationGroup.lean:99,111` at `2fd255d9`). So the roadmap reads the same whether or not the revision merges first, and no merge-order note is needed.

### Pattern search, overlaps and ownership

- Other open revisions of roadmaps this README cites were compared heading by heading against main:
  - ClassFieldTheory: the open revision has the same headings as main; the draft revision keeps §2.6 and Layers 5, 7, 8, 11, 12 under the same titles.
  - ModularCurves: one revision only adds sections, and the other keeps §5C "The twisted curve `Y(ρ)`".
  - ModularForms: the revision rewrites the roadmap, but Layer 4 is still "primitive associates" and Layer 9 is "newform invariants and twists", with §9.2 character twists.
  - InductionRestriction: no layer heading changes.
  - EllipticCurves: no open revision.

  No other cited id changes meaning, and nothing remains under "only an open revision defines".
- Ownership: no new carrier is introduced. The general case of 1.2's new API item (below) is owned here. The open roadmap RamificationOfCompleteDiscretelyValuedFields, read at its head, states integral monogenicity in §3a.1 but not the Eisenstein property of a uniformizer's minimal polynomial. Tau Ceti has that property only for finite residue fields (`TauCeti.IsTotallyRamified.isEisensteinAt_minpoly`).
- The resolver's earlier lead `BarsottiTate.extend_genericFibre` (README line 90) is the named target of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.22 at its head, so no change was made. The re-run resolver reports no unresolved cross-roadmap citations or Lean names. It did not inspect pinned packages on this host, so the Tau Ceti names were checked in Lean as described next.
- Signature check: a temporary block appended to `Suggested.lean` imported the twelve `TauCeti.NumberTheory.LocalField.*` modules and ran `#check @` on the 18 cited Tau Ceti declarations and the 16 declarations of `Suggested.lean`. It also checked by `inferInstance` that `IsSepClosed (AlgebraicClosure ℚ_[3])` and `IsNonarchimedeanLocalField ℚ_[3]` hold. It elaborated with no errors under the permitted build command, and the file was then restored byte for byte.
  - The elaborated types match the README's descriptions: `existsUnique_isUnramified_finrank_eq` carries `[IsSepClosed Ω]` and `f ≠ 0`; `zpowers_frobeniusAlgEquiv` carries `[FiniteDimensional K L] [IsGalois K L] [IsUnramified K L]`; `mem_lowerRamificationGroup_iff` tests `σ • x − x ∈ 𝔪^(i+1)`.
  - `Suggested.lean` is unchanged this round.
- Pins: the PR branch's manifest pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`, while main pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`. Every name added this round exists at both Tau Ceti pins. `TauCeti.algebraicExtensionValuativeRel`, which exists only at `2fd255d9`, is deliberately not cited.

### Sources

The new 1.2 API item cites Serre, *Corps locaux*, Ch. I §6, Prop. 17 by locator; the manifest records Serre as waived, and that status was not reopened. Tau Ceti's own `Eisenstein/TotallyRamified.lean` references the same proposition. No other source was added, and no text is missing.

### Adversarial mathematics: changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 new API item: `R = W(k)[π]`, `E_π` Eisenstein of degree `e`, `G_π(0)` a unit, for every perfect `k` | 1.3: `X³ − 3X² + 3`; 1.4: `X³ − 3X² + 6`; 1.7 at `i = 2`; `e = 1`; `k = 𝔽̄₃` with `π = √3`; non-uniformizer `α/β` of 1.6; imperfect `k = 𝔽₃(t)` | `u³ − 3(u² − 1)`, `G(0) = −1`; `u³ − 3(u² − 2)`, `G(0) = −2`; `π¹² = −3·7⁴`, `G = −7⁴ = −2401` with `3 ∤ 2401`; `e = 1`: `u − ℓ`, `G = 1`; `u² − 3`, `G = 1`; `v₃(α/β) = −1/4`, so it is not integral; for imperfect `k`, `W(k)` does not embed | Agrees with the `G` values stated in 1.3, 1.4 and 1.7; the infinite-residue case is not covered by the Tau Ceti theorem, so it is listed separately | Added the API item; *Needs* cites Tau Ceti only for finite `k` |
| Eisenstein ⇒ totally ramified (1.3, 1.4, 1.6) | `X³ − 3X² + 3`, `X³ − 3X² + 6`, `X³ + 3X² + 3X − 3` | Non-leading coefficients divisible by 3; constant terms `3, 6, −3` not divisible by 9 | `e = 3` and `f = 1` from `e·f = 3` | Citation only |
| `v₃ = v_L/e(L/ℚ₃)` with `v_L(uniformizer) = 1` (`normalizedValuation` sends a uniformizer to `ofAdd 1`) | 1.3 `π`; 1.5 `α/β` | `1/3`; `1/12 = 1/3 − 1/4`, the Check in 1.5 | Agrees | Added the normalization sentence |
| `G₀` = inertia, `G₁` = wild inertia via `lowerRamificationGroup` | Cyclic cubic 1.3; `ℚ₃(√−3)`; `ℚ₃(j)` | `γ₃π − π = π(π − 3)`, so `v_L = 2` and `γ₃ ∈ G₁ \ G₂`; Hilbert gives `d = 2 + 2 = 4 = v₃(81)`, the discriminant stated in 1.3. For `ℚ₃(√−3)`, `v_L(σ√−3 − √−3) = 1`, so `σ ∈ G₀ \ G₁`, `d = 1 = v₃(−12)`. For `ℚ₃(j)`, `G₀ = 1` | Agrees in the wild, tame and unramified cases | Citation only |
| Frobenius generates (`zpowers_frobeniusAlgEquiv`) | `ℚ₃(j)/ℚ₃`; `L = K` | `j³ = −j`, order `2 = f`; trivial group | Agrees | Citation only |
| Unique unramified subextension of degree `f` (`existsUnique_isUnramified_finrank_eq`) | `f = 2` in `Q3bar`; `f = 0` | `ℚ₃(√2) = ℚ₃(√5) = ℚ₃(j)`, since `−2` and `−5` are `≡ 1 mod 3`, hence squares; at `f = 0` the generating polynomial `X − X = 0` gives `ℚ₃`, excluded by `f ≠ 0` | Agrees; junk value excluded | Citation only |
| Totally ramified over the unramified part (`isTotallyRamified_unramifiedExtension_inertiaDegree`) | `F′₋₁` (`e = 3`, `f = 2`); `F′₃` (`e = 12`, `f = 2`) | `[F′ : ℚ₃(j)] = 6/2 = 3 = e` and `24/2 = 12 = e` | Agrees | Citation only |

### Build and gate

- `lake build TauCetiRoadmap.EllipticCurveModularityWild3Adic.Suggested`: Build completed successfully (9096 jobs). The only warnings are the ten expected "declaration uses `sorry`" warnings.
- Commit `e5a4533e` "EllipticCurveModularityWild3Adic: review repairs (cite pinned Tau Ceti local-field declarations instead of LocalFieldsRamification layers)"; not pushed.
- Gate: `gate EllipticCurveModularityWild3Adic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Direction check: `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
