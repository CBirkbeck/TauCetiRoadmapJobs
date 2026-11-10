# Review of FlagVarieties (pull request #2114 at 2d6cb31)

**Verdict:** needs changes

🤖 Independent AI review. This is an incremental re-review of the 116 lines changed since 8480250 (README +76/−36, `Suggested.lean` docstring only).

All nine findings of the previous review are repaired, the gate passes and the dependency check reports no problem.

Three findings remain:
- R01 comes from a change on main, not from this pull request: since the previous review, ReductiveGroups on main (revised at b06dcdf3) states the theorem of headline 3.
- R02 is a hypothesis that the repair of 0.3 now requires of 4.3.
- R03 is a one-line omission in a Dependencies paragraph.

## R01 (P2) — Headline 3 is now also a target of ReductiveGroups Layer 7 on main, and the README does not say how its variant differs

**Location.** `TauCetiRoadmap/FlagVarieties/README.md:23` and `:252` (the sentence added in this change): "Headline 3 and §§4.1–4.2 hold for every smooth connected affine group over algebraically closed `k` (Milne Theorem 17.16, p.356)". Also `:19`: "FlagVarieties owns the five headline classifications."

**Claim.** ReductiveGroups is this roadmap's supplier. On main it now sets the same theorem, from the same source, as a target of its own Layer 7. So the theorem has two owners, and the Scope section, which is where a kept variant states its difference, does not mention the supplier's statement.

The two statements do differ:
- ReductiveGroups Layer 7 is for a connected reductive `G` over a field, and concludes completeness.
- §§4.1–4.2 are for every smooth connected affine `G` over algebraically closed `k`, on the represented orbit scheme, and also conclude projectivity.

**Witness.** ReductiveGroups README on main, line 2295 (Layer 7, "Parabolic subgroup schemes and Levi decompositions"): "Prove the completeness characterization: a smooth closed subgroup `P` is parabolic exactly when `G/P` is complete (Milne, Definition 17.15 and Theorem 17.16, p. 356)".

**Repair.**
- After README:23 add: "ReductiveGroups Layer 7 (Parabolic subgroup schemes and Levi decompositions) states the completeness characterization for a connected reductive group over a field. §§4.1–4.2 keep the variant without reductivity over algebraically closed `k`, for the orbit scheme representing `G/H`, with projectivity added."
- At README:19 write "FlagVarieties owns headlines 1, 2, 4 and 5 and the variant of headline 3 described below."

Tested on `G = G_a`, which is not reductive: `H = 1` gives `𝔸¹`, not proper, and `1` is not parabolic; `H = G_a` gives a point. ReductiveGroups Layer 7 makes no claim about this `G`, and the kept variant does.

## R02 (P2) — 4.3 applies 0.3 without the smooth-stabilizer hypothesis that 0.3 now assumes

**Location.** `README.md:258`: "For nonempty projective homogeneous X choose x∈X(k), apply 0.3, 4.2 and 3.1, and obtain a G-equivariant k-isomorphism X≅G/P_J with unique J."

**Claim.** After the repair, 0.3 (README:99) assumes that `Stab_G(x)` is smooth, and 4.2 assumes `H` smooth. 4.3 states neither, so as written it covers every projective homogeneous `X` in the sense of the Conventions, and that statement is false. Only headline 4 in the Summary (README:10) carries the hypothesis.

**Witness.** The Check added at README:106: the Frobenius-twisted `SL₂`-action on `ℙ¹` "is homogeneous in the sense of the Conventions … and it is not G-isomorphic to any `G/P_J`". `ℙ¹` is projective.

**Repair.** Begin 4.3 with: "For a nonempty projective homogeneous X whose scheme-theoretic stabilizer at one k-point (equivalently, at every k-point, since the stabilizers are G(k)-conjugate) is smooth, choose x∈X(k), …".

