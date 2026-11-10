# Repair of StackPointsAndResidualGerbes (design, round 6)

Findings of `reports/REV-DESIGN-StackPointsAndResidualGerbes~5.md` (one P2, six P3). All seven were
verified against the pins, the supplier READMEs on main (`4ec889e`) and the sources, and all seven
are applied. Files edited: `packages/StackPointsAndResidualGerbes/design/README.md`,
`packages/StackPointsAndResidualGerbes/design/plan.json`, `packages/StackPointsAndResidualGerbes/sources.toml`.

## R01 (P2) — applied

Old: regularity of schemes from SchemeAndStackFoundations §4.13; the gap asked for it. New: "From
Tau Ceti" lists `IsRegular` (Scheme.lean:68, extends `IsLocallyNoetherian`), `.of_smooth` (:90),
`.of_flat_of_surjective` (Descent.lean:56, target locally Noetherian); 0.1, its API bullet, Layer 0
Dependencies, Scope and `plan.json` 0.1 cite them; the gap keeps only reducedness over an arbitrary
base and algebraic spaces.

One correction to the suggested text: smooth locality of reducedness for spaces is Lemma 74.9.5
(0GB3), not 74.9.2/74.9.4, which are flat descent. The pinned Noetherian case of reducedness ascent
(Mathlib `GeometricallyReduced.isReduced_of_flat_of_isLocallyNoetherian`, Tau Ceti
`Smooth.geometricallyReduced`) is now named too.

## R02 (P3) — applied

Old: `test_BG_representations` (Convention 9, §1.22 contract), `test_real_points` (1.2 Check),
`points.test_no_residue_field` (4.2 Check), `Stacks.StackInGroupoids` (§1.18 contract). New: "the
Check of §1.22 that `QCoh(BG)` is the category of `O(G)`-comodules", "the Check of §1.21 that
`B(ℤ/2)(ℝ)` has two isomorphism classes", "the Check of §1.7 on the generic point of `𝔸¹_ℚ/ℤ`",
*StackInGroupoids*.

## R03 (P3) — applied

Old: 7.4 *Needs:* ReductiveGroups Layer 3A; plan 7.4 and the suppliers entry list Layer 3A. New: the 7.4
route proves closedness (base change of `x` is the orbit map; `|V| → |[V/G]|` is open and surjective)
and `W = V ×_{[V/G]} 𝒵_x` smooth, hence reduced, hence `W = G·x`. The ReductiveGroups contract says
Layer 3A (over `k̄`) is not an input. Layer 7 Dependencies now name ReductiveGroups Layer 3 (via its gap).

## R04 (P3) — applied

Old: "`ℐ_𝒵 := ker(O_𝒳 → i_* O_𝒵)`" with no category stated. New: kernel of the unit
`O_𝒳 → i_* O_𝒵` in `Stacks.QCoh 𝒳` (§1.22's *QCoh.pushforward*; Lemma 96.15.1 (1)–(3)), the
`R`-invariant ideal of `U ×_𝒳 𝒵` on a presentation. The fppf-module kernel is not quasi-coherent.
Images and powers are taken in `QCoh`. New 0.4 Check and plan test `kernel_in_QCoh` for the
`𝔸¹`/origin instance.

## R05 (P3) — applied

Old: "(with 4.1, 4.3)". New: each case is now justified. A quasi-separated stack is decent (5.1) and
has quasi-compact inertia (4.3). A locally Noetherian stack is covered by 4.4, and a finite type point
by 4.1. 5.3 *Needs:* gains 4.1, 4.3, 4.4 and gap:stack-separation-axioms. The same pattern: the
functoriality bullet used 3.5, which was not in *Needs:*, so 3.5 is added too. In `plan.json`, 5.3
has the matching prerequisites and the gap's `neededBy` gains 5.3.

## R06 (P3) — applied

Old: "the residual gerbe at `x` exists" as a hypothesis, automatic only for `𝒳` locally of finite
type. New: for every algebraic stack with `p ∘ x = id`, `x` is locally of finite type by Lemma
101.17.8 (stacks-06RD lines 1527–1528), so `𝒵_x` exists by 4.1. The closed-immersion clause needs
`𝒳` locally Noetherian and `x` closed (4.5). New Check and plan test `nonFiniteType`.

## R07 (P3) — applied

Old: "`R_x → Spec k ×_S Spec k`". New: "`(t, s) : R_x → Spec k × Spec k` (the absolute product,
Convention 1)", noting that for any scheme `B` under `𝒳` both maps factor through the monomorphism
`Spec k ×_B Spec k → Spec k × Spec k`, so the pullback does not change. `×_S` occurred nowhere
else; `plan.json` 6.1 had no `S`.

## Checks

**Dependency gate** (the command of the brief, run after the last edit):

