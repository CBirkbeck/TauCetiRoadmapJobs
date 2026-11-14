# PORT-SpectralSequencesAndConvergencePartII

## Result

- Branch: `roadmap/spectral-sequences-and-convergence-part-ii`, from `e1cd6a5`.
- Head commit: `3d767c25` "SpectralSequencesAndConvergencePartII: roadmap (README, Suggested.lean, metadata)".
- Files: `TauCetiRoadmap/SpectralSequencesAndConvergencePartII/{README.md,Suggested.lean,metadata.toml}`.
  Nothing outside the folder was touched.
- Build: `lake build TauCetiRoadmap.SpectralSequencesAndConvergencePartII.Suggested` ends with
  `Build completed successfully (18239 jobs).` There are 11 warnings, all
  `declaration uses 'sorry'` (lines 77, 91, 106, 122, 142, 160, 184, 222, 240, 270, 284), and no
  other warning.
- Gate, on the committed tree:
  `gate SpectralSequencesAndConvergencePartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`), full output:

  ```text
  depcheck: 243 roadmaps, 2197 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the ported README: no cross-roadmap citation and no Lean name found
  nowhere. Library names were checked by hand at the pins (below).

## Draft pull request body

This roadmap is Part II of SpectralSequencesAndConvergence. That roadmap stops at the general
language of convergence over an abelian category: limit pages, convergence structures, the
comparison theorem, the spectral sequence of a filtered complex and of an exact couple, and
complete convergence in replete categories. Part II uses that language to build the standard
spectral sequences of homological algebra and to prove that they converge. It covers:

- the two spectral sequences of a `ℤ × ℤ` double complex, for both the direct-sum and the
  product totalisation, with the finite and half-plane convergence theorems, the acyclic assembly
  lemma and the comparison of totals;
- horseshoe and Cartan–Eilenberg resolutions;
- the comparison of Mathlib's `rightDerivedFunctorPlus` with the classical `rightDerived`, and
  Leray's acyclicity lemma;
- the two hypercohomology spectral sequences of an additive functor, with their hyperhomology and
  contravariant duals;
- Grothendieck's criterion for composing right derived functors on `D⁺`, and the composite-functor
  spectral sequence of a complex with its low-degree sequences;
- over rings: the balancing of Tor, and the universal-coefficient, Künneth and change-of-rings
  spectral sequences;
- Massey's pairings of exact couples, with the multiplicative structure of the spectral sequences
  of filtered and double complexes;
- the Bockstein spectral sequence of an `f`-torsion-free complex, with its higher Bocksteins,
  limit page and convergence.

These are the spectral sequences that the arithmetic, topological and sheaf-theoretic roadmaps
otherwise each build for themselves. A single general construction lets each of them cite one
owner.

`Suggested.lean` states the nine headline theorems whose carriers exist at the pins, with the two
small definitions they need: acyclic assembly and comparison of totals for `Tot^⊕` (finite and
half-plane cases); the horseshoe lemma for objects and for bounded-below complexes, and its
relative form; the comparison of the two right derived functors; Leray's lemma; Grothendieck's
criterion (`compositionTrans`, `IsRightAcyclic`); and Tor balancing. Its module docstring names
the headlines that are not statable at the pins and the carrier each lacks: the product total
complex, the column filtration of a `ℤ × ℤ` total complex, the convergence structures,
Cartan–Eilenberg resolutions, and exact couples.

## Roadmaps this one depends on that are still pull requests

- **SpectralSequencesAndConvergence**: the base. Its §§1.2–1.4, 2.1, 2.2, 3.1–3.6, 4.3, 4.6,
  5.1–5.4, 6.1–6.3, 7.2, 7.4 and 7.5 are suppliers, each with a contract bullet. It is earlier in
  the merge order.
- **ArithmeticGaloisDuality**: §D7.1, the target *Derived composite spectral sequence*. It is
  compared with 3.2–3.3 for the edge maps, and is earlier in the merge order.

Some open roadmaps are named only as instances in Examples, Checks or Scope, and supply nothing:
SchemeKTheoryOperations §6.7 and ArithmeticLocallySymmetricSpaces ALS.1.7 (both earlier). One
open roadmap is named as a scope boundary: ArithmeticStatisticsPartVIII §5.16, which is later in
the merge order and is not a supplier.

The downstream consumers are named but do not supply anything:
- open: InverseGaloisAndArithmeticFundamentalGroupsPartII, K3BlochGroups,
  EtaleDualityAndPerverseSheaves, TorsionCohomologyInfrastructure,
  HilbertModularVarietiesAndShimuraCurvesPartII;
- not yet a pull request: CohomologyOfGroups, which is a board package and appears in the merge
  order.

Suppliers on main: StableHomotopyKTheory §7.22, DerivedModuleAlgebra §§0.2 and S.1, and
GrothendieckEulerForms §3.5 (cited only).

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already met the Lean form: it states headline theorems
only, it has two real-bodied definitions (`IsRightAcyclic`, `compositionTrans`), no padding, no
sorry'd data and no `set_option`. It is kept declaration for declaration. The only edit is to the
module docstring's product-totalisation item. That item used to say the class of categories was
missing at the pins. The base now uses Tau Ceti's `TauCeti.IsReplete`, which exists at the pin
(`TauCeti/CategoryTheory/Limits/Replete.lean` line 91), so the only missing carrier is the product
total complex. The docstring now says so.

I looked for statable headlines missing from the file and found none to add.
- The product total complex is absent from both pins. I grepped for product totals, exact couples
  and Cartan–Eilenberg resolutions in `mathlib/Mathlib` and `TauCeti/TauCeti`.
- So everything in Layers 5–6 and all product-total statements remain not statable.
- The Cartan–Eilenberg existence statement stays a README target. Stating it would need a long ad
  hoc encoding of the horizontal cycle, boundary and cohomology complexes with their augmentations.
  The accepted package made the same decision.

**Signature check.** I put `#check @name` for all 13 declarations in one scratch copy of the file
and elaborated it once with `lake env lean`; it exited 0. Every declaration carries all its
binders in its own signature, and the file has no section `variable`s. Each elaborated type
matches its README statement. Examples of binders confirmed present:
- `[HasColimitsOfShape ℕ C] [HasExactColimitsOfShape ℕ C]` on the two half-plane theorems;
- `[PreservesFiniteLimits F]` on Leray's lemma;
- `[PreservesFiniteLimits G]` on Grothendieck's criterion;
- `[EnoughInjectives C]` on the complex horseshoe;
- `[HasProjectiveResolutions C]` and the two-sided exactness hypothesis on Tor balancing.

