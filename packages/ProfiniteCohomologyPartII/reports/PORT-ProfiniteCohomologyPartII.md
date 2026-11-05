# Port report: ProfiniteCohomologyPartII

Branch `roadmap/profinite-cohomology-part-ii`, created from `3b51055`; head commit `9a8886d5`
(`ProfiniteCohomologyPartII: roadmap (README, Suggested.lean, metadata)`). Folder
`TauCetiRoadmap/ProfiniteCohomologyPartII/{README.md,Suggested.lean,metadata.toml}`; nothing outside
the folder was touched (`git diff --stat origin/main..HEAD`: three files, 2411 insertions).

## Build

`lake build TauCetiRoadmap.ProfiniteCohomologyPartII.Suggested`, run from the port worktree:

```text
warning: TauCetiRoadmap/ProfiniteCohomologyPartII/Suggested.lean:116:8: declaration uses `sorry`
warning: TauCetiRoadmap/ProfiniteCohomologyPartII/Suggested.lean:134:8: declaration uses `sorry`
warning: TauCetiRoadmap/ProfiniteCohomologyPartII/Suggested.lean:152:8: declaration uses `sorry`
warning: TauCetiRoadmap/ProfiniteCohomologyPartII/Suggested.lean:174:8: declaration uses `sorry`
warning: TauCetiRoadmap/ProfiniteCohomologyPartII/Suggested.lean:206:8: declaration uses `sorry`
warning: TauCetiRoadmap/ProfiniteCohomologyPartII/Suggested.lean:223:8: declaration uses `sorry`
warning: TauCetiRoadmap/ProfiniteCohomologyPartII/Suggested.lean:257:8: declaration uses `sorry`
warning: TauCetiRoadmap/ProfiniteCohomologyPartII/Suggested.lean:277:8: declaration uses `sorry`
Build completed successfully (8970 jobs).
```

Warning count: 8, all `declaration uses 'sorry'`, one for each of the eight headline theorems; no
other warning and no error. Pins from `lake-manifest.json`: Mathlib `f6090c70`, Tau Ceti `358314d4`.

## Gate

