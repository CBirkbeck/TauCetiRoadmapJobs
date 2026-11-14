# PKG-SpectralSequencesAndConvergencePartII: package report

Deliverables: `packages/SpectralSequencesAndConvergencePartII/README.md` (from the accepted design,
1821 lines), `Suggested.lean` (234 lines, 2 definitions, 9 theorems), `metadata.toml`
(`topic = "math.KT"`, as the base roadmap's package), `sources.toml` (one `cited_for` entry added).
`design/plan.json` is unchanged: no supplier gap was added or removed; the nineteen gaps on
SpectralSequencesAndConvergence accepted with the design stay as they are, and each is still stated
in the README under *From TauCetiRoadmap.SpectralSequencesAndConvergence*.

## Headline theorems

| Headline (README) | Status | Lean name or what the pins lack |
| --- | --- | --- |
| Acyclic assembly, finite antidiagonals, any abelian category (1.5) | stated | `acyclic_total_of_finite_antidiagonals` |
| Acyclic assembly for `Tot^⊕`, half-plane cases, exact sequential colimits (1.5) | stated | `acyclic_total_of_bounded` |
| Comparison of totals, finite antidiagonals (1.4) | stated | `quasiIso_total_map_of_finite_antidiagonals` |
| Comparison of `Tot^⊕`, half-plane cases (1.4) | stated | `quasiIso_total_map_of_bounded` |
| Horseshoe lemma for injective resolutions of objects (2.1(a)) | stated | `exists_injectiveResolution_horseshoe` |
| `RⁿF` of `rightDerivedFunctorPlus` agrees with `Functor.rightDerived`, natural in the object and in `F` (2.2(i)) | stated | `exists_rightDerivedFunctorPlus_homology_iso_rightDerived` |
| Leray's acyclicity lemma (2.2(v)) | stated | `isIso_rightDerivedFunctorPlusUnit_app_of_isRightAcyclic` (with the definition `IsRightAcyclic`) |
| Grothendieck's composition criterion (3.1) | stated | `isIso_compositionTrans_iff` (with the definition `compositionTrans`) |
| Balancing of Tor (4.1) | stated | `nonempty_tor_iso_tor'` |
| Product totalisation: convergence 1.3(c), comparison and acyclic assembly for `Tot^Π` | not statable | no product total complex of a bicomplex in Mathlib or Tau Ceti; also the lim-acyclic epimorphic tower class of base §7.2 |
| The two spectral sequences of a double complex, second pages and convergence (1.2, 1.3) | not statable | column filtration of a `ℤ × ℤ` total complex as input of Tau Ceti's `CochainComplex.spectralSequence` (Tau Ceti has it only for `down ℕ × down ℕ` homological bicomplexes); convergence structures, limit page and canonical presentation of base §§3.2, 1.4, 5.2 |
| Cartan–Eilenberg resolutions: existence and lifting (2.3) | not statable | not at the pins; a construction of this roadmap whose definition needs the horizontal cycle, boundary and cohomology complexes with inherited augmentations (a heavy definition, kept as a README target) |
| Hypercohomology and hyperhomology spectral sequences (2.4–2.6) | not statable | the items of the two previous rows |
| Composite-functor spectral sequence of a complex, low-degree sequences, naturality in the functors, right exact and mixed variants (3.2–3.4) | not statable | as 2.4–2.6; the edge maps of base §3.6 |
| Universal-coefficient, Künneth and change-of-rings spectral sequences (4.2–4.4) | not statable | as 1.2–1.3 |
| Massey pairings, multiplicative spectral sequences of filtered and double complexes (5.1–5.3) | not statable | bigraded exact couples (StableHomotopyKTheory §7.22) and the exact-couple spectral sequence (base §6.1) are not at the pins |
| Bockstein spectral sequence, higher Bocksteins, limit page and convergence (6.1, 6.2) | not statable | as 5.1, plus base §§1.4, 3.2 |

Each "not statable" claim was checked at the pins: no product total (`grep` for product totals finds
only an unrelated topological `totalProdHomeomorph`); Tau Ceti's `rowFiltration` and
`columnFiltrationSpectralSequence*` take `HomologicalComplex₂ C (down ℕ) (down ℕ)`
(`TauCeti/Algebra/Homology/SpectralSequence/Bicomplex.lean:92`, `:289`, `:446`); no exact couples in
either library; the only "Cartan–Eilenberg" matches in Mathlib are bibliography entries
(`Mathlib/Algebra/Lie/Cochain.lean:30`, `Mathlib/CategoryTheory/SmallObject/Basic.lean:43`).

The horseshoe lemma was added because the accepting review asked that statements about
resolutions, `rightDerivedFunctorPlus` and the two Tor functors not be left out of the package; it is
statable on Mathlib's `InjectiveResolution` and not at the pins (Tau Ceti has only the one-step
injective horseshoe and the finite projective one, plus a private complete-resolution horseshoe in
`TauCeti/Algebra/Homology/GorensteinProjective/Extension.lean`).

