# FIX-DESIGN-CohomologyOfGroups~11

Review settled: `REV-DESIGN-CohomologyOfGroups~10`. It has two findings, both P3. Files edited:
`packages/CohomologyOfGroups/design/README.md` and `packages/CohomologyOfGroups/design/plan.json`.
`packages/CohomologyOfGroups/sources.toml` is unchanged: every new citation is a declaration of
the pinned Mathlib or Tau Ceti, and no literature was added. The design package has no
`Suggested.lean`, so there was nothing to elaborate and no `#check @name` audit to run. The review's
section for the human reviewers lists no finding, and nothing was changed because of it.

## F01 (P3) — applied

Verified at the Tau Ceti pin. `RepresentationTheory/Homological/TateCohomology/Functoriality.lean`
has `TauCeti.TateCohomology.map` (line 249), `mapIso` (262), `map_comp_isoGroupCohomology_hom`
(468; `n : ℕ`, `[NeZero n]`, along `e.symm`) and `map_comp_isoGroupHomology_hom` (491;
`m = −(n+1)`, `[NeZero n]`, along `e`). `…/GroupCohomology/Shapiro.lean:109` has `coindIso_hom` and
`…/GroupHomology/Shapiro.lean:98` has `indIso_inv`. 1.1 had built the Tate map "through the Tate
complex" with no supplier. 1.4, 3.5 and 7.1 used the explicit Shapiro forms without citing them.

Changes (old → new):
- "From Tau Ceti" gains two bullets: Tate functoriality along `e : G ≃* H`, and the explicit
  Shapiro forms.
- 1.1: "through the Tate complex" → `TauCeti.TateCohomology.map` for `e : H ≃* gHg⁻¹`,
  `x ↦ gxg⁻¹`, `φ(m) = g·m`, identified in degrees `≥ 1` and `≤ −2`. Four names are added to
  *Needs:*, and the plan's statement and prerequisites change to match.
- 1.4: route and *Needs:* gain `TauCeti.groupHomology.indIso_inv` and
  `TauCeti.groupCohomology.coindIso_hom`, and so does the plan.