```text
gate ProfiniteCohomologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Exit status 0, run on the committed head.

## Draft pull request body

This roadmap extends ProfiniteCohomology from continuous cohomology and its cup products to Massey
products in degree one, studied through finite unipotent groups. Nothing in Mathlib, Tau Ceti or the
roadmaps on main defines a Massey product in Galois cohomology. DGAInfinity has the generic matric
Massey products, and they are specialized here rather than rebuilt. The roadmap builds the
continuous inhomogeneous cochain algebra of a profinite group as a strictly associative DG algebra,
compares it in every degree with Mathlib's `continuousCohomology`, and defines degree-one defining
systems. It then proves Dwyer's criteria: an `n`-fold Massey product is defined, respectively
contains zero, exactly when the adjacent characters lift to `Uₙ₊₁(R)/Z`, respectively to `Uₙ₊₁(R)`.
These are stated for any topological group and any discrete commutative ring. Next comes the finite
group theory of `Uₙ₊₁(𝔽_p)` that the Harpaz–Wittenberg homogeneous-space proof of Massey vanishing
over number fields consumes:
- the exact superdiagonal commutators and the abelianized stabilizer `B = U¹/U³` with its explicit
  action;
- outer exponents and outer powering in rank at most six;
- the vanishing of the Bogomolov multiplier of `U¹`, via the commutativity-preserving exterior
  square;
- cyclically trivial cohomology of the boundary module and fixed-class generation for `n = 4, 5`;
- the explicit examples that show where these results stop at `n = 6`.

On the arithmetic side the roadmap proves refined lifting through the two-boundary subgroups
`P_(r,s)` at every local field, the archimedean ones included (the source proves only the
nonarchimedean case but uses it at every place). It derives local Massey vanishing for `𝔽_p`
coefficients and the rank-one twisted form of refined lifting. Finally it builds, from Grunwald–Wang
and Poitou–Tate duality, three characters `Γ_ℚ → ℤ/8` whose triple Massey product is defined and
does not contain zero. `Suggested.lean` states the eight headline theorems:
- `masseyDefined_iff_exists_lift` and `masseyContainsZero_iff_exists_lift`;
- `isConj_pow_superdiagonalSubgroup_two`;
- `bogomolovMultiplier_superdiagonalSubgroup_two_eq_bot`;
- `refinedLocalLifting`, `localMasseyVanishing` and `twistedRefinedLocalLifting`;
- `exists_masseyDefined_not_masseyContainsZero_zmod_eight`.

Its docstring says which results are not statable at the pins and what each lacks.

Written with Claude (Opus 5.5) from the accepted board package and its review.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Roadmaps this one depends on that are still pull requests

ArithmeticGaloisDuality, InverseGaloisAndArithmeticFundamentalGroups and K2SymbolsBrauer. All three
are earlier in the merge order. Their cited sections were read at the heads the roadmap service
indexes:
- ArithmeticGaloisDuality: §R02.1.4 (*Pointwise Hom of discrete modules*, *The splitting torsor*
  with its third Check, *The connecting map is cup product with the torsor class*, *Finitely
  generated `C`: the discrete case*), §R02.3.0d, §R02.4.3 part (a) with its naturality sentence,
  §R02.4.5a statement (3), and §R02.4.5b with `Ш¹(ℚ, μ₈) = 0`, `Ш²(ℚ, ℤ/8) = 0` and the order-two
  alternative.
- InverseGaloisAndArithmeticFundamentalGroups: §IG.4.1 *Finite abelian-kernel obstruction and
  pullback* (no surjectivity of `π`, torsor under `H¹`), and §IG.4.2 *Twisting abelian-kernel
  solutions* and *Two independent cyclic degree-eight lifts*.
- K2SymbolsBrauer: §6.14, the unique lexicographic factorization in `Uₙ(A)` for commutative `A` and
  `n ≥ 3`.

Suppliers on main: ProfiniteCohomology (Layers 0–3, 5, 6, 8–12), DGAInfinity (Layers 1 and 8) and
ClassFieldTheory (Layer 5). ProfiniteProPGroups (Layer 5) is under `Completed/`.
HeightsRationalPointsAndObstructions is also earlier in the order, but it is named only in Downstream
consumers, as the owner of the unramified Brauer groups that the global theorem needs. It appears in
no Needs line, supplier heading or Dependencies block.

Merge-order position: line 365. The suppliers that are still pull requests sit above it:
K2SymbolsBrauer at 37, ArithmeticGaloisDuality at 43, InverseGaloisAndArithmeticFundamentalGroups
at 44.

## Dependency check

```text
depcheck: 235 roadmaps, 2231 edges, 0 problem(s)
```

This is the brief's command with `--movable`, run after all edits. It prints no UPWARD, CYCLE or
`moved:` line. After the edits the citation resolver reports "Cross-roadmap citations found nowhere:
None. Lean names found nowhere: None." Its three earlier leads were `DefiningSystem.continuous_entry`,
`DefiningSystem.entry_castSucc_succ` and `DefiningSystem.entry_mul`. They are fields of the structure
`DefiningSystem` declared in `Suggested.lean`, and `#check` resolves all three.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already met the acceptance-test rule and is byte-identical in
the port:
- eight headline theorems;
- the definitions they need, each with a real body: the structure `DefiningSystem` with
  `DefiningSystem.value`, `MasseyDefined`, `MasseyContainsZero`, `bogomolovMultiplier`,
  `IsTwoBoundary`, `IsLocalField` and `triangularCorner`, plus the instance `triangularCorner.normal`
  needed to form the quotient;
- the header `module`, `public import Mathlib`, three existing `TauCeti.*` modules and
  `@[expose] public section`;