Nothing changed, because no declaration changed.

A note for the worker: the file is a `module` with a plain `import Mathlib` and no
`public section`. Its declarations are therefore module-private, and a scratch file importing the
module cannot `#check` them. The check above was run on a copy of the file. Several roadmaps on
main use the same form.

## Supplier replacements and duplication removals

**Base contracts.** The package's 19 board supplier tokens (`gap:base-…`) and the "base §"
shorthand are replaced by citations of the form SpectralSequencesAndConvergence §X. *Exact
supplier contracts* now has one bullet per base section, and each bullet was re-read against the
base's open head `b60fcaf`. Its sections 1.2–1.4, 2.1, 2.2, 3.1–3.6, 4.3, 5.1–5.4 and 6.1–6.3
state what the package assumed, with two exceptions:

1. **The tower class changed (repaired).** The package assumed a base §7.2 class of "abelian
   categories with lim-acyclic epimorphic towers". At its head the base's §§7.2, 7.4 and 7.5 are
   instead stated for *replete* abelian categories (Tau Ceti's `TauCeti.IsReplete`), with
   countable products and coproducts and exact sequential colimits. Repleteness gives
   `CountableAB4Star` (`TauCeti.IsReplete.countableAB4Star`, `Replete.lean` line 357), and the
   base's §7.2 proves it equivalent to `CountableAB4Star` plus `lim¹ = 0` for epimorphic towers.
   I rewrote the Conventions *Categories* bullet, the §7.2 and §7.4/§7.5 contract bullets, the
   Needs lines of 1.3 and 1.5, a new *From Tau Ceti* entry (`TauCeti.IsReplete`,
   `TauCeti.IsReplete.countableAB4Star`, `CategoryTheory.Functor.towerDifference`) and the Lean
   docstring. `ModuleCat` repleteness is the base's §7.2 theorem; the pin has no such instance
   (grep finds only `Type`, `LightCondSet` and `LightCondMod`), and the README says so.
2. **Base §7.5 no longer says its convergence goes through the canonical presentation of §5.2
   (repaired here).** The Conventions assert that every convergence is through that presentation.
   I added the identification to the route of 1.3(c), with this argument:
   - by base §6.3 and §6.2, `B_∞ = j(⋃_r ker i^r)`;
   - this equals `Bᵗ`, because `H^n(F_I^s) = H^n(Tot^Π K)` for small `s`;
   - the base's §7.4 isomorphism through `j` forces `Z_∞ = ker k = Zᵗ`.

   1.3(c)'s Needs now lists base §§6.2 and 6.3.

**Comparison of totals (1.4).**
- The primary route is now the mapping-cone route through acyclic assembly (1.5). The package had
  that route for the direct-sum cases only; it also works for `Tot^Π`.
- This route uses neither base §3.3 nor the naturality of the canonical presentation. The
  spectral-sequence route is kept as the second route for the finite and direct-sum cases. It
  cites the base's §5.4 comparison item and §§3.3, 3.5.
- The cone route shows that the `Tot^Π` case needs no regularity of `′E(K)`, `′E(L)`. I removed
  that hypothesis and stated the row form for `Tot^Π` (see the adversarial table).

**Naturality (1.2).** 1.2's naturality of the canonical presentation now cites base §§4.3 and 4.6.

**Ownership against main.** GrothendieckEulerForms §3.5, on main, owns the projective horseshoe
lemma in exact categories with enough projectives (its Needs line names
`TauCeti.ExactStructure.FiniteResolution.horseshoe`). It is now cited:
- in *Scope and ownership*;
- in a new *From TauCetiRoadmap.GrothendieckEulerForms* supplier section;
- in 2.1's projective-dual bullet, which no longer suggests that this roadmap states the
  projective form for objects.

**Duplication sweep.** I searched by object across main and all open roadmap pull requests: product
total, acyclic assembly, horseshoe, Cartan–Eilenberg, `rightDerivedFunctorPlus`, hypercohomology
spectral sequence, Grothendieck/composite-functor sequence, Künneth spectral sequence, UCSS, Tor
balance, Massey pairings, Bockstein spectral sequence and change of rings. Every hit is one of
three kinds, and no duplicate on main or in an earlier open roadmap needed removal:
- an instance already named in the README: AlgebraicTopology §5.1's singular-chain Künneth
  sequence, ALS.1.7's coefficient-change UCSS, TopologicalSheafCohomology §1.4's Čech
  hypercohomology sequences, SchemeKTheoryOperations §6.7's group hyperhomology, and
  SchemeAndStackFoundations §§2.2, 2.7, 2.15;
- a use, not an ownership: EnhancedDerivedSheaves, Hyperfunctions and
  SmoothRepresentationsOfLocalGroups on `rightDerivedFunctorPlus`; ArithmeticGaloisDuality and
  NoncommutativeAndEquivariantIwasawa naming a Cartan–Eilenberg resolution inside a proof sketch;
- a roadmap later in the merge order: TorsionCohomologyInfrastructure, AlgebraicTopologyPartII,
  ClassicalAdicEtaleCohomology, ModpRepresentationsOfGL2OverLocalFields.

Nothing was deleted, so *Scope and ownership* records no removal.

**One overlap to flag to the author of ArithmeticStatisticsPartVIII (later in the merge order).**
Its §5.16 says it owns "the two spectral sequences of a double complex" for graded modules. These
are Layer 1 here, applied in the abelian category of graded modules. The Scope bullet now says so.
That roadmap should cite this Layer 1 rather than own the sequences. Its graded Tor balance and
change of rings over noncommutative graded algebras are not covered here and stay with it.

**Citations checked at the cited heads.**
- StableHomotopyKTheory §7.22, DerivedModuleAlgebra §§0.2 and S.1, KhovanovHomology §K5,
  TopologicalSheafCohomology §1.4, AlgebraicTopology §5.1, DGFloer Layer 1 item 2 and
  SchemeAndStackFoundations §§2.2, 2.7, 2.15 (`leray_spectral_sequence`, `cech_to_cohomology`,
  `localToGlobal`, `hochschildSerre_galois_covering`), on main.
- ArithmeticGaloisDuality §D7.1 (*Derived composite spectral sequence*, which still assumes both
  functors "additive left-exact"), SchemeKTheoryOperations §6.7 (its heading is *Pointed sheaf
  models and K-coherence*, but its scope places group hyperhomology there),
  ArithmeticLocallySymmetricSpaces ALS.1.7 and ArithmeticStatisticsPartVIII §5.16, at their open
  heads.
- The open revision of DGFloer maps "Layer 1 item 2's … Serre spectral sequences" to
  AlgebraicTopology Stage 5.5 in an explicit table. That keeps the citation valid, and no
  dependency follows. The open revisions of AlgebraicTopology and SchemeAndStackFoundations keep
  the cited ids; the overlaps tool reports none dropped.

**Library declarations checked at the pins.**
- 68 Mathlib names were elaborated in one scratch `#check` file, with no error.
- Every Tau Ceti declaration the README names was found by grep in the pinned
  `.lake/packages/TauCeti`, with file and line, namespaces included: `TauCeti.ExactStructure.abelian`,
  `TauCeti.ChainComplex.exact_extToHomology_kronecker`, `TauCeti.cyclicBockstein` and
  `TauCeti.IsReplete`.
- Mathlib's `Tor.lean` still records the `Tor ≅ Tor'` comparison as missing (line 18), so 4.1
  stays a target.

## Fixes a mathematician would have flagged (upstream-reviewer pass)

1. The base's tower hypothesis was the wrong class (fix 1 above). As written, 1.3(c), 1.4 and 1.5
   cited a §7.2 notion that the base no longer defines.
2. 1.3(c) asserted convergence "through the canonical presentation" from a supplier that does not
   state it. The identification is now proved in the route (fix 2 above).
3. 1.4's `Tot^Π` case carried an unnecessary regularity hypothesis. The cone route removes it, and
   the row form for `Tot^Π` is stated.
4. 1.4's first Check referred to cases "(b)" and "(c)", which do not exist in 1.4. It now names
   the cases, and adds the cone-route view of the staircase: `Tot^⊕ C(f)` has `H^0 = ℤ` although
   every column of `C(f)` is exact.
5. 2.6 read the hyperhomology sequences "in the homological bidegree assignment of base §2.1".
   The base registers that assignment only for the `ℕ × ℕ` shape of `coreE₂HomologicalNat`. The
   Conventions now define the homological shapes `ComplexShape.up' (−r, r − 1)` on `ℤ × ℤ`, check
   that `(p, q) ↦ (−p, −p − q)`, `e = 0`, is an assignment in the base's sense, and say how the
   unop of a spectral sequence is formed (Mathlib `HomologicalComplex.unop`).
6. 2.1's projective-dual bullet attributed the projective horseshoe for objects only to the finite
   Tau Ceti result. It now names its owner, GrothendieckEulerForms §3.5.
7. Rewording:
   - "the base's witness" and "the base's Check of §3.2" now say which witness and which Check;
   - the Scope bullet for the base now says, in one clause, where the base stops, as a Part II
     introduction should.

## Adversarial mathematics pass

Values are computed; "✓" means both sides were computed and agree.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: total sign `d₁ + (−1)^p d₂` | unit square `K^{0,0}=K^{1,0}=K^{0,1}=K^{1,1}=ℤ`, maps `id` | `d(1) = (1,1)`; `K^{1,0}→K^{1,1}` is `−1`, `K^{0,1}→K^{1,1}` is `+1`; `d² = −1+1 = 0`; unsigned `1+1 = 2 ≠ 0` | ✓ | none |
| Conventions: classical indexing | stupid filtration of `ℤ →(×2) ℤ`, degrees 0,1 | `E_1^{0,0}` at native `(2·0+0+1, −1) = (1,−1)`, `E_1^{1,0}` at `(3,−2)`; `d_1 = +2`; `E_2^{1,0}=ℤ/2`, `E_2^{0,0}=0` | ✓ (same as base §5.1 witness) | wording only |
| Conventions: homological assignment `(p,q) ↦ (−p,−p−q)`, `e = 0` | `r = 2`, `(p,q) = (3,0) → (1,1)` | `fil: −3 → −1 = −3 + 2`; `deg: −3 → −2 = −3 + 1` | ✓ | added |
| Conventions: opposite complexes | `K = ℤ →(×2) ℤ` in degrees −1,0 | `H^0(K°) = ker(op ×2) = op coker = op ℤ/2`; `H^1(K°) = op ker(×2) = 0 = op H^{−1}(K)` | ✓ | none |
| Conventions: Tor at `p = −k` | `ℤ/2 ⊗^L ℤ/2` | `E₂^{0,0} = ℤ/2`, `E₂^{−1,0} = Tor_1 = ℤ/2` give `H^0 = H^{−1} = ℤ/2`; resolution `ℤ →(×2) ℤ` gives `ℤ/2 →(0) ℤ/2` | ✓ | none |
| Conventions: class of base §7.4 (repleteness) | `ModuleCat ℤ`; discrete `Gal(ℚ̄/ℚ)`-modules | modules: replete by base §7.2 (`Type` replete, forgetful functor preserves epis); tower `μ_{ℓ^{n+1}} → μ_{ℓ^n}` has smooth limit `0`, projections not epi, so not replete | class correctly excludes the second | rewritten to repleteness |
| 1.1 `Tot^Π` vs `Tot^⊕` (staircase) | `D_p = K^{p,−p}`, `O_p = K^{p+1,−p}`, `p ≥ 0` | `(dx)_p = x_p − (−1)^p x_{p+1}`; `⊕`: bijective (downward recursion), `H^0 = 0`; `∏`: kernel spanned by `(1,1,−1,−1,…)`, `H^0 = ℤ` | ✓ | none |
| 1.1 column sign | column 1, `ℤ →(×2) ℤ` | totals `ℤ →(−2) ℤ` in degrees 1,2, `H^2 = ℤ/2` | ✓ | none |
| 1.2 `″d_1 = H^q(d₂)` | column-sign complex | `″E_1^{0,1} = H^1(K^{•,0}) = ℤ`, `″E_1^{1,1} = ℤ`, `″d_1 = ×2`, `″E_2^{1,1} = ℤ/2 = H^2(Tot)` | ✓ | none |
| 1.2 `gr^p_I ≅ K^{p,•}⟦−p⟧` | shift sign | `(−1)^{−p} = (−1)^p` equals the column sign | ✓ | none |
| 1.3(a) finite filtration bounds | `ℤ →(×2) ℤ` horizontal | `F^1H^1 = H^1 = ℤ/2`, `F^2H^1 = 0` | ✓ | none |
| 1.3(b) direct-sum, row form | staircase (rows exact, `q ≤ 0`) | `F_II^s Tot^m = 0` for `s > m`; exhaustive; `″E_1 = 0`; `H^*(Tot^⊕) = 0` (computed: iso `⊕D → ⊕O`) | ✓ | none |
| 1.3(c) product, column form | staircase (right half-plane, `′E_1 = ℤ` at `(0,0)`) | `a(0)=0`, `a(1)=1`; `H^0(F^0)=H^0(Tot^Π)=ℤ`; `B_∞ = 0 = Bᵗ`; `k(1)` = class of `d(1,1,−1,−1,…) = 0`, so `Zᵗ = ℤ = Z_∞`; `E_∞^{0,0} = ℤ = gr^0H^0` | ✓ (canonical presentation invertible) | route addition |
| 1.3(c) regularity criterion | bounded below ⇔ `H^{n+1−p}(K^{p,•}) = 0` for `p ≥ p₁(n)` | reindexing `n+1 → n` gives base §2.2's `β(n)` | ✓ | none |
| 1.4 `Tot^Π` case without regularity (cone route) | `f` = projection of the staircase onto column 0 | `C(f)` columns: `cone(id_ℤ)` and `K^{p,•}[1]` for `p ≥ 1`, all exact; right half-plane, `a′(n) = min(a_K(n+1), a_L(n))`; `H^0(Tot^Π)` is `ℤ` on both sides | ✓ | regularity hypothesis dropped |
| 1.4 `Tot^⊕` negative control | same `f` | `H^0(Tot^⊕ K) = 0 → H^0(Tot^⊕ L) = ℤ`, so `H^0(cone) = ℤ`, not acyclic; vanishing for `p ≫ 0` fails (`D_p` on antidiagonal 0) | ✓ hypothesis needed | Check rewritten |
| `quasiIso_total_map_of_finite_antidiagonals` | `K = L ⊕ C → L`, `L^{p,p} = ℤ` | each antidiagonal has one nonzero position; `H^{2p} = ℤ`, `H^{2p+1} = 0` on both sides | ✓ | none |
| `quasiIso_total_map_of_bounded` | `K` = `ℤ →(id) ℤ` in column −1, `L = 0` | column quasi-iso; `K^{p,n−p} = 0` for `p > −1`; `Tot K = ℤ →(−1) ℤ`, acyclic | ✓ | none |
| `acyclic_total_of_finite_antidiagonals` | `ℤ →(id) ℤ` horizontal; negative: dual staircase | first: rows exact, finite, `Tot` acyclic. Dual staircase: columns exact, but antidiagonal 0 contains every `A_p`; `H^1(Tot^⊕) = ℤ` (functional `1,−1,−1,1,1,…`) | ✓ finiteness needed | none |
| `acyclic_total_of_bounded` | staircase (rows exact, `q ≤ 0`); dual staircase (columns exact, nonzero for `p ≫ 0`) | `H^*(Tot^⊕) = 0`; `H^1(Tot^⊕) = ℤ`, hypothesis fails | ✓ | none |
| 1.5 `Tot^Π` | dual staircase | `y_p = (−1)^p x_p + x_{p−1}` is bijective on products, so acyclic | ✓ | none |
| 1.5 augmented form | `0 → A → I^0 → I^1 → ⋯` in degree 0 | `M` adjoined as column −1; right half-plane with exact rows; `K^{n−q,q} = 0` for `q > n+1` | ✓ | none |
| `exists_injectiveResolution_horseshoe` | `0 → ℤ →(×2) ℤ → ℤ/2 → 0`, `I₁ = ℚ → ℚ/ℤ`, `I₃ = ℚ/ℤ →(×2) ℚ/ℤ` | `ker(×2 on ℚ/ℤ) = {0, 1/2}`; middle `ℚ⊕ℚ/ℤ → ℚ/ℤ⊕ℚ/ℤ` with `H^0 = ℤ`; untwisted sum gives `H^0 = ℤ ⊕ ℤ/2 ≠ ℤ` | ✓ twisting forced | none |
| `exists_quasiIso_injective_horseshoe` | `I₁ = (ℚ→ℚ/ℤ) ⊕ (ℚ/ℤ →id ℚ/ℤ in degrees −1,0)`, `n = 0` | `I₁^{−1} ≠ 0` violates `[I₁.IsStrictlyGE 0]`, so it is excluded by the binder | ✓ | none |
| `exists_horseshoe_lift` | split `ℤ/2 → (ℤ/2)² → ℤ/2`, transported by `φ(u,v) = (u+h(v),v)` | with `h = id` in degree 0 only: `d₁h − hd₃ = ×2 ≠ 0`; identity not a chain map, while `μ = φ` is | ✓ off-diagonal part needed | none |
| `IsRightAcyclic` | `F = Hom(ℤ/2,−)`: `ℚ/ℤ`, `ℤ` | `R¹F(ℚ/ℤ) = 0`, so acyclic; `R¹F(ℤ) = ℤ/2`, so not; a model that also asks `i = 0` rejects `ℚ/ℤ` (`R⁰F = ℤ/2`) | ✓ | none |
| `exists_rightDerivedFunctorPlus_homology_iso_rightDerived` | `F = −⊗ℤ/2`, `n = 0`, `A = ℤ`; `τ = 2·𝟙` on `Hom(ℤ/2,−)`, `n = 1` | both sides `H^0(ℚ⊗ℤ/2 → ℚ/ℤ⊗ℤ/2) = H^0(0→0) = 0` (≠ `F(ℤ) = ℤ/2`); both sides `×2 = 0` on `ℤ/2` | ✓ | none |
| `isIso_rightDerivedFunctorPlusUnit_app_of_isRightAcyclic` | `Hom(ℤ/2,−)` on `ℚ → ℚ/ℤ`; negative: `−⊗ℤ/2` on `ℤ[0]` | `H^1(F(L)) = ℤ/2 = R¹F(ℤ)`; negative: `ℤ` is acyclic but `H^0(RF(ℤ[0])) = 0 ≠ ℤ/2` | ✓; `[PreservesFiniteLimits F]` excludes the negative case | none |
| `compositionTrans`, `isIso_compositionTrans_iff` | `F = G = Hom(ℤ/2,−)` at `ℚ/ℤ`; `F = id`; `F = −⊗ℤ/2`, `G = id` | 1st: `R¹(GF)(ℚ/ℤ) = Ext¹(ℤ/2,ℚ/ℤ) = 0` vs `H¹(RG(ℤ/2[0])) = ℤ/2`, so `t` not iso; `F(ℚ/ℤ) = ℤ/2` not `G`-acyclic (false ⇔ false). 2nd: true ⇔ true. 3rd: both sides `RF`, and every object is acyclic for exact `G` (true ⇔ true) | ✓ | none |
| 3.2 coextension example | `ℤ/4 → ℤ/2`, `A = ℤ/2` | resolution `ℤ/2 → ℤ/4 →(×2) ℤ/4 → ⋯`; `Hom(ℤ/2,−)` gives `ℤ/2` with zero maps, so `Ext^q = ℤ/2` for all `q` | ✓ | none |
| 3.3 nonzero third map | `ℤ → ℤ/4`, `F = Hom_ℤ(ℤ/4,−)`, `G = Hom_{ℤ/4}(ℤ/2,−)`, `A = ℤ/2` | `R^qF = ℤ/2, ℤ/2, 0`; `E₂^{p,q} = ℤ/2` (`p ≥ 0`, `q ≤ 1`); `Ext^n_ℤ(ℤ/2,ℤ/2) = ℤ/2, ℤ/2, 0`; five-term `0→ℤ/2→ℤ/2→ℤ/2→ℤ/2→0` forces iso, 0, iso | ✓ | none |
| 2.4 first sequence | `F = Hom(ℤ/2,−)`, `K = ℤ →(×2) ℤ` | `′E_1^{0,1} = ′E_1^{1,1} = ℤ/2`, `′d_1 = ×2 = 0`; abutment `ℤ/2` in degrees 1, 2 = `Ext^{n−1}(ℤ/2,ℤ/2)` | ✓ | none |
| 2.5 second sequence | same | `H^1K = ℤ/2`; `″E_2^{0,1} = ℤ/2`, `″E_2^{1,1} = ℤ/2` | ✓ | none |
| 2.6 indices | `F = −⊗ℤ/2`, `K = ℤ →(×2) ℤ` in degrees −1,0 | `E^1_{0,0} = E^1_{1,0} = ℤ/2`, `d^1 = 0`, so `L_0F = L_1F = ℤ/2 = Tor_n(ℤ/2,ℤ/2)`; unop of `′E_1^{p,q}(Fᵒᵖ,K°) = op L_qF(K^{−p})` keeps indices | ✓ | unop wording added |
| `nonempty_tor_iso_tor'` | `ℤ/4`, `ℤ/6`; `n = 0`; `𝔽₂[x,y]/(x²,y²)` with `U ⋆ V = D(DU⊗DV)` | `ker(×6 on ℤ/4) = {0,2} ≅ ker(×4 on ℤ/6) = {0,3}`; `Tor_0 = ℤ/2` both ways; in the `⋆` example `Tor_0 = Tor′_0 = k` but `X ⋆ k = soc X = k²` | ✓ balance holds; `Tor_0 ≠ ⋆` without right exactness | none |
| 4.2(a) unbounded | `K = ⊕_n ℤ/2[n]`, `M = ℤ/2` | `Hⁿ = (ℤ/2)²`, an extension of `Tor_1` by `ℤ/2⊗ℤ/2` | ✓ | none |
| 4.3 non-degeneration | `R = k[ε]/ε²`, `K = L = k` | `Tor_n(k,k) = k` for all `n` (periodic `×ε`); one term per total degree | ✓ | none |
| 4.4(a) | `ℤ → ℤ/4`, `M = N = ℤ/2` | `E²_{p,q} = ℤ/2` (`q = 0,1`); abutment `ℤ/2, ℤ/2, 0, …`; `d²: E²_{p,0} → E²_{p−2,1}` iso for `p ≥ 2` leaves `E_{0,0}, E_{1,0}` | ✓ | none |
| 5.1 `μ_0` ⇔ Leibniz, shift at `μ_1` | couple of `0 → M →(×2) M → M/2M → 0`, `M = ℤ →(×4) ℤ` | `k(1) = 2`, `j(2) = 0`, so `d_1 = 0`; any `c` with `i(c) = 2` is odd, so `j(c) = 1 ≠ 0`; `μ_1` fails for `φ` and `μ_0` fails for `φ′` | ✓ (false ⇔ false) | none |
| 6.1 sign of `d_1` | `M = ℤ →(×p) ℤ`, `f = p` | `k(1) = [1] ∈ ℤ/p`, `j([1]) = 1`, so `d_1 = +1` | ✓ | none |
| 6.2 higher UCT | `M = ℤ →(×p^r) ℤ` | `E_s^0 = (p^{s−1}ℤ/p^r)[p] = ℤ/p` for `s ≤ r`, `0` after; `E_s^1 = ℤ/p` for `s ≤ r` | ✓ | none |
| 6.2 limit page reached by no page | `M = ⊕_k (ℤ →(×p^k) ℤ)` | `E_r^0 = ⊕_{k≥r} ℤ/p ≠ 0`; `⋂_r p^r H^1 = 0`, so `Z_∞ = ker k = 0` and `E_∞^0 = 0` | ✓ | none |

Hypotheses I did not test for necessity (P3 notes, no finding): `[EnoughInjectives C]` in
`exists_rightDerivedFunctorPlus_homology_iso_rightDerived` and `IsRightAcyclic` (needed for
`rightDerivedFunctorPlus` to exist), and `HasDerivedCategory` throughout.

## Unresolved

- **The base is an open pull request.** Every SpectralSequencesAndConvergence citation was checked
  at its head `b60fcaf`. If that roadmap renumbers before merging, this README must follow.
- **CohomologyOfGroups.** It is named in *Downstream consumers* but is a board package, not yet a
  roadmap pull request; it is in the merge order. No roadmap or package reads this roadmap yet; the
  downstream list states intended uses.
- **ArithmeticStatisticsPartVIII §5.16** claims the double-complex spectral sequences of graded
  modules. They are this roadmap's Layer 1 in that category. The author of that later roadmap
  should be asked to cite Layer 1.
- **Module privacy.** `Suggested.lean` keeps the package's `module` / `import Mathlib` form, so
  its declarations are module-private. The gate accepts this; making them `public` would be a
  file-wide change for the worker to decide.
- **Ownership against open pull requests** was checked: the brief gives their checkouts, and the
  grep and show tools were used.
- **Untrusted text.** No passage read in reviews, reports, other roadmaps or sources asked for an
  action; none is suspicious.


Pull request: #2307 (roadmap/spectral-sequences-and-convergence-part-ii at 3d767c2)