Pattern, repaired in the same way: 3.5's vertex maps and 7.1's route ("corestriction is induced
by the trace") are instantiations of pinned lemmas:
- `TauCeti.groupHomology.indIso_inv_comp_map_counit` (`…/GroupHomology/Shapiro.lean:143`);
- `TauCeti.groupCohomology.map_unit_comp_coindIso_hom` (`…/GroupCohomology/Shapiro.lean:152`);
- `TauCeti.groupCohomology.coindIso_hom_comp_corestriction` (`…/GroupCohomology/Corestriction.lean:149`);
- `TauCeti.groupHomology.transfer_comp_indIso_inv` (`…/GroupHomology/Transfer/Basic.lean:89`).

These are named in the new contract bullet, in the *Needs:* of 3.5 and 7.1 and in the plan.
7.1's homological route is now written out: unit and counit of induction, and the decomposition
of `Res_H Ind_K^G` over `H\G/K ≅ K\G/H`. No other passage builds Tate conjugation; a grep for
"Tate complex" and for `c_g` on `Ĥ` finds only 1.1.

## F02 (P3) — applied

Verified at the Mathlib pin, `RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean`:
- `Rep.FiniteCyclicGroup.groupHomologyIsoEven` (line 85) needs `[NeZero i]` and `Even i`;
- `Rep.FiniteCyclicGroup.groupHomologyIsoOdd` (line 122) needs `Odd i`;
- both need `CommGroup G`, `Fintype G`, `DecidableEq G` and a generator `g`.

Before this round, the plan's 5.4 had no Mathlib prerequisite. Changes (old → new):
- 5.4 *Needs:* "Mathlib `groupHomology` of finite cyclic groups (path)" → the two declaration
  names with the path.
- The plan's 5.4 gains `mathlib:Rep.FiniteCyclicGroup.groupHomologyIsoEven` and
  `mathlib:Rep.FiniteCyclicGroup.groupHomologyIsoOdd`.
- "From Mathlib" gains a bullet stating both isomorphisms. This was not asked for, but every name
  in a *Needs:* line belongs in the contracts.

## Adversarial pass (added or changed statements)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Contract: Tate map along `e : G ≃* H` | compatibility for `e = (x ↦ gxg⁻¹)`, `φ = ρ(g)`; `e = id`, `φ = id`; trivial group; degree range | `g·(x·m) = (gxg⁻¹)·(g·m)`, so the pair is compatible; `map_id` gives the identity; `Ĥⁿ(1, M) = 0` on both sides; cohomology comparison for `n ≥ 1` (`NeZero n`), homology for `m = −(n+1) ≤ −2` | Sound | Bullet added |
| 1.1, Tate conjugation | `S₃ ⊃ A₃`, `g = (12)`, `M = ℤ`, degrees `2, 4, 0, −2`; `g ∈ H` | `Ĥ² = ℤ/3` by `−1` (inversion on `Hom(A₃, ℚ/ℤ)`); `Ĥ⁴ = ℤ/3` by `(−1)² = +1`; `Ĥ⁰ = ℤ/3` by `m ↦ g·m = m`, `+1`; `Ĥ⁻² = H₁(A₃) = A₃` by inversion, `−1`; `e.symm = (y ↦ g⁻¹yg)` is the Conventions' cohomological pair and `e` the homological one; for `g ∈ H`, `Ĥ⁰`: `m ↦ g·m = m` on `M^H`, `Ĥ⁻¹`: `g·m ≡ m` mod `I_H M` | Sound; agrees with Layer 1 Examples (`−1` on `H²`, trivial on `H⁴`) | Text, *Needs:*, plan |
| Contract: explicit Shapiro and the res/cor/transfer forms | `S = G`; `S = 1`; `n = 0` | `S = G`: `Ind = A`, unit `a ↦ 1 ⊗ a` is the identity and Shapiro is the identity; `S = 1`: `Hₙ(G, Ind_1^G A) = Hₙ(1, A) = 0` for `n > 0`, as 1.4's free Check; degree `0`: `H₀(S, A) → H₀(G, Ind A)`, `[a] ↦ [1 ⊗ a]`, and the counit `g ⊗ b ↦ g·b` gives `[b]`, which is the corestriction on coinvariants | Sound | Bullet added |
| 1.4 route | `G = ℤ/2`, `X = G ⊔ pt`, `M = ℤ` | `H₀ = ℤ ⊕ ℤ = ℤ²`, `H₁ = 0 ⊕ ℤ/2`, the Check's values; the explicit forms change no value | Sound | *Needs:*, plan |
| 3.5 vertex maps | `ℤ` on the line, `M = ℤ`; one-vertex tree | edge map `t⁻¹ − 1 = 0` on trivial `ℤ`, so `H₁ = ℤ`, `H₀ = ℤ`; one vertex: corestriction from `G_{v₀} = G` is the identity, as the counit `Ind_G^G Res M = M → M` is | Sound | Route, *Needs:*, plan |
| 7.1 homological route | `G = S₃`, `H = K = ⟨(12)⟩`; the bijection `HgK ↦ Kg⁻¹H`; `K = 1` | two double cosets, sizes `2` and `4`, in both orders; `H ∩ g⁻¹Kg` and `c_{g⁻¹}` from `K ∩ gHg⁻¹` match the Mackey summand `Ind_{H∩g'Kg'⁻¹}^H` for `g' = g⁻¹`; `K = 1`, degree `0`: `tr cor(m) = Σ_{Hx ∈ H\G} [x·m]`, which is the relative transfer `⟦m⟧ ↦ ⟦Σ q⁻¹·m⟧` of `transfer_zero_H0π` | Sound | Route, *Needs:*, plan |
| Contract: finite cyclic homology (F02) | `G = ℤ/n`, `A = ℤ` trivial, `i = 2, 1, 3`; trivial group | even `i`: `ker(N = n) / im(ρ(g) − 1 = 0) = 0`, so `H₂(ℤ/n, ℤ) = 0`; odd `i`: `ker 0 / im n = ℤ/n`, so `H₁ = ℤ/n` and `H₃(ℤ/2, ℤ) = ℤ/2`; `G = 1`: `N = id`, both quotients are `0` | Sound; these are the values of 5.4's first and third Checks | Bullet, *Needs:*, plan |

## Checks run

Dependency check:

```text
candidate: CohomologyOfGroups is not in the merge order yet; checked as if placed after IntegralIwasawaTheoryPartII (the intake inserts it when its design is accepted)
depcheck: 242 roadmaps, 2200 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line.

Other checks:
- **Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean
  name found nowhere. The resolver did not check names outside TauCetiRoadmap. So each of the 12
  library names added this round was grepped at the pins (Tau Ceti `RepresentationTheory/Homological/…`,
  Mathlib `…/GroupHomology/FiniteCyclic.lean`), and each declaration was found in the stated
  namespace.
- **Plan:** `plan.json` parses. It was re-serialised in its own format (a round trip of the
  unchanged file reproduced it byte for byte). Only the statement of 1.1 and the prerequisites
  of 1.1, 1.4, 3.5, 5.4 and 7.1 changed.
- **Suggested.lean:** none at the design stage, so there was no elaboration and no `#check` audit.

## For the maintainer

- No construction moved and no supplier was added. All new citations are pinned Mathlib and Tau
  Ceti declarations, so ownership against open pull requests is unaffected. No id that other
  roadmaps cite changed: 1.1, 1.4, 3.5, 5.4 and 7.1 keep their numbers, names and statements.
- No source text was needed, and `needs-references.toml` was not written.