- no `set_option`, no `lemma`, no example and no sorry'd data.

Every headline named in the README Summary is stated. The docstring names what is not stated and the
carrier each one lacks:
- the general cochain DG algebra and its all-degree comparison (0.1–0.2);
- the twisted defining systems of Layer 9;
- the two finite-group inputs 5.6 and 5.7, which are not headlines and whose carriers `B`, `B_bdry`,
  the twisted dual and `H¹_cyc` are this roadmap's constructions.

Mechanical signature check, done once. I put a temporary copy of `Suggested.lean` in place, with
`#check @name` for all 22 own names (the structure fields included) and for 70 supplier names; for
the supplier names it also imported the 21 further Tau Ceti modules that hold them, all with oleans
at the pin. I built it once with the brief's `lake build` command and then restored the file
byte-for-byte; the build was `Build completed successfully (9376 jobs)`, 92 `info` lines and no
error. Each elaborated type matches its README statement:
- `[IsTopologicalGroup Γ]`, `[DiscreteTopology R]` and `2 ≤ n` on Dwyer's criteria;
- `n ≤ 6` and `a ≡ 1 [MOD p]` on outer powering;
- `G : Type` for the Bogomolov multiplier;
- `IsLocalField K`, `1 ≤ r`, `1 ≤ s`, `r + s + 1 = n` and the open-kernel hypothesis on both lifting
  theorems;
- `3 ≤ n` on local vanishing.

The file uses no section `variable`, so no binder can drop. Nothing changed.

Four supplier names are in modules with no olean at the pin: `ContCohomology.H1pi_eq_zero_iff_exists_smul_sub_eq`
and `ContCohomology.explicitH2CyclicEquiv` in `ContCohomology/FiniteCyclic.lean`, and
`TauCeti.DGCategoryData` and `TauCeti.DGCategory` in `CategoryTheory/DG/HomComplexData.lean` and
`CategoryTheory/DG/Basic.lean`. I confirmed these by grep at the pin instead of building them.

## Supplier replacements and duplication removals

- **Duplication removals: none.** I swept by object with `roadmaps grep` over main and the 449
  indexed open pull requests, then over the board's package READMEs. Objects searched: Massey
  products and defining systems, Dwyer's correspondence, Bogomolov multipliers, the exterior square
  with commuting pairs killed, a local-field predicate including `ℝ` and `ℂ`, two-boundary subgroups,
  outer exponents, cyclically trivial `H¹`, the superdiagonal commutator equality and Artin–Schreier
  vanishing of `H²`. What I found:
  - Massey products occur only as DGAInfinity Layer 8's generic products, which are consumed here,
    and as BordismFormalGroups' page-Massey products, a different object.
  - Every "Bogomolov" hit is either the principal block `B₀(G)` (ModularCharactersAndBlocks,
    GlaubermanZStar) or the Bogomolov conjecture (HeightsRationalPointsAndObstructionsPartII).
  - No other roadmap defines `IsLocalField`, a two-boundary subgroup, an outer exponent or
    `H¹_cyc`.
  - The pinned Mathlib and Tau Ceti have none of these objects. Tau Ceti has only the forward
    inclusion `commutator_superdiagonalSubgroup_le` and a private lower-central-series inclusion,
    both cited.
- **Supplier naming.** The From Mathlib contract said `Field.absoluteGaloisGroup` is "compared with
  `TauCeti.AbsoluteGaloisGroup` by Tau Ceti" without naming the declaration. It now names
  `TauCeti.absoluteGaloisGroupRestrictEquiv` (`FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean`,
  `Field.absoluteGaloisGroup K ≃ₜ* AbsoluteGaloisGroup K`).