Tested:
- The twisted `ℙ¹` has stabilizer `F⁻¹(B)`, with ideal `(c^p)`, which is not smooth; it is now excluded.
- The standard `ℙ¹` has stabilizer `B`, which is smooth; it gives `G/P_∅`.

## R03 (P3) — Layer 3's Dependencies omit the declaration that 3.1 now starts from

**Location.** `README.md:234`: "Layer 2 classification, `HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq` (…), and `gap:tits-system-of-points` with `TitsSystem.normalizer_subgroupB` (…)."

**Claim.** The existence step of 3.1 (README:202) is now `HopfIdeal.IsParabolicOverAlgClosed.exists_conjugate_le`. Its *Needs:* line (README:220) and supplier row 45 list it, but the layer's Dependencies do not. The Dependencies of Layers 1 and 4 were brought in line with their *Needs:* in this change.

**Witness.** README:220 names `HopfIdeal.IsParabolicOverAlgClosed.exists_conjugate_le` (`Algebra/AlgebraicGroup/Parabolic/Basic.lean`); README:234 does not.

**Repair.** Insert "`HopfIdeal.IsParabolicOverAlgClosed.exists_conjugate_le` (`Algebra/AlgebraicGroup/Parabolic/Basic.lean`)," after "Layer 2 classification," at README:234.

## Previous findings

- R01 — repaired: README:99 "assume H smooth. Establish that H is of finite type and that the orbit map identifies X with the represented fppf quotient G/H"; the two Checks at :106–107 are as proposed. The consequence for 4.3 is R02 above.
- R02 — repaired: `gap:orbit-map-quotient` is gone from the folder; row 53 reads "0.3 proves the quotient-by-stabilizer isomorphism"; 0.3's *Needs:* (:109) is as proposed.
- R03 — repaired: `gap:borel-fixed-point-scheme` is gone; 4.2 (:250–254) uses `Comodule.Corestrict` and `Comodule.exists_fixed_mem_of_isClosed_of_isSolvable`; row 55 and the Layer 4 Dependencies cite them; the two docstring phrases are deleted.
- R04 — repaired: 1.1 (:125–129) says the block-triangular points, the comparison and parabolicity "are pinned" and proves three things; row 51 and *Needs:* carry the five names; 3.1 starts from `exists_conjugate_le`.
- R05 — repaired: 0.2 (:93) constructs `G/N → G/N′`; row 57 reads "Layers 0, 4 and 5"; 4.1's *Needs:* has "0.2's subgroup-induced morphism"; 5.1 and 5.2 reuse it.
- R06 — repaired: the generality sentence is at :23 and :252. Its relation to the supplier's new statement is R01 above.
- R07 — repaired: :123 "The retained flag dimensions are `{j+1 : j ∈ Fin n, j ∉ J}`; the index `j` corresponds to the simple reflection `s_{j+1}`".
- R08 — repaired: :81–82 give `1 + E₂₁ ∈ P_{s₁}(k) ∖ B(k)` over `𝔽̄₂` and the negative control `B(𝔽₂) = U(𝔽₂)`.
- R09 — repaired: rows 47, 48, 51 and 52 name Tau Ceti; rows 49/50 and 52/53 are split; every `**Checks.**` is a bullet list; `standardWeight` and the parabolic type have API lists.

## Verified sound

**Gate.** My run of the brief's gate command at 2d6cb31:

```text
gate FlagVarieties: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

- The dependency check prints `depcheck: 229 roadmaps, 2125 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FlagVarieties'` is empty.
- The pull request's title and description say nothing that this head contradicts.

**Elaboration.** `lake env lean TauCetiRoadmap/FlagVarieties/Suggested.lean` gives three `sorry` warnings (lines 52, 62 and 75) and nothing else.
- The diff of `Suggested.lean` deletes two docstring phrases and touches no statement.
- A scratch file with `#check @name` for the four declarations and 24 cited library names elaborates with no error. The four types equal the worker's signature file and the previous review's, so no binder is lost and nothing changed.
- The one-tactic probe of the previous review stands, since no statement changed.

