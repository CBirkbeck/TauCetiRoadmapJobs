# Review of ReductiveGroups (pull request #1676 at e6ddc5b)

**Verdict:** needs changes

This is an incremental re-review of the 26 lines changed in `TauCetiRoadmap/ReductiveGroups/` since `e57c60e`: `README.md:1680–1686` (the Levi-of-parabolic headline in Layer 6A form) and the module docstring of `Suggested.lean` (lines 53–64 and 74–76). No declaration of `Suggested.lean` changed.

The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with exactly eight `sorry` warnings. Three findings remain:
- the branch still pins Tau Ceti `a91d3aaf`, so the README and the new docstring disagree about what is pinned (R01, carried);
- the Levi headline is now named as not statable, but it is statable at both pins (R02, partly repaired);
- the description still states no order against the five conflicting pull requests (R03, carried).

Paths: `README.md` and `Suggested.lean` mean `TauCetiRoadmap/ReductiveGroups/…`. The branch pins Tau Ceti `a91d3aaf` with Mathlib `6b7abb3c` (this head's `lake-manifest.json`, untouched by the pull request). Main pins Tau Ceti `2fd255d9` with Mathlib `1b1ccf4b`.

## R01 (P2) — the branch still pins Tau Ceti `a91d3aaf`, where declarations the README calls pinned do not exist

**Location.**
- `README.md:1667`: "the pinned `TauCeti.HopfIdeal.IsParabolic` (`Parabolic/Basic.lean`)", and `:1699`, "the pinned parabolic predicate".
- New docstring text: `Suggested.lean:53–56`, "The parabolic predicate is a Tau Ceti declaration … so Layer 7's completeness characterization of parabolics lacks only the represented quotient"; `:61–63`, "The Tau Ceti revision this file's manifest pins does not contain the module … (the pinned revision the README cites does)"; `:73–74`, "`TauCeti.FiniteField.frobeniusPoints`) are Tau Ceti declarations".
- Plus every passage the previous report listed (points action, induction, Layer 7f, point topology, orbit geometry, Frobenius).

**Claim.** The cited declarations exist at the pins. The new docstring now says outright that the README and the manifest refer to different Tau Ceti revisions.

**Witness.** At `a91d3aaf`:
- `Algebra/AlgebraicGroup/Parabolic/` does not exist;
- `grep frobeniusPoints` finds 0 hits other than `iterateFrobeniusPoints`, and `Frobenius/` contains only `FixedPoints`, `GeneralLinear` and `Points`.

At `2fd255d9`, `Parabolic/Basic.lean:82,248` and `Frobenius/FiniteField.lean:105` exist. `git merge-tree --write-tree HEAD origin/main` still reports the modify/delete conflicts on `OrbitGeometryTargets.lean` and `SpectralWeylTargets.lean`.

**Repair.**
1. Rebase onto current main, so that the manifest pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`.
2. Resolve the two conflicts by keeping the deletion.
3. Then delete the sentence at `Suggested.lean:61–64`, which describes a manifest. Once merged it is false, because main's manifest pins `2fd255d9`.
4. Then apply R02.

The previous round established that this `Suggested.lean` elaborates unchanged at main's pins with the same eight warnings. This round only changed docstrings.

## R02 (P2) — the Levi-of-parabolic headline is named as not statable, but it is statable at both pins

**Location.** `Suggested.lean:57–64`: "Layer 7's Levi decomposition of a parabolic subgroup over an arbitrary field … the parabolic predicate is the missing carrier here and the decomposition is not stated."

**Claim.** At the branch pin the headline cannot be stated, because the parabolic predicate is missing.

**Witness.** At `a91d3aaf` the predicate is a nine-line definition with a real body, built from these pinned carriers:
- `IsBorelOverAlgClosed` (`Borel/Basic.lean:148`);
- `smoothCommHopfAlgProperty` (`Smooth/CommHopfAlgCat.lean:40`);
- `FiniteTypeCommHopfAlgCat.baseChange` (`FiniteType/BaseChange.lean:63`);
- `CommHopfAlgCat.baseChangeHopfIdeal` (`HopfIdeal/BaseChange.lean:102`).

It has the same body as `TauCeti.HopfIdeal.IsParabolic` at `2fd255d9`. A scratch file that defines it and states the theorem below elaborates at the branch pin with one `sorry` warning (5 s). At main's pin the predicate is a Tau Ceti declaration. So the headline is statable at either pin, and the rule asks for it to be stated.

**Repair.** After R01:
1. Add `import TauCeti.Algebra.AlgebraicGroup.Parabolic.Basic`.
2. Move the headline into the "Stated here" paragraph (`Suggested.lean:21`) and delete the bullet at `:57–64`.
3. Add the following to the Layer 7 section. Do not define the predicate locally: it would duplicate the Tau Ceti declaration once the branch is rebased.

The name and signature are those of #1797 at its head (`Suggested.lean:160–169` there), so whichever of the two lands first, the other inherits the same declaration (see R03).

```lean
/-- Levi decomposition of a parabolic subgroup over an arbitrary field: the geometric unipotent
radical of a parabolic `P` of a connected reductive `G` descends to the `k`-unipotent radical
`U`, and a Hopf ideal `J` of `O(P)` cuts out a Levi `k`-subgroup `L`, so that
`O(P)^U → O(P) → O(P)/J = O(L)` is bijective (Conrad–Feng, §H.1, p. 238). -/
theorem IsParabolic.exists_levi_complement {k : Type v} [Field k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k)
    (hred : TauCeti.reductiveCommHopfAlgProperty k H)
    (I : TauCeti.HopfIdeal k H.obj) (hP : TauCeti.HopfIdeal.IsParabolic k H.obj I) :
    ∃ J : TauCeti.HopfIdeal k (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I),
      Function.Bijective ((Ideal.Quotient.mkₐ k J.toIdeal).comp
        (TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal
          (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)).coinvariants.val) := by
  sorry
```

Tested:
- The probe elaborated this signature with the locally defined predicate, whose binders `(k) [Field k] (H : CommHopfAlgCat k) [Algebra.FiniteType k H] (I)` match `Parabolic/Basic.lean:248` at `2fd255d9`.
- It holds on `B ⊂ GL₂` over `𝔽₂(s)` and on `P = G` (table below).

## R03 (P3) — five open pull requests change this roadmap and conflict with this head; the description states no order

**Location.** The pull-request description, unchanged since the previous review.

**Witness.**
- The overlap index of 2026-11-09 lists #1332, #1797, #1807, #1808 and #1854 as conflicting with this head in `README.md`, `Suggested.lean` or the deleted `*Targets.lean` files.
- #1797 changes the same target differently. At its head, `TauCetiRoadmap/ReductiveGroups/Suggested.lean:160–163` states `IsParabolic.exists_levi_complement` with `hP : TauCeti.HopfIdeal.IsParabolic k H.obj I`. This head names that headline as not stated (`Suggested.lean:57–64`).
- The description still mentions "the new native companion module" and "one intentional admitted presentation target". The head has neither: `Suggested.lean` admits eight targets.

**Repair.**
- State in the description which of these pull requests is rebased on which. Say in particular whether this one takes #1797's Levi statement or #1797 takes this one's.
- Close or retarget #1332 if this pull request supersedes it.
- Replace the stale validation paragraph with what the head contains.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins `a91d3aaf…`; `Suggested.lean:61–63` now reads "The Tau Ceti revision this file's manifest pins does not contain the module `TauCeti.Algebra.AlgebraicGroup.Parabolic.Basic` (the pinned revision the README cites does)".
- R02 — partly repaired: `Suggested.lean:57–64` names the Levi headline with its intended form, but claims "the parabolic predicate is the missing carrier here and the decomposition is not stated", although the headline is statable at both pins (R02 above).
- R03 — not repaired: the description is unchanged, still "The new native companion module builds … with one intentional admitted presentation target", with no order stated against #1332, #1797, #1807, #1808 and #1854.

## Verified sound

**Head, scope, gate.**
- Head `e6ddc5ba…`; worktree clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroups'` is empty.
- `git diff --stat e57c60e HEAD`: `README.md` +7/−1, `Suggested.lean` +14/−4.
- Gate re-run at this head: every check 0, `OK`.
- Dependency check (`--movable`, content main, the board's ORDER.txt): `depcheck: 239 roadmaps, 2355 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- `README.md:42–43` and `:4015–4021` keep ReductiveGroupsPartII, FormalConnectionsOpers and InverseGaloisAndArithmeticFundamentalGroups as consumers only.

**Elaboration.**
- `lake env lean` on `Suggested.lean` from the worktree, at `a91d3aaf`/`6b7abb3c`: exit 0 in 6 s.
- Exactly eight warnings, all "declaration uses `sorry`", at lines 120, 133, 153, 175, 191, 213, 377 and 386. These are the previous lines shifted by +10, the ten lines the docstring grew.
- The worker's `signatures.md` lists the same 18 declarations with the same binders as the previous round. No statement changed, so the previous padding probe (all eight fail one-tactic closure) stands.

**The new README passage (`README.md:1680–1686`).**
- `conrad-feng` §H.1 is p. 238: the page marker is at line 10337 and p. 239 starts at line 10382.
- Lines 10375–10380 give the two facts the README states, for every parabolic `k`-subgroup of a connected reductive `k`-group:
  - a Levi `k`-subgroup exists;
  - `R_u(P_k̄)` descends to a `k`-split smooth connected unipotent normal `k`-subgroup.
- Definition H.1.1 is at line 10356, p. 238. The locator is right.
- The README's identification of that descent with the `k`-unipotent radical matches the pinned definition. `unipotentRadicalDefiningIdeal` (`Unipotent/Radical/Construction.lean:72`) cuts out the greatest connected normal smooth unipotent `k`-subgroup, and the module docstring says it is the `k`-unipotent radical, not the geometric one.
- `reductiveCommHopfAlgProperty` (`Reductive/Basic.lean:70`) includes smoothness and geometric connectedness, so the README's "connected smooth affine reductive" is carried by `hred`.

**The docstring's other claims, at main's pin `2fd255d9`.**
- `TauCeti.HopfIdeal.IsParabolicOverAlgClosed` is at `Parabolic/Basic.lean:82` and `IsParabolic` at `:248`, both in `namespace TauCeti.HopfIdeal` (line 74).
- `TauCeti.FiniteField.frobeniusPoints` is at `Frobenius/FiniteField.lean:105`, in `namespace TauCeti.FiniteField` (line 93).
- At the branch pin the only `IsParabolic` is the unrelated `Matrix.ProjectiveSpecialLinearGroup.IsParabolic` (`ProjectiveSpecialLinearGroup/FinTwo.lean:59`).

**Seeded sample.** None of it falls in the changed passages. I re-checked that each target is unchanged at this head and that its locator still reads as before:
- **1.1** (`README.md:676`): `jantzen-1985` line 1507, §3.3, induction.
- **8.1** (`README.md:2296`): `conrad-rgs` Definition 5.1.1, line 5651, p. 136 (marker at line 5636).
- **8.2** (`README.md:2320`): Definition 6.1.1, line 7725, p. 186 (marker at line 7712).

The previous report's full check of these three stands.

**Adversarial table.** The first five rows are new (values computed this round). The rest are carried from the review at `e57c60e` for statements this diff leaves untouched.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Levi headline, 6A form (`README.md:1680–1686`) | `P = G`, connected reductive | `R_{u,k}(G) = 1`: defining ideal = augmentation ideal, coinvariants = `O(G)`; `J = 0`: composite `O(G) → O(G)` the identity | Pass |
| same | `B ⊂ GL₂` over `𝔽₂(s)` and over ℚ | `[[a,b],[0,d]]·[[1,c],[0,1]] = [[a, b+ac],[0,d]]`; a top `b`-degree `n > 0` term gives a `cⁿ` coefficient `aⁿf_n ≠ 0`, so `O(B)^U = k[a^{±1},d^{±1}]`; `J = (b)`: `O(B)/J = k[a^{±1},d^{±1}]`, bijective | Pass |
| same, wrong `J` | `B ⊂ GL₂`, `J = (a−1, d−1)` (cuts out `U`) | composite sends `a − 1 ↦ 0`: not injective; the existential picks `J = (b)` instead | Pass |
| `k`-radical = descent of `R_u(P_k̄)` | parabolic `P` over imperfect `k`; control `Res_{k'/k}𝔾_m`, `[k':k] = p` purely inseparable | `V ⊂ P` a candidate ⇒ `V_k̄ ⊂ R_u(P_k̄) = U_k̄` ⇒ `V ⊂ U`; control: `R_{u,k} = 1`, geometric radical of dimension `p − 1`, excluded by `hred` | Pass |
| "parabolic predicate is the missing carrier" at `a91d3aaf` | scratch definition from `IsBorelOverAlgClosed`, `smoothCommHopfAlgProperty`, `baseChange`, `baseChangeHopfIdeal` | 9 lines; the Levi statement elaborates, 1 `sorry` warning | Fail: R02 |
| `exists_conjugate_eq_of_isMaximalTorus` | `SL₂`/ℂ, `u = [[1,1],[0,1]]` | `u·diag(t,t⁻¹)·u⁻¹ = [[t, t⁻¹−t],[0,t⁻¹]]`, `g = u` | Pass (carried) |
| same, non-smooth | `GL₂ × μ_p` over `𝔽̄_p` | tori `T × 1`; conjugators exist for `p = 2` and `p ≠ 2` | Pass (carried) |
| same, trivial cases | constant `S₃`; trivial group; `𝔾_a` | only the trivial torus; `I = J`, `g = 1` | Pass (carried) |
| same, negative control | `SL₂`/ℝ, diagonal vs `SO₂` | unbounded vs compact; excluded by `[IsAlgClosed k]` | Pass (carried) |
| same, "torus" hypothesis | `PGL₂`, `V₄` vs `T` | three vs one element of order 2; `V₄` rejected | Pass (carried) |
| pinned `hcontainI` reading | `GL₂`, `D = T`, `uTu⁻¹` | holds with `g = u` | Pass (carried) |
| Milne 16.33(d) in Layer 5 | `B ⊂ GL₂`, `μ₂`, `T`, `uTu⁻¹` | `μ₂` central in `T` | Pass (carried) |
| §3A.5 chart open embedding | `R = ℤ_p`, `D(t)` | `ℤ_pˣ` open; `p` outside | Pass (carried) |
| §3A.5 negative control | indiscrete field | units not open | Pass (carried) |
| §3A.5 local compactness | discrete `R`; `Spec k[t₁,t₂,…]` | discrete vs `R^ℕ` | Pass (carried) |
| §3A.5 separated ⇒ Hausdorff | `𝔸¹`; doubled origin | Hausdorff vs not | Pass (carried) |
| §1.1 inverse direction | weight-one line of `𝔾_m`/ℤ | `1 ↦ 1 ⊗ t`; `3·2 = 6` | Pass (carried) |
| §1.1 Hochschild | `ℤ[t,t⁻¹]`, weight one | `d¹d⁰(1) = 0` | Pass (carried) |
| §1.1 pinned induction | `C₂ ⊂ S₃` | rank `3 = |S₃/C₂|` | Pass (carried) |
| 7f fixed-coset identity | `S₃`, `H = ⟨(12)⟩` | `1·2 = 2·1`; `3·2 = 6·1` | Pass (carried) |
| 7f worked example | `GL₃(𝔽₂)` | `168`; `7` lines, `7` planes; `|P| = |Q| = 24` | Pass (carried) |
| 7a Lang | `𝔾_a`/𝔽₂; `𝔾_m`; `SL₂(𝔽₃)` | `θ² − θ = 1`; `24/6 = 4` | Pass (carried) |
| 7a fixed-coset control | `𝔽̄_qˣ`, `J = {±1}` | coset `{a,−a}` with no fixed point | Pass (carried) |
| `linearlyReductive_iff_reductive_identityComponent` | constant `ℤ/p`/𝔽_p | LHS false, RHS true; excluded by `[CharZero k]` | Pass (carried) |
| `linearlyReductive_iff_torus` | `μ_p`, `𝔾_m`, `SL₂` | `μ_p` fails `hsm`; `𝔾_m` both; `SL₂` neither | Pass (carried) |
| `exists_levi_complement` | `B ⊂ GL₂`/ℚ | `ℚ[a^{±1},d^{±1}] → O(T)` bijective | Pass (carried) |
| `exists_coordinatePresentation` | `n = 0, 1, 2`; ℤ/4 | `det ∅ − 1 = 0`; `x − 1`; `ad − bc − 1` | Pass (carried) |
| `halfTwist`, `plane_braid` | `n = 2, 3` | `(0,1) → (1,0)` counterclockwise | Pass (carried) |
| `permutation_nonsplit` | `n = 2`; `n ≤ 1` | `2m = 0` with `m` odd impossible | Pass (carried) |
| §8.1 split datum | `SL₂` vs `PGL₂`; `SL₂/𝔽₂` | root `2ϖ` vs generator; centre length 2 | Pass (carried) |
| §8.2 pinning | `x_α(t)` vs `x_α(2t)`; `Spec(k×k)` | `E₁₂` vs `2E₁₂`; signs `(+,−)` | Pass (carried) |
| §9A.1b counts | `D₄` triality; `E₆` | `14 = dim G₂`; `52 = dim F₄` | Pass (carried) |
| §9A.1b `A₂` basis | `e, f, h` | `[h,e] = e`; index `4` | Pass (carried) |
| §10C digit formula | `SL₂`, `p = 3, n = 4`; `p = 2, n = 2` | `dim 4`; `dim 2` | Pass (carried) |
| §10B Steinberg | `SL₂`, `p = 2, 3`; `PGL₂` | `2, 3`; `ρ ∉ X` | Pass (carried) |
| §9B.1 charts | `SL₂(ℤ/4)`; `[[2,1],[3,2]]`/ℤ | in `D(c)`; no single chart | Pass (carried) |
| Layer 11 `𝔰𝔩₂` | `𝔱_reg = ℂ*`, `W = ℤ/2` | lift ends at `−1` | Pass (carried) |
| old → new numbering | main's headings | 7g → 9E; 8 → 9D; 9B → 8.1–8.2 | Pass (carried) |

**Library declarations opened this round.** At `a91d3aaf`:
- `Borel/Basic.lean:148` (`IsBorelOverAlgClosed`) and `:196` (`IsBorel`);
- `Smooth/CommHopfAlgCat.lean:40`;
- `FiniteType/BaseChange.lean:63`;
- `HopfIdeal/BaseChange.lean:102`;
- `Reductive/Basic.lean:70`;
- `Unipotent/Radical/Construction.lean:72`.

At `2fd255d9`: `Parabolic/Basic.lean:74,82,248` and `Frobenius/FiniteField.lean:93,105`.

## Not verifiable

- The intended `Suggested.lean` with `TauCeti.HopfIdeal.IsParabolic` was not elaborated at main's pin this round. The brief allows Lean runs only from this worktree, which pins `a91d3aaf`. The R02 signature was elaborated with a body-identical local predicate at `a91d3aaf` instead.
- The heads of #1332, #1797, #1807, #1808 and #1854 were read only through the overlap index.
- Ownership of the Levi-of-parabolic statement was checked with `roadmaps grep 'IsParabolic|levi_of_isParabolic|exists_levi' --lean-only`.
  - The only other declaration on these carriers is #1797's, a revision of this same roadmap (R03).
  - FlagVarieties on main excludes Levi decompositions from its scope (its `README.md:25`).
  - The other `IsParabolic` hits are unrelated: FuchsianOrbifolds `PSL₂(ℝ)` elements and EnriquesSurfaces Coxeter elements.
- #1797's head was read only through `roadmaps show --pr 1797`, not as a checkout.

## Source issues

- none
