# FIX-PKG-HodgeClassesForJacquetLanglands~6

Repair of the two findings of `REV-PKG-HodgeClassesForJacquetLanglands~5` (one P1, one P2) on
`packages/HodgeClassesForJacquetLanglands`. Both were checked against the mathematics. Both are
correct and both are applied. Files changed:

- `README.md`.
- `design/plan.json`, top-level `gaps` list only. The entry `compact-matsushima` is replaced by
  `shimura-matsushima-comparison`. A JSON comparison with the `gaps` key removed shows nothing else
  changed.
- `sources.toml`: the Mil17 locator gains "footnote 40, p. 57", and its `cited_for` gains §0.2 and
  the ArithmeticLocallySymmetricSpaces supplier subsection.

`Suggested.lean` is unchanged: neither finding touches its predicate or its three theorems.

## REV-PKG-HodgeClassesForJacquetLanglands~5/F01 (P1) — applied

**Verified.** At the #871 head, ArithmeticLocallySymmetricSpaces works on
`X^G = G(F_∞)/K_∞A_∞`, where `A_∞` comes from the `ℚ`-split central torus only (§ALS.0.4). Its
§ALS.0.2 non-example keeps the unit circle for real quadratic `GL₁`. Its §ALS.3.6 trace gives
`π_*π^* = [K : K′]`, and its §ALS.5b.1 uses `𝔤/𝔞_G`. Its scope excludes Shimura varieties.

The Shimura domain divides out the whole of `K_h ⊇ Z(ℝ)` (Mil17 footnote 40, p. 57). I recomputed
the review's witness for `T = Res_{ℚ(√2)/ℚ}𝔾_m`, `ε = 1+√2`, with levels `K(9) ⊂ K(3)`:

| Quantity | Shimura | ALS |
| --- | --- | --- |
| level `K(3)` | 1 point, `H¹ = 0` | 1 circle (`−ε⁴` translates by `8 log ε`), `H¹ = ℚ` |
| level `K(9)` | 3 points | 3 circles (`−ε¹²` translates by `24 log ε`) |
| trace∘pullback | 3 | 9 |

**Changed (old → new).** §§0.2–0.3, scope, supplier contract: ALS §§1.1–1.2, 1.8, 3.3, 3.6, 5b.1,
5b.4 + gap:compact-matsushima → transfer of the finite étale Shimura level map (ShimuraVarieties
§§1.3, 1.6, 8.3, 8.5; AlgebraicTopology §5.3; EtaleCohomologyFoundations §0.8) + new
gap:shimura-matsushima-comparison (ALS; relative to `K_h`, effective-degree transfers, compact
spectral route, no SV5); two negative Checks; source note. Repointed §§8.4, 8.5, 10.4; Layers 0, 8,
10.

## REV-PKG-HodgeClassesForJacquetLanglands~5/F02 (P2) — applied

**Verified.** IP23 line 2002 has `k` an arbitrary integer `≥ 2`. MetaplecticAutomorphicForms §3.35
(at its head) states every `k ≥ 2` and has a `k = 3` Check. The cohomology computation does not use
§3.4.

**Changed (old → new).** §3.5 "For even `k ≥ 2`" → "For every integer `k ≥ 2`", outside the
global even convention; *Needs:* drops §3.4. New `k = 3` Check: lowest `K`-type `(3,0,0)`, dimensions
`1,2,1`, six-dimensional compact lift with line `H⁰`, weight outside §3.4. Even-only §§3.4, 5.4, 8.7
unchanged (projective descent).

## Checks run

**Lean.** I ran `lake env lean packages/HodgeClassesForJacquetLanglands/Suggested.lean` from the
content checkout.

- Exit 0.
- Only the three `declaration uses 'sorry'` warnings, at lines 70, 81 and 95.
- No Tau Ceti module was imported, so none had to be built.

**Signatures.** I put `#check @name` for all four declarations in one scratch copy and elaborated it
once.

- `IsExteriorStar` keeps exactly the data of its defining identity.
- The three theorems keep `[FiniteDimensional E U]`, the arbitrary `σ : E →+* E`, `vol`, `hkl`, `hL`.
- `comp_self` keeps the Hermitian hypothesis `hH` and the basis `b`.
- `map_similitude` keeps `g : U ≃ₗ[E] U`, `ν` and `hg`.
- All agree with README §§1.3, 1.4 and 1.7. No change was needed.

**Dependency check.** I ran the prescribed `gate --depcheck` command, with `--movable`, against the
merge order and content. Output:

    depcheck: 245 roadmaps, 2249 edges, 0 problem(s)

There is no `UPWARD`, `CYCLE` or `moved:` line, and the exit status is 0.

**Citations.** `roadmaps resolve` on the edited README reports no cross-roadmap citation and no Lean
name found nowhere. That tool did not check names outside `TauCetiRoadmap`, so I checked
`IsCoveringMap.singularTransfer` and its degree formula at the pinned Tau Ceti by hand, in
`TauCeti/AlgebraicTopology/Singular/Transfer/Basic.lean` and `Degree.lean`.