## Corrections and changes to the design

1. **Direct-sum hypotheses widened to match the Lean statements (Conventions, 1.3(b), 1.4, 1.5).**
   The design asked for countable coproducts and exact sequential colimits. The proofs use only
   exact sequential colimits and the existence of the direct-sum totals: exhaustiveness of `F_I` on
   `Tot^⊕` holds because a subobject of a coproduct through which every summand inclusion factors is
   everything; base §5.4's gap asks only for exact sequential colimits. README and Lean now both say
   "exact sequential colimits, the direct-sum totals exist (for instance under countable coproducts)".
   The design's route sentence "coproducts commute with sequential colimits" is replaced by that
   argument.
2. **3.1 widened from left exact `F` to additive `F`.** Stacks Lemma 22.1 assumes `F` left exact,
   but neither direction uses it: at an injective complex `J` the units of `R(G ∘ F)` and of `RF`
   are isomorphisms, so `t_J` is invertible exactly when the unit of `RG` at `F(J)` is (Leray, needing
   only `G` left exact); conversely `t` at `I[0]` is the unit of `RG` at `F(I)[0]`. 3.2–3.4 keep left
   exact `F`, `G` (3.3 needs `R⁰F = F`). New Check: `F = − ⊗ ℤ/2`, `G = id`.
3. **2.1(a) split** into (a) objects in any abelian category with both outer resolutions given (no
   enough-injectives hypothesis: the construction lifts only into the given terms; Stacks Lemma 18.9,
   Step 2, line 3436–3448, chooses `I₃` freely) and (a′) complexes with enough injectives.
4. **2.2(i) made precise**: naturality in `F` is the compatibility of the comparison with
   `NatTrans.rightDerivedFunctorPlus` and Mathlib's `NatTrans.rightDerived`, as the Lean states.