**Pinned declarations opened for the changed passages.** Tau Ceti is at 2fd255d and Mathlib at 1b1ccf4b; paths are under `TauCeti/`. That makes 12 in all, each elaborated.
- `Comodule.exists_fixed_mem_of_isClosed_of_isSolvable`, `Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/FixedPoint/Existence.lean:73`. It assumes `[IsAlgClosed k]`, `[Algebra.FiniteType k H]`, `[IsReduced H]`, a connected spectrum, solvable `k`-points and `[Module.Finite k M]`. It gives a closed point of a nonempty closed translation-invariant `Z` fixed by every rational translation. A Borel in the sense of `HopfIdeal.IsBorelOverAlgClosed` (`Borel/Basic.lean:148`, minimal among smooth, connected, solvable candidates) meets these hypotheses.
- `Comodule.Corestrict`, `Algebra/Coalgebra/Comodule/Corestrict.lean:73`, along any coalgebra morphism `C →ₗc[R] D`.
- `HopfIdeal.IsParabolicOverAlgClosed.exists_conjugate_le`, `Algebra/AlgebraicGroup/Parabolic/Basic.lean:217`: for parabolic `I` and Borel `J`, `∃ g, I.conjugate g ≤ J`.
- `CommHopfAlgCat.fppfHomogeneousQuotientHomEquiv`, `Fppf/Quotient/Homogeneous/Basic.lean:281`: morphisms out of the quotient sheaf are the maps `f` with `f(g·n) = f(g)` for `n` in the subgroup.
- In `GeneralLinear/Weight/Parabolic/`:
  - `Basic.lean`: `mem_weightParabolicDefiningPointsSubgroup_iff_blockTriangular` (`:280`) and `mem_weightParabolicPoints_iff` (`:314`, `w i < w j → g i j = 0`);
  - `TitsSystem.lean`: `weightParabolicSimple` (`:93`, the adjacent transpositions with `w i.castSucc = w i.succ`) and `standardParabolic_weightParabolicSimple` (`:132`, for antitone `w`);
  - `Borel.lean`: `weightParabolicDefiningHopfIdeal_le_upperTriangular_definingHopfIdeal` (`:113`) and `isParabolicOverAlgClosed_weightParabolicDefiningHopfIdeal` (`:133`).
- `HopfIdeal.le_of_quotientPointsSubgroup_le` (`HopfIdeal/Points/Separation.lean:57`) needs the smaller subgroup reduced. In 4.2 that is the conjugate of `B`, so the step from `g⁻¹B(k)g ⊆ H(k)` to `g⁻¹Bg ⊆ H` is covered.
- `TitsSystem.standardParabolic_eq_of_subgroupB_le` (`GroupTheory/TitsSystem/Parabolic/Classification.lean`), as used in 1.1's second bullet.

**Cross-roadmap citations resolved again**, because main moved to 8101f2c (8 in all):
- ReductiveGroups: Layer 3 (line 1262), 3A.1 (1372: orbit maps `TauCeti.orbitMap` and the stabilizer as a scheme fibre, as row 53 says), Layer 7 (2253), 7C.5 (2455, with the type-A block and Grassmannian maps) and 7b (2608).
- SchubertGeometry S1 (30) and S2 item 3 (42); SchemeAndStackFoundations Layers 0 (585) and 1 (2117).
- The overlap file lists no other pull request that changes this roadmap, no dropped id and no id that only an open revision defines. The worker's `roadmaps resolve` lists nothing.

**Remark on the gaps (no change asked).** ReductiveGroups Layer 7 on main now states two of the three contracts as targets: "Prove that `G/B` is complete" (line 2259) and the Tits system `(G(k), B(k), N(k), S)` (line 2348, `StructureAcceptance.exists_titsSystem_of_isBorel`). `gap:complete-borel-quotient` and `gap:tits-system-of-points` are therefore met in the layer the README names. `gap:standard-parabolic-scheme` (the scheme `P_J` with `P_J(k) = B(k) W_J B(k)`) is still not stated there.