- **Supplier generality.** 8.2 asked to prove that a finite separable extension of a local field is
  local. `TauCeti.finiteExtension_isNonarchimedeanLocalField` takes any finite `K`-algebra field `M`
  with no separability hypothesis. 8.2 and its bullet now state the result for every finite
  extension, with the archimedean case: a finite extension of a field isomorphic to `ℝ` is
  isomorphic to `ℝ` or `ℂ`.
- **Confirmed at the pins.** All 70 supplier names checked resolve by `#check`: 54 Tau Ceti names
  (`Matrix.IsUpperUnitriangular` included) and 16 Mathlib names. The four names in modules without an
  olean were confirmed by grep instead, as noted above.

## README fixes from the upstream read

1. **4.3, first Check (wrong group).** It said the Bogomolov duality is "with `ker κ̃`, not with
   `H²(H, ℤ)`", next to "the Schur multiplier is `ℤ/2`". For `H = C₂ × C₂`,
   `H²(H, ℤ) ≅ Hom(H, ℚ/ℤ) ≅ (ℤ/2)²`. The Schur multiplier is `H₂(H, ℤ) ≅ ℤ/2`, and that is the
   contrast intended. It now reads "the Schur multiplier `H₂(H, ℤ)` is `ℤ/2`: the duality is with
   `ker κ̃`, not with the Schur multiplier".
2. **8.2 (generality below the supplier).** "Finite separable" is now "every finite", as above.
3. **Exact supplier contracts, From Mathlib (unnamed comparison).** The comparison declaration is now
   named, as above.
4. **Scope and ownership (incomplete boundary).** The sentence saying where ProfiniteCohomology stops
   omitted its Layer 13, the Evens norm. It is now listed.
5. **Downstream consumers (vague consumer).** "a continuation of HeightsRationalPointsAndObstructions"
   named a consumer that does not exist. The bullet now names the homogeneous-space proof (HW,
   Theorems 1.3, 5.1, 7.4) as the consumer and HeightsRationalPointsAndObstructions as the owner of
   the unramified Brauer groups and the Brauer–Manin obstruction it also needs.
6. **Form.** The 27 `API:` labels, a field-list style the house rules exclude, were deleted. The API
   bullets now follow the target paragraph directly, as in HopfologicalAlgebra on main.

The accepted review's three P3 notes and both rounds of red-team findings were already applied in
the package, and I checked that they are present at this head:
- `Matrix.IsUpperUnitriangular` is attributed to Tau Ceti;
- the 0.4 gauge identity reads `−d(u₀ ∪ a₁₂ − a₀₁ ∪ u₁ + u₀ ∪ du₁)`;
- the `DefiningSystem` docstring states the `entry_eq_zero` normalization;
- the §R02.1.4 Check is cited by position;
- §R02.4.3 part (a) is cited for the naturality of the pairing;
- K2SymbolsBrauer §6.14 is cited by title.

The two declared gaps are kept in the form main uses (`What X must provide (gap:slug)`, as in
FlagVarieties):
- `char-p-galois-h2-vanishing`: ProfiniteCohomology on main has no Artin–Schreier or
  characteristic-`p` `H²` vanishing in its Layers 9 or 11, and neither do the pins, which have
  Artin–Schreier extensions but no Galois-cohomology vanishing.
- `integral-gauge-massey-independence`: DGAInfinity Layer 8 on main builds exponential gauge only
  over `ℚ`-algebras.

## Adversarial mathematics pass