5. **`IsRightAcyclic` made a defined notion** (Conventions, 2.2(v)) with an API list and three new
   Checks (separation, the need for left exactness in Leray's lemma, (i) without exactness).
6. **`compositionTrans` defined explicitly** through `Functor.rightDerivedDesc` with its API (defining
   factorisation and uniqueness, naturality).
7. **New negative control, the dual staircase (1.5 Checks, Layer 1 Examples)**: exact columns,
   right half-plane; `Tot^Π` acyclic, `H^1(Tot^⊕) = ℤ`. It pins the direction of the vanishing
   condition in `acyclic_total_of_bounded`.
8. **Second route for the direct-sum comparison (1.4)** through the cone of `Tot(f)` and 1.5, so
   that an implementer of the Lean statement is not blocked behind the base's convergence gaps.
9. Supplier contracts *From Mathlib* now list every native declaration the Lean statements use
   (`HomologicalComplex₂.flipFunctor`, `HomologicalComplex.Acyclic`, `QuasiIso`,
   `CategoryTheory.Functor.rightDerivedDesc`, `CategoryTheory.Functor.mapCochainComplexPlus`,
   `CategoryTheory.NatTrans.rightDerived`, `CategoryTheory.InjectiveResolution`,
   `CochainComplex.single₀`, `ShortComplex.ShortExact`, `ShortComplex.Splitting`, `tensorLeft`,
   `tensorRight`), each checked at the pin. A paragraph in *How to read the build* says what
   `Suggested.lean` states and what it cannot.

Nothing else in the design changed: every target, Check, worked example, gap and locator is kept.

## What the README could not support

Nothing was dropped. The README keeps the design's full scope; what the pins cannot state is listed
above and in the module docstring of `Suggested.lean`.

## Notions moved down from later roadmaps

None. Every supplier named in a *Needs:* line or supplier contract is earlier in the merge order or
on main: SpectralSequencesAndConvergence (order 18, through its nineteen gaps),
StableHomotopyKTheory (main), DerivedModuleAlgebra (main), ArithmeticGaloisDuality (order 62).
ArithmeticStatisticsPartVIII (order 148) is named only in *Scope and ownership* as the owner of a
different object (graded Tor over graded algebras), not consumed.

## Duplication sweep

No removals were needed. Checked by object, not only by name:

- Pins: Mathlib's `Tor.lean` records `Tor ≅ Tor'` as missing and has no balancing; Tau Ceti's
  `ModuleCat/Monoidal/Tor.lean` has flatness and vanishing results, no balancing. No composition
  transformation for `rightDerivedFunctorPlus` (Mathlib's `RightDerived.lean` lists the comparison
  with `Functor.rightDerived` as a TODO at line 39–46). No notion of right acyclic objects. No
  horseshoe for injective resolutions (see above). Tau Ceti's `quasiIso_total_map_of_rows` and
  `quasiIso_totalAugmentation_of_rows` (`TauCeti/Algebra/Homology/TotalComplex.lean:580`, `:596`)
  are the first-quadrant `down ℕ × down ℕ` case; the Lean statements here are on `up ℤ × up ℤ` with
  finite antidiagonals or half-plane bounds (kept variants, said so in *Scope and ownership* and 1.4).
- Roadmaps on main and at the heads of the 466 open roadmap pull requests (`roadmaps grep`):
  no Lean file states `Tor'` balancing, a composition criterion, total-complex acyclicity on `ℤ × ℤ`
  or uses `rightDerivedDesc`; DerivedModuleAlgebra's Lean file states only the first-quadrant second
  page. "Leray's acyclicity theorem" in SchemeAndStackFoundations and DiamondsAndVStacks is the
  Čech theorem for sheaves, a different object. ArithmeticGaloisDuality §D7.1 (object-level
  composite sequence) and CrystallineCohomology (crystalline Leray, citing SchemeAndStackFoundations
  §2.2) own instances, as the design records. No other roadmap names "acyclic assembly", balancing
  of Tor, Cartan–Eilenberg resolutions as targets, or the Bockstein spectral sequence.
- Board packages (`packages/*/README.md`, `packages/*/design/README.md`): no other package plans
  these objects. The base package's README (branch of its package job) keeps the section numbering
  the nineteen gaps cite (§§1.3, 1.4, 2.1, 2.2, 3.1–3.6, 4.3, 5.2–5.4, 6.1–6.3, 7.2, 7.5).
- No declaration of `Suggested.lean` shares a fully qualified name with any readable roadmap: all
  live in `TauCetiRoadmap.SpectralSequencesAndConvergencePartII`.

Ownership against open pull requests was checked through `roadmaps grep`/`roadmaps show` at their
heads; the overlaps file lists no pull request changing this roadmap and no dropped id.

## Binder check

All eleven declarations were put through `#check @name` in one scratch copy of the file and the
elaborated types compared with the README statements. Every binder sits in the declaration's own
signature (the file has no section `variable`s); nothing was lost. Two points recorded: the
`[K.HasTotal (ComplexShape.up ℤ)]` arguments of the finite-antidiagonal theorems are always
satisfiable (finitely many nonzero terms), so they do not narrow the statements; `hS : S.ShortExact`
of the horseshoe is needed (below).

## Adversarial pass

`k` a field; maps are on the actual complexes. Total differential `d₁ + (−1)^p d₂` throughout.

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| `acyclic_total_of_finite_antidiagonals` | zero bicomplex; unit square with identities; `ℤ` at `(0,0)` alone; column `ℤ →(id) ℤ` at `p = 0` | zero: totals `0`. Square: `d⁰(1) = (1,1)`, `d¹(a,b) = −a + b`; `H⁰ = 0`, `H¹ = ℤ(1,1)/ℤ(1,1) = 0`, `H² = ℤ/ℤ = 0`. `ℤ` alone: rows and columns not exact, `H⁰(Tot) = ℤ` (hypothesis fails, conclusion fails). Column of identities: rows not exact, columns exact, `Tot = (ℤ →(+1) ℤ)` acyclic | retain |
| `acyclic_total_of_bounded` | staircase; dual staircase; flip of the staircase | staircase: rows exact, `K^{n−q,q} = 0` for `q > 0`, `Tot^⊕` degree `0 → 1` is `y_p = x_p − (−1)^p x_{p+1}`, bijective on sums, `H = 0`. Dual staircase: columns exact, vanishing only for `p ≪ 0`, `y_p = (−1)^p x_p + x_{p−1}`, functional `(1,−1,−1,1,1,…)` kills the image and is `1` on `e₀`: `H¹(Tot^⊕) = ℤ`, while on products the map is bijective. Flip of the staircase: columns exact, `p ≤ 0`, acyclic as the staircase | hypothesis direction confirmed; dual staircase added as a Check |
| `quasiIso_total_map_of_finite_antidiagonals` | identity; `(ℤ →(×2) ℤ)` in row `0` mapped to `ℤ/2` at `(1,0)`; zero endomorphism of `ℤ` at `(0,0)` | identity: identity on `Tot`. Row map: on row `0`, `H⁰ = 0 → 0`, `H¹ = ℤ/2 → ℤ/2` iso (rows quasi-iso; column `0` is `ℤ → 0`, not), and `Tot` gives `H¹ = ℤ/2` on both sides. Zero map: not a quasi-isomorphism on column `0`, and on `H⁰(Tot) = ℤ` it is `0`, not an isomorphism | retain; row form needed (the second example satisfies only it) |
| `quasiIso_total_map_of_bounded` | projection of the staircase onto its column `0` | every column a quasi-iso (column `0` identity, columns `p ≥ 1` exact to `0`); antidiagonal `0` contains every `D_p`, so the column bound fails; `H⁰(Tot^⊕)`: `0 → ℤ`, not iso. Rows: row `0` maps `(D₀ → O₀)` to `D₀`, `H⁰`: `0 → ℤ`, not a row quasi-iso | the bound is necessary; retain |
| `exists_injectiveResolution_horseshoe` | `0 → ℤ →(×2) ℤ → ℤ/2 → 0`, `I₁ = (ℚ → ℚ/ℤ)`, `I₃ = (ℚ/ℤ →(×2) ℚ/ℤ)`; `S` with `A = C = 0`, `B = ℤ/2` (not exact); zero sequence | middle differential `(u,v) ↦ (u mod ℤ − v, 2v)`, kernel `{(m/2, m/2 mod ℤ)} ≅ ℤ`, surjective, so `H = ℤ` in degree `0`; augmentation `1 ↦ (1/2, 1/2)`, so `2 ↦ (1, 0)` = image of `1 ∈ A`, and projection `1 ↦ 1/2 = ε₃(1)`. Untwisted sum: `H⁰ = ℤ ⊕ ℤ/2`. Non-exact `S`: outer resolutions `0` force `I₂ = 0`, not a resolution of `ℤ/2`, so `hS` is needed. Zero sequence: `I₂ = I₁ ⊕ I₃` | retain; `hS` necessary |
| `IsRightAcyclic` | `F = Hom(ℤ/2, −)` at `ℚ/ℤ`, `ℤ`; `F = − ⊗ ℤ/2` at `ℤ`; zero object | `ℚ/ℤ`: injective, `RⁱF = 0` for `i > 0`, yes (but `R⁰F = ℤ/2`, so a definition including `i = 0` would fail). `ℤ`: `R¹F = Hom(ℤ/2, ℚ/ℤ)/0 = ℤ/2`, no. `− ⊗ ℤ/2` at `ℤ`: `R¹ = H¹(0 → 0) = 0`, yes. Zero: yes | retain; Checks added |
| `exists_rightDerivedFunctorPlus_homology_iso_rightDerived` | `n = 0`, `F = − ⊗ ℤ/2`, `A = ℤ`; `n = 1`, `F = Hom(ℤ/2, −)`, `A = ℤ`; `τ = 2·𝟙`, `τ = 0`, `τ = 𝟙` | `n = 0`: both sides `H⁰(ℚ⊗ℤ/2 → ℚ/ℤ⊗ℤ/2) = 0`, while `F(ℤ) = ℤ/2` (the comparison is with `R⁰F`, not `F`). `n = 1`: both `ℤ/2`. `τ = 2·𝟙`: both sides multiplication by `2` on `ℤ/2`, i.e. `0`; `τ = 0`: `0 = 0`; `τ = 𝟙`: identities | retain; no exactness of `F` needed (Check added) |
| `isIso_rightDerivedFunctorPlusUnit_app_of_isRightAcyclic` | `L` injective complex; `F = Hom(ℤ/2, −)`, `L = (ℚ → ℚ/ℤ)`; `F = − ⊗ ℤ/2`, `L = ℤ[0]` | injective `L`: Mathlib instance gives iso. `Hom(ℤ/2, −)(L) = (0 → ℤ/2)`, `H¹ = ℤ/2 = Ext¹(ℤ/2, ℤ)`, consistent. `− ⊗ ℤ/2`: `ℤ` is right acyclic, unit `ℤ/2[0] → RF(ℤ[0])` with `H⁰` target `0`: not iso, so left exactness is needed | `[PreservesFiniteLimits F]` necessary; Check added |
| `compositionTrans`, `isIso_compositionTrans_iff` | `F = G = Hom(ℤ/2, −)`; `F = id`; `F = − ⊗ ℤ/2`, `G = id`; direction of `t` | first: `F(ℚ/ℤ) = ℤ/2`, `R¹G(ℤ/2) = ℤ/2 ≠ 0`; `R¹(G∘F)(ℚ/ℤ) = Ext¹(ℤ/2, ℚ/ℤ) = 0` vs `H¹(RG(RF(ℚ/ℤ))) = ℤ/2`: both sides of the iff false. `F = id`: both true. Third: every object right acyclic for `id`, `t : RF ⟶ RF ⋙ id` iso: both true. Direction: a left Kan extension has maps out of it, so `R(G∘F) ⟶ RF ⋙ RG` (Stacks's `t`) is the definable one | retain; `F` widened to additive (correction 2) |
| `nonempty_tor_iso_tor'` | `ℤ`, `Tor₁(ℤ/4, ℤ/6)`, `Tor₀`; `R = ℤ/4`, `Tor_n(ℤ/2, ℤ/2)`; the `⋆` category of 4.1; projective `X` | `Tor₁`: `ker(×6 on ℤ/4) = {0,2}`, `ker(×4 on ℤ/6) = {0,3}`, both `ℤ/2`; `Tor₀ = ℤ/2` both. `ℤ/4`: periodic resolution `×2`, both sides `ℤ/2` in every degree. `⋆`: hypothesis holds (`P ⋆ V ≅ V^n`), `Tor₀(X,k) = Tor'₀(X,k) = k` (balance holds) though `X ⋆ k = soc X` has dimension `2`. Projective `X`: `Tor_{n+1} = 0` both sides | retain; balance only, not `Tor₀ = ⊗` |
| 1.3(b) route (exhaustiveness) | `Tot^⊕` of the staircase in degree `0` | `⊕_p D_p` is the join of the partial sums `⊕_{p ≥ −N}`: any subobject containing all `D_p` contains their coproduct | route corrected |
| 3.1 widening | `F = − ⊗ ℤ/2`, `G = id` | above | Check added |
| Conventions: total sign witness (kept) | unit square | `d(1) = (1,1)`, then `(−1, +1)`: `d² = −1 + 1 = 0`; unsigned: `2` | retain |

## Elaboration

`lake env lean packages/SpectralSequencesAndConvergencePartII/Suggested.lean`, run from the content
checkout at the pinned Mathlib (`1b1ccf4b`) and Tau Ceti (`2fd255d9`): exit code 0, **9** warnings
`declaration uses 'sorry'` (one per theorem, lines 73, 87, 102, 118, 138, 163, 181, 211, 225), no
other message. The two definitions (`IsRightAcyclic`, `compositionTrans`) have real bodies and
contain no `sorry`. The file has one `import Mathlib`, no `TauCeti.*` import, no `set_option`.

## Dependency check

```text
depcheck: 242 roadmaps, 2195 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: no cross-roadmap citation and no
Lean name found nowhere.

## Sources

No new source. All eleven works keep their single manifest key; the four settled uncertified works
(weibel1994, mccleary2001, cartan-eilenberg1956, massey1954) are cited by locator only and not
requested. `stacks-05QI` now also lists `Conventions` in `cited_for` (Lemma 16.4, line 2925–2935).
New locators used: stacks-05QI line 3436–3448 (Step 2 of the proof of Lemma 18.9, read: both outer
resolutions are chosen independently there) and stacks-05QI line 2925–2935 (Lemma 16.4, read). No
`needs-references.toml` was written.

## Carried forward for human reviewers

From the accepting review: the four uncertified sources were not available for wording checks, and
`grothendieck1957` is recorded as `operator-local`. No suspicious instruction was found in any
input read.