**Seeded sample, where it falls in the changed passages.** Milne2017 is the author-page PDF (cache 503f1a7d); the printed page is the PDF page minus 12.
- **0.3:** Remark 7.14, p.142 (Milne2017 line 6055): the `SL_p` on `PGL_p` example, as the new Check says.
- **0.2 and 5.1:** Proposition 5.22, p.104 (line 4545): a unique equivariant map out of a quotient, determined by an `H`-fixed point.
- **4.1 and 4.2:** Theorem 17.16, p.356 (line 14608), for a connected group variety with no reductivity; Theorem 17.9(a), p.354 (line 14525).
- **0.1, 1.1, 3.1:** no new locator; checked by values below.
- The other sampled sections (2.1, 2.2, 3.2, 4.3, 5.2, 6.1) are unchanged apart from Check formatting; their locators stand as verified in the previous report.

**Adversarial table.** Rows B01–B09 are the statements this change touches, with values computed by hand unless marked as elaborated. Rows A04–A24 are carried from the previous report (PRREVIEW-FlagVarieties~7) for the statements the diff leaves untouched.

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| B01 | 0.1 Checks (README:80–83) | `GL₃` over `𝔽̄₂`, `𝔽₂`, `𝔽₄` | `1+E₂₁` has entry `(2,1) = 1`, so it is not upper triangular; its entries `(3,1)`, `(3,2)` are 0, so it lies in `P_{s₁}`. `#B(𝔽₂) = 1·2³ = 8 = #U(𝔽₂)`; over `𝔽₄`, `diag(a,1,1) ∈ B∖U` | true; the control separates closed-field detection |
| B02 | 0.2 morphism `G/N → G/N′` (:93) | `SL₂`: `(B,G)`, `(B,B)`, `(B,T)` | invariance `g n N′ = g N′` holds for `n ∈ N ⊆ N′`: `ℙ¹ → pt`, and the identity. For `N=B ⊄ N′=T`, `n = u(1)` gives `gnT ≠ gT`, so no map | sound; `N ⊆ N′` is needed and stated |
| B03 | 0.3 with smooth `H` (:99–107) | `SL_p` on `PGL_p`; twisted `SL₂` on `ℙ¹`; `Gₘ` on itself | stabilizers `μ_p` with ideal `(x−1)^p`, `F⁻¹(B)` with ideal `(c^p)`, and `1`. The first two are excluded; the third gives `X ≅ Gₘ/1` | true as repaired |
| B04 | `standardWeight` API and flag dimensions (:123–136) | `n=2`, all four `J` | `(0,−1,−2)`, `(0,0,−1)`, `(0,−1,−1)`, `(0,0,0)`: all antitone; equal adjacent pairs at `∅`, `{0}`, `{1}`, `{0,1}`; `∅` strictly decreasing; `univ` zero. Dimensions `{1,2}`, `{2}`, `{1}`, `∅` | true |
| B05 | 1.1 route through the pinned comparison (:125–129) | `n=1`, `I = (X₁₀)` and `I = ⊥` | `(X₁₀)`: `Q(k) = B(k)`, no simple cell inside, `J = ∅`, weight `(0,−1)` forbids `(1,0)`. `⊥`: `J = {0}`, weight `(0,0)` forbids nothing. `weightParabolicSimple` of `standardWeight J` is `{s_i : i ∈ J}` | sound |
| B06 | 3.1 existence step (:202) | pinned type; `SL₂`, `P = B⁻` | `∃ g, I.conjugate g ≤ J` (elaborated): the conjugate of `P` contains `B`. For `B⁻`, `g = w` | sound; Dependencies omit it (R03) |
| B07 | 4.2 route (:250) | `SL₂`: `H = B`, `G`, `T` | `B`: orbit of `[e₁]` in `P(k²)` is `ℙ¹`, closed, `B(k)` fixes `[e₁]`, `g = 1`. `G`: `M = k`, orbit is the point `P(k)`, `g = 1`. `T`: `SL₂/T` is affine of dimension 2, so the premise fails. A fixed `x = g[m]` gives `g⁻¹ b g ∈ Stab[m] = H(k)`, the stated orientation | sound |
| B08 | generality sentence (:23, :252) | `G_a`; ReductiveGroups Layer 7 on main | `G_a`: `H = 1` (F↔F), `H = G_a` (T↔T). The supplier states the reductive case of the same theorem | true; ownership unstated (R01) |
| B09 | 4.3 after the 0.3 repair (:258) | twisted `SL₂` on `ℙ¹`; standard `ℙ¹` | twisted: projective and homogeneous, stabilizer not smooth, isomorphic to no `G/P_J`. Standard: stabilizer `B`, `G/P_∅` | hypothesis missing in 4.3 (R02) |
| A04 | H1 `exists_unique_standardWeight_eq` | carried from PRREVIEW-FlagVarieties~7, A04 | `n=0`: one `J`, ideal `⊥`. `n=1`: `∅ ↦ (X₁₀)`, `{0} ↦ ⊥`. `F⁻¹(B)` is not reduced and is excluded | true |
| A06 | 2.1 Check, point orders | carried, A06 | `#P_J(𝔽₂) = 8, 24, 24, 168`; `#W_J = 1, 2, 2, 6` | true |
| A07 | 2.2 classification | carried, A07 | `SL₂`: 2 subsets; `GL₃`: 4 subsets | true |
| A08 | 3.1 Check, orientation | carried, A08 | `g e₁ = (1,1,0)`; in characteristic 2, `g⁻¹ e₁ = (1,1,1)` | true |
| A10 | 3.1/3.2 bridge | carried, A10 | `w B w⁻¹ = B⁻ ≠ B`, so `w ∉ N(B) = B` | sound |
| A11 | H2 `conjugate_eq_of_borel_le` | carried, A11 | trivial `G`; constant `S₃` excluded by connectedness; `SL₂ × μ_p` gives `P = Q` | true |
| A12 | H3 `isProper_…_iff_…` | carried, A12 | `SL₂` with `H = B, T, N(T), G, 1`: T↔T, F↔F, F↔F, T↔T, F↔F; `G_a`; `Gₘ/μ_n` | true |
| A13–A14 | 4.1 both paragraphs | carried, A13–A14 | `ℙ¹ → pt` surjective; a proper immersion into a separated target is closed | sound |
| A17 | 5.1, Milne 5.22 | carried, A17 | `B`-fixed points of `G/B` are `{eB}` | true |
| A18 | 5.2 | carried, A18 | `GL₃`: `∅ ⊆ {s₁}` one map; `{s₁} ⊄ {s₂}` none | true |
| A19 | 6.1 models | carried, A19 | `GL₃`: `∅ → {1,2}`, `{s₁} → {2}`, `{s₂} → {1}` | true |
| A23 | the three remaining gaps against the pin | carried, A23; supplier on main read again | none at the pin; two are now stated by ReductiveGroups Layer 7 on main | contracts hold |
| A24 | Layer 4 Examples | carried, A24 | projective; affine of dimension 2; a point | true |

**Headline inventory.** Unchanged from the previous report: headline 1 in its `GL_{n+1}` form, the uniqueness half of headline 2 and headline 3 are stated; the general forms of headlines 1 and 2 and headlines 4 and 5 are not statable without the Tits system on `G(k)` and the scheme `P_J`. The docstring now names only missing carriers.

## Not verifiable

- **Humphreys, *Linear Algebraic Groups*** (GTM 21): paywalled and not in the sources cache; the README cites it by locator only. No changed passage relies on it alone.
- **`design/plan.json`:** none is readable, so the three gap slugs were treated as declared contracts and could not be compared with a plan's `gaps` list.
- **Open pull requests:** ownership was checked against main and the overlap file only; the open heads were not searched again in this incremental round.

## Source issues

- none