Values come from hand computation and three scratch scripts (`adv.py`, `dwyer.py`, `twisted.py`,
pure Python, exhaustive unless marked random). Source text was read at the certified extraction:
HW is arXiv 1904.06512v2, with lines as in its extraction.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Kraines sign convention (value `−Σ a₀ₘ ∪ aₘₙ`) | `n = 2`, `Γ = ℤ/2`, `R = 𝔽₂`; `(ℤ/3)²`, `𝔽₃` | 4 of 4 pairs of homomorphisms defined, 3 contain zero; the exception `(χ, χ)` has value `χ ∪ χ ≠ 0`. `−x ∪ y − x ∪ y = −2x ∪ y ≠ 0` in `𝔽₃` | holds | none |
| 0.1 translated cup | `ℤ/2` on `𝔽₉`, `a(σ) = 1`, `b(σ) = i` | `(a ∪ b)(σ, σ) = −i`; untranslated `i` | Check right | none |
| 0.1 Leibniz sign | `ℤ/3`, `𝔽₃`, `f = g`, `f(σ) = 1` | `(dg)(σ, σ) = 2`, `(f ∪ dg)(σ,σ,σ) = 2`; unsigned rule off by `2·2 = 1 ≠ 0` | Check right | none |
| 0.1 trivial `Γ` | degree `q` | `d = Σ_{i=0}^{q+1} (−1)^i`: `0` for even `q`, `1` for odd; `H⁰ = R`, `H^q = 0` for `q ≥ 1` | holds | none |
| `DefiningSystem`, `MasseyContainsZero` junk `n` | `n = 0`; `n = 1`, `Γ = ℤ/2`, `𝔽₂` | `n = 0`: the only entry is zero, value 0, contains zero. `n = 1`: no equation; 4 of 4 continuous `χ` contain zero, 2 of them non-homomorphisms with no lift | `2 ≤ n` in Dwyer's criteria is needed | none |
| `masseyDefined_iff_exists_lift` | `Γ = ℤ/2, ℤ/4, ℤ/3`, `R = 𝔽₂, 𝔽₃`, `n = 2, 3, 4`, every `χ` | LHS (defining system exists) against RHS (`β : Γ → U/Z` with those adjacent entries): mismatches 0 in every case (`ℤ/2, n=2`: 4 defined; `n=3`: 5; `n=4`: 8; `ℤ/4, n=2`: 4; `ℤ/3, 𝔽₃, n=2`: 9) | holds both ways | none |
| `masseyContainsZero_iff_exists_lift` | same | contains zero against a lift `Γ → U`: mismatches 0 (`ℤ/2, n=2`: 3 of 4; `ℤ/4, n=2`: 4 of 4; `ℤ/3, 𝔽₃`: 9 of 9) | holds both ways | none |
| 1.1 parameters are not entries | `U₃(𝔽₇)`, `(a,b,c) = (2,3,5)` | `(0,2)` entry `4 ≠ 5` | Check right | none |
| 1.2 `[Uᵃ, Uᵇ] = U^{a+b+1}` | `U₅(𝔽₂)`, `(a,b) = (0,0),(0,1),(0,2),(1,1)` | generated orders `64, 8, 2, 2`; `|U¹|, |U²|, |U³| = 64, 8, 2` | holds | none |
| 1.4 factor-set sign | `U₃(𝔽₅)`, classes `(2,3)`, `(4,1)` | corner `+2 = a·b′` | `+` sign | none |
| 1.6 example | `ℤ/2`, `𝔽₂`, `(χ, χ)` | `u²` has corner 1 for both lifts `u` of `(1,1)` in `U₃(𝔽₂)` | no lift to `U` | none |
| 2.2 action formula | `n = 5`, `𝔽₃`, 5 generators × 7 basis vectors | 35 of 35 agree with conjugation | holds | none |
| 2.4 distance-three sign | `𝔽₃`, `a₂ = 1`, `Q₀₂ = 1` | `M₀₃ = 2 = −1` | Check right | none |
| 2.5 reversal | `U₃(𝔽₅)`; `U₄(𝔽₃)`; 40 random pairs in `U₅(𝔽₂)`, `U₅(𝔽₃)` | `τ(S)₀₂ = 1`; `τ(e₀₂(1)) = e₁₃(2)`; involutive automorphism in all 40 | holds | none |
| 3.2 exponent bound | `p = 3`, `n = 6`, `g = 1+E₀₂+E₂₄+E₄₆` | `g³ = 1 + E₀₆`, `g⁹ = 1` | bound sharp | none |
| 3.3 outer exponent | `C₁, C₂, C₄, C₆, Q₈, (ℤ/3)², (ℤ/2)²` | exponents `1,2,4,6,4,3,2`; outer exponents `1,1,4,3,1,3,1` | Checks right | none |
| `isConj_pow_superdiagonalSubgroup_two` | `p = 2`, `n = 4` (`|U¹| = 64`) and `n = 5` (`|U¹| = 1024`), exhaustive; `p = 3`, `n = 6`, 50 random `Q`; `n ≤ 1`; `p ≥ 5` | every `Q³` is conjugate to `Q` in `U¹`. `Q⁴ = Q + Q₀₂Q₂₄Q₄₆E₀₆` and `e₂₆(t)Q⁴e₂₆(t)⁻¹ = Q` for all 50. `Q = 1+E₀₂+E₂₄+E₄₆` has `Q⁴ ≠ Q`. `U¹ = 1` for `n ≤ 1`. `2p > 6` gives exponent `p` | true in every case; HW line 566 says value `p` at `p = 2`, the computed outer exponent there is 1 (corrections table) | none |
| `bogomolovMultiplier` determines its object | abelian `H`; `C₂ × C₂`; `D₈ = U₃(𝔽₂)` | abelian: zero, `H` is tested. `C₂ × C₂`: the nonzero class of `H²(H, ℚ/ℤ) = ℤ/2` is nonzero on `H` itself, so cyclic tests do not suffice. `D₈`: in `Q₁₆`, `[a², b] = a⁴ ↦ 1/2` on `⟨ā², b̄⟩` | definition by all abelian subgroups is needed | none |
| `bogomolovMultiplier_superdiagonalSubgroup_two_eq_bot` | `n ≤ 1, 2, 3, 4` | `U¹` is trivial, order `p`, `𝔽_p³` (abelian, so the multiplier vanishes by definition), then non-abelian (`[e₀₂, e₂₄] = e₀₄`). Michailov Theorem 3.1 with `ℓ = 2 ≤ m − 2 = n − 1` covers `n ≥ 3`. `↥(superdiagonalSubgroup 2) : Type` | holds | none |
| 4.2 commutator convention | `S₃`, `s = (12)`, `r = (123)` | `srs⁻¹r⁻¹ = r`; `s⁻¹r⁻¹sr = r²` | Check right | none |
| 4.3 first Check | `C₂ × C₂` | `H₂(H, ℤ) = ℤ/2`; `H²(H, ℤ) = (ℤ/2)²` | named the wrong group | fixed (fix 1) |
| 6.3, 6.4 module `V` | all products of `N_s, N_t`; invariants; dual; global coboundary | all four products 0; `|V^Q| = 4` (dimension 2); `(s−1)d* = b*`, `(t−1)e* = b*`; parities acting trivially: only `(0,0)`, so the kernel is `⟨t², r⟩` of order 4; solutions `m` with `(s−1)m = b* = (t−1)m`: 0 | Checks right | none |
| `IsTwoBoundary`, 7.1 | `𝔽₃`, `n = 4`, `(r,s) = (2,1)`; `n = 0` | `|P| = 81 = 3⁴`, abelian; at `n = 0` no pair has `i < j`, so only the identity | holds | none |
| 7.6 retractions | `𝔽₃`, `n = 3`, `u = (1,2,0,0)`, `v = (0,0,1,1)`, `Q = 1+E₀₂+E₁₃` | `ρ = 0`; row term only `2`, column term only `1` | Check right | none |
| 7.7 stabilizer | `𝔽₃`, `n = 4`, `(2,1)`, `u = (1,2,1,0,2)`, `v = (1,0,2,1,1)` | `|S| = 2187 = 3⁷` of `|U₅(𝔽₃)| = 59049` | Check right | none |
| `refinedLocalLifting` at `ℝ` | `p = 2`; `n = 3`, `(1,1)`; `n = 4`, `(1,2)` and `(2,1)`; `p` odd; `ℂ` | homomorphisms `C₂ → U/Z` (classes): 20 and 144; without a lift modulo `P`: 0 and 0; not lifting themselves: 6 and 48. For `p` odd a homomorphism `C₂ → p`-group is trivial. `Γ_ℂ = 1` | holds; refined, not plain, lifting is what holds | none |
| `localMasseyVanishing` at `ℝ` | `Γ_ℝ = ℤ/2`, `p = 2`, `n = 2, 3, 4` | `n = 2`: 4 defined, 3 contain zero. `n = 3`: 5 defined, 5 contain zero. `n = 4`: 8 and 8 | `3 ≤ n` needed and sufficient here | none |
| `IsLocalField` | `ℚ`; `ℝ`, `ℂ`; finite extensions | `ℚ` is countable (Baire: a countable locally compact group is discrete, against `IsNontrivial`), so it fails; `ℝ`, `ℂ` hold by their disjuncts. Tau Ceti's finite-extension theorem has no separability | README below the supplier's generality | fixed (fix 2) |
| `triangularCorner` | `n = 0`, `𝔽₃`; `diag(−1,1,1)` | generating set `{1}` (order 1) against the literal reading `𝔽₃ˣ` (order 2); `1+E₀₂ ↦ 1−E₀₂` | normal, not central | none |
| `twistedRefinedLocalLifting` at `ℝ` | `p = 3`, `n = 3`, `(1,1)`, all of `T₄(𝔽₃)` (11664 elements) | elements with `x²` in the corner: 1248 (1245 with nontrivial diagonal); without a lift `y ≡ x mod P` with `y² = 1`: 0 | holds with twisted diagonals | none |
| 10.1 descent | `p = 3`, `ℝ`; `M = ℤ/2` | `K′ = ℂ`, degree 2; `H²(ℝ, ℤ/2) = ℤ/2 → H²(ℂ, ℤ/2) = 0` | `p`-primary needed | none |
| `exists_masseyDefined_not_masseyContainsZero_zmod_eight` (11.3–11.4) | `x⁸ − 16`; odd primes `< 400`; `p = 17`, `q = 41` | product of the four quadratics has coefficients `−16, 0, …, 0, 1`; at every odd prime one of `2, −2, −1` is a square; `17 ≡ 41 ≡ 1 (mod 8)`; `v_p(p⁴) = 4`, not a multiple of 8, so `([16],[1]) ≠ ([16q⁴],[p⁴])`; `Ш²(ℚ, ℤ/8) = 0` at ArithmeticGaloisDuality §R02.4.5b | holds (HW line 1203) | none |
| Context and generality of the Lean file | all 22 own declarations | no `variable`; each binder is in its own signature (`#check` above); Dwyer's criteria are stated for a topological group and a discrete commutative ring in both files; lifting for every `IsLocalField` in both | match | none |

No headline was found false. The changes from the pass are fixes 1 and 2.

## Unresolved

- The two declared supplier gaps stay requests on their owners; nothing at the pins or on main
  supplies them:
  - `char-p-galois-h2-vanishing` on ProfiniteCohomology Layer 9, used in 7.4 and 7.8;
  - `integral-gauge-massey-independence` on DGAInfinity Layer 8, used in 0.4.
- Dwyer, Theorem 2.4, is paywalled and uncertified. It is cited only through HW, p. 5.
- Ownership against open pull requests was checked through the roadmap service's index (449 open
  pull requests, `roadmaps grep`), the sibling checkouts this brief lists and the board's package
  READMEs. Open pull requests outside that index were not checked.
- No passage in the reviews, reports, supplier roadmaps or sources read for this job asked for an
  action outside the job; nothing suspicious to quote.


Pull request: #1839 (roadmap/profinite-cohomology-part-ii at 9a8886d)