```
candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
depcheck: 234 roadmaps, 2112 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Citations** (`roadmaps resolve` on the edited README, main `4ec889e` and 435 open heads): no
cross-roadmap citation and no Lean name found nowhere. The resolver did not check names outside
TauCetiRoadmap ("no pinned Lake packages on this host"). So each newly cited library declaration
was opened at the pins:

- Tau Ceti `2fd255d9`:
  - `TauCeti.AlgebraicGeometry.IsRegular`, `Scheme/Regular/Scheme.lean:68`
  - `TauCeti.AlgebraicGeometry.IsRegular.of_smooth`, `:90`
  - `TauCeti.AlgebraicGeometry.IsRegular.of_flat_of_surjective`, `Scheme/Regular/Descent.lean:56`
  - `TauCeti.AlgebraicGeometry.Smooth.geometricallyReduced`,
    `Morphisms/Smooth/GeometricallyReduced.lean:56` (inside `namespace TauCeti`, then
    `namespace AlgebraicGeometry`)
- Mathlib `1b1ccf4b`: `AlgebraicGeometry.GeometricallyReduced.isReduced_of_flat_of_isLocallyNoetherian`,
  `Geometrically/Reduced.lean:109`

The newly cited supplier names are on main:

- SchemeAndStackFoundations §1.20: `.baseChangeImage` and `.atlasOpenSurjective` (lines 2964–2967),
  and the atlas independence of locally Noetherian stacks (2987–2989)
- SchemeAndStackFoundations §1.22: *QCoh.pushforward* (3099–3100)
- SchemeAndStackFoundations §4.13: says regular schemes are Tau Ceti's (5947–5951)
- ReductiveGroups Layer 3A: over an algebraically closed field (1360–1367)

**Shape.** 38 subsections against 38 plan targets. There are 133 Checks against 133 plan tests,
equal for every target (131 + 2 new: 0.4, 6.4). The README and plan have the same 16 gap slugs. Each
gap's `neededBy` equals the set of subsections that cite it and the targets that list it as a
prerequisite (checked by script). The seventeenth README slug, `zero-dimensional-dm-residual-gerbes`,
belongs to FunctionFieldArithmeticPartII, as before. There are no LaTeX delimiters, process words or
machine paths. The five lines over 110 characters were there before this round.

**Lean.** At the design stage there is no `Suggested.lean`, so the `#check` scratch comparison does
not apply. The brief names no Lean command, so nothing was elaborated.

## Sources

Three Stacks Project chapters were fetched through the sources service to verify the lemma numbers
of the narrowed gap. All three are certified open-repository copies, recorded in `sources.toml` with
authors, title, year, tag locator and `cited_for`, and listed in the README's References:

- `stacks-descent`: Descent. Lemma 35.18.1 (034E) at line 2277, 35.18.4 (036D) at line 2306, 35.19.1
  (06QM) at lines 2320–2321.
- `stacks-spaces-descent`: Descent and Algebraic Spaces. Lemmas 74.9.2 (06MI) at lines 424–425,
  74.9.4 (06MK) at 442–443, 74.9.5 (0GB3) at 451–452.
- `stacks-spaces-over-fields`: Algebraic Spaces over Fields. Lemma 72.16.1 (06M1) at lines 1213–1214.

The service reordered one existing line (`version_note` of `sga3-vi-a`) within its own table, which
changes nothing. No `needs-references.toml` was written: nothing is missing.