Gate failures listed in the brief: none.

## Adversarial pass on changed and added statements

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| gap: `S_K` vs `X_K` | `Res_{ℚ(√2)/ℚ}𝔾_m`, trivial `h`, `K(3)` | `S_K`: 1 point, `(H⁰,H¹)=(1,0)`; `(𝔤,K_h)` complex `Λ⁰` only, dimension 1. `X_K`: circle, `(1,1)` | the gap distinguishes them |
| gap, `Z_s = 1` | `𝔾_m/ℚ`, `h(z)=zz̄`, `K(3)` | both spaces are 1 point; `Z(ℚ)∩K(3) = {1}` since `−1 ∉ K(3)` | agree; no false distinction |
| gap: central hypothesis | `V = σ₁` (first embedding) on `Res_{ℚ(√2)/ℚ}𝔾_m` | `ε^m ∈ K` acts by `ε^m ≠ 1` for every `K` → no local system; `σ₁` not trivial on `Z_s` | hypothesis needed; kept |
| gap: stabilizers at neat `K` | `q ∈ G(ℚ)∩gKg⁻¹` fixing `x` | image in `G^ad(ℝ)` compact ∩ discrete → trivial; `q ∈ Z(ℚ)∩K` | claim correct |
| gap: Matsushima side | the same torus | `K_h`-invariant functions on `T(ℚ)∖T(𝔸)/K(3)` = functions on 1 point; matches `H⁰` | consistent |
| §0.2 `Sh_K = G(ℚ)∖(G(ℝ)/K_h × G(𝔸_f)/K)` | `GL₂/ℚ` | `K_h = ℝ^×SO(2)`, domain `ℍ^±` (ALS: `O(2)ℝ_{>0}`, `ℍ`) | matches Mil17 fn. 40 |
| §0.2 new Check | `−ε⁴ mod 3` | `ε⁴ ≡ −1 mod 3`; translation `4 log ε + 4 log ε = 8 log ε` | correct |
| §0.3 transfer degree | `K(9)→K(3)` | 3 points → 1 point: transfer∘pullback 3, normalized `3·(1/3)=1`; ALS 9, normalized `3 ≠ 1` | Check added |
| §0.3 identity / empty | `K₁=K₂`; component outside the image | transfer `1·id`; extension by zero gives 0 | unchanged Checks hold |
| §0.3 `ℓ`-adic trace | split degree-`r` cover | trace∘pullback `= r` (EtaleCohomologyFoundations §0.8), including `r = 0` | consistent |
| §0.3 rational projection Check | `K(3)×K(3)→K(3)` | 1 point → 1 point, transfer is identity; `f_*(1)=1` for rational measures, `√2` otherwise | unchanged, consistent |
| §3.5 `k=2,3,4` | lowest `K`-types; cohomology; compact lifts | `(2,0,0),(3,0,0),(4,0,0)`; each `1,2,1`, total 4; compact lifts of dimension 1, 6, 20 (`21−1`) | holds for all `k` |
| §3.5 vs §3.4 | `k=3` | `(1,0,0) ↦ (1/2,−1/2,1/2,−1/2)`, not integral | parity stays in §§3.4, 5.4 |

## Ownership, overlaps, sources

**Owner of the new gap.** I chose ArithmeticLocallySymmetricSpaces (earlier in the merge order), as
the review asks. The contract is phrased for any closed `K_h ⊇ Z(ℝ)` with `K_h/Z(ℝ)` compact, which
makes it a statement about arithmetic quotients that does not need Shimura varieties.

**Other roadmaps searched** (by object, at their heads):

- ShimuraVarieties (#933): it makes cohomology of Shimura varieties downstream.
- HilbertModularVarietiesAndShimuraCurves (#1005), §R18.4.24b: it handles the same circle-fibre
  issue for compact quaternionic Shimura curves, in degree one on the non-norm cuspidal summand. That
  is a special case and does not cover our `d`, degrees or unitary groups.
- TorsionCohomologyInfrastructure (#1087): it covers only the `U(n,n)` similitude Zucker/Matsushima
  setting.

**Other new citations.** AlgebraicTopology §§2.6, 5.3 and EtaleCohomologyFoundations §0.8 are on
main. ShimuraVarieties §§1.6, 8.3 exist at #933.

**Overlap report.** It lists no dropped id or conflicting head. This package drops no id that others
cite.

**Sources.** No new source was fetched and `needs-references.toml` was not written.

## For the maintainer

- **ALS has a new supplier request.** ArithmeticLocallySymmetricSpaces now carries
  `gap:shimura-matsushima-comparison`, and the old `gap:compact-matsushima` is withdrawn.
- **HilbertModularVarietiesAndShimuraCurves** could cite this ALS contract in place of its own
  fibre comparison in §R18.4.24b.
- **No Lean names changed.**