## Adversarial pass (every statement added or changed)

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| Tau Ceti regularity makes regularity of schemes smooth local (R01) | `Spec k`; `U = Spec k[x,y]/(xy)`, `V = U × 𝔸¹ → U`; `V = 𝔸¹ → Spec k` | field: local, domain, PID, so `𝔪/𝔪² = 0`, dim `0 = 0`, regular; node: dim 1, embedding dim 2, not regular; `V` at `(0,0,0)`: dim 2, embedding dim 3, not regular, as descent predicts; `𝔸¹` regular so `Spec k` regular (target locally Noetherian by §1.20 atlas independence) | holds; target-Noetherian hypothesis recorded |
| Pinned reducedness ascent only over locally Noetherian base (R01) | `X = U/G` of Example 100.11.6 with `U = Spec(ℚ̄ ⊗_ℚ ℚ̄)`; `Bμ_p` atlas `𝔾_m` | `|U|` ≅ `Gal(ℚ̄/ℚ)`, infinitely many primes in dimension 0, not Noetherian, so the pinned lemma does not reach 0.5's `R ×_U Z`; `𝔾_m` over `𝔽_p` Noetherian, pinned case suffices there | general clause stays in the gap |
| Narrowed gap: lemma numbers | Descent 35.18.1/35.18.4/35.19.1; Spaces 74.9.2/74.9.4/74.9.5; 72.16.1 | read at the lines above; 74.9.2 and 74.9.4 are flat descent, smooth locality of reducedness on spaces is 74.9.5 | 74.9.5 added |
| R02 replacements | the four supplier Checks / names | §1.22 line 3111 comodules; §1.21 line 3084 `H¹(ℝ, ℤ/2) = ℝ^×/ℝ^{×2}`, 2 classes; §1.7 line 2330 generic point of `𝔸¹_ℚ/ℤ`; §1.18 line 2851 *StackInGroupoids* | resolve; Convention 9 and the 1.2 and 4.2 Checks unchanged |
| 7.4 route without Layer 3A (R03) | `GLₙ` on `𝔸ⁿ` at 0; `𝔾_m` on `𝔾_m`, `t·x = t^p x`, over `𝔽_p(s)` at 1; `𝔾_m` on `𝔸¹` at 1 | `W = {0} = Spec k`, `N = kⁿ`; orbit `= V`, `G_x = μ_p`, `W = V` smooth, `N = T_V/T_V = 0` though `dπ = 0`; orbit `𝔾_m` not closed, preimage of the point not closed, point not closed | holds; base change of `G·x` to `k̄` is the Layer 3A orbit because `W` is smooth, hence geometrically reduced |
| 0.4 kernel in `QCoh` (R04) | `𝔸¹_k`, origin; `T = Spec k` at 0; `(t²)`; `Spec k[ε]` | fppf kernel: `(t)` on `𝔸¹`, `0` on `T`; `(t) ⊗_{k[t]} k = k`, so not cartesian; `QCoh` kernel value `k·t → k` is `0`, `x^*ℐ → O_T` zero, `T` factors through `V(ℐ)`; `(t²)` ideal of `Spec k[t]/(t²)`; `ℐ = (ε)`, `ℐ² = 0` | holds; new Check |
| 0.4 images and powers in `QCoh` | `ℐ·O_𝒴` for `f = id_{𝔸¹}`, `ℐ = (t)` | Mod-image on `T = Spec k` at 0 is `0`, `QCoh`-image is `(t)` with value `k·t` | wording fixed to `QCoh` |
| 5.3 existence cases (R05) | `[𝔸¹/𝔾_m]`; `Bℤ`; `Spec ℚ(t)/ℤ`; `U/G` | affine diagonal, quasi-separated, decent, `𝒵_0 = B𝔾_m`, `κ = k`; diagonal pulls back to `⊔_ℤ Spec k`, not qc, case not claimed; locally Noetherian, not decent (`⊔_ℤ Spec ℚ(t)` not qc), excluded; `U ×_X Spec ℚ̄ = G × Spec ℚ̄` infinite discrete, not decent, excluded | holds; no cycle (4.1, 4.3, 4.4 do not use Layer 5) |
| 6.4 existence without finiteness (R06) | `Spec k[x₀, x₁, …]` at 0; `[Spec k[x₀,…]/𝔾_m]` at 0; `Spec κ`, `k/κ` finite nontrivial; `U/G` over `ℚ̄` | closed immersion, finite type, ideal not finitely generated, so lft not lfp; `𝒵 = Spec k = BG_x`; `G_x = 𝔾_m`, `𝒵 = B𝔾_m`; no section, `𝒵 = Spec κ ≠ Spec k`; on `U/G` the section `x` gives `𝒵_x = Spec ℚ̄ = BG_x` at the unique, closed point, but `Spec ℚ̄ → X` is not a closed immersion: `X` is reduced with one point, so a closed immersion onto it would be an isomorphism (0.5), and `x` is not one (0.2 Check). So the locally Noetherian hypothesis of the closed-immersion clause is needed | holds; new Check |
| 6.1 stabilizer over the absolute product (R07) | `BG_k` trivial torsor; `Spec κ`, `k/κ` finite Galois | `(t,s)` factors through `Δ`, pullback `G`; `(k ⊗_κ k) ⊗_{k ⊗_ℤ k} k = k`, trivial group | holds |

## For the maintainer

- No name that another roadmap cites changed: no roadmap cites StackPointsAndResidualGerbes, and no
  section, target or proposed name was renumbered or removed.
- Ownership: this round adds no object. Regular schemes now go to the pinned Tau Ceti, as the
  supplier's §4.13 on main does. Layer 3A drops out of the ReductiveGroups supplier sections.
  Ownership against open pull requests was checked through `scratch/overlaps.md`: no open pull
  request changes this roadmap or drops an id it cites.
- gap:reduced-regular-smooth-local is narrower. If SchemeAndStackFoundations §4.13 (or a Tau Ceti
  bump) later supplies smooth locality of reducedness over a non-Noetherian base and the
  algebraic-space statements, the gap closes.
- The review said reducedness has "no pinned counterpart". That is too strong: the locally Noetherian
  case of smooth ascent is at the pins (named above). The general case and flat descent are not, so
  the clause stays.
- Nothing read this round asked for any action.
