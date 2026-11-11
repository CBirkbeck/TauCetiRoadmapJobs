# FIX-PKG-PotentialAutomorphyDworkMotivesPartII~5

Repair of the four findings of REV-PKG-PotentialAutomorphyDworkMotivesPartII~4. All four were verified against the sources and the supplier roadmaps and are applied. Files changed: `packages/PotentialAutomorphyDworkMotivesPartII/README.md`, `Suggested.lean` (module docstring only), `design/plan.json` (top-level `gaps` only) and `sources.toml` (two locators).

## F01 (P2) — applied

Old → new: §9.10 built both `R_aux` and `S_UA` only for `m > 2`. Now §9.10 is `R_aux` (`m > 2`); §9.11 is `R_aux` (`m = 2`) with image, disjointness, splitting, reduction and residual conditions; the new §9.12 builds `S_UA` for all `n ≥ 1`, `m ≥ 2`, via the rank-`nm` Dwork family (`nm > 2`) or a level-`pq` twisted modular curve (`(1, 2)`).

Evidence: BCGNT25 line 1977 (§4.1 needs Dwork rank `> 2`); line 3293 (the `m = 2` case is left to the reader); lines 3318–3338 (the second switch); lines 3079–3083 (Proposition 6.2.3(13): rank-two image and projective disjointness).

Other places repaired for the same pattern:
- §9.7 gains (vi): local elliptic-curve data for `m = 2`.
- §9.5 is stated for any lisse torsion sheaf, so it applies to the universal elliptic curve.
- Also updated: the standing-data range, the Summary, the Layer 9 Dependencies and the `Suggested.lean` docstring (§§9.10–9.12).

New suppliers, both on main: EllipticCurves Layers 3–4 (reduction types, the `j`-criterion, Néron–Ogg–Shafarevich under potentially good reduction) and the existing modular-curve gap at level `pq`.

Section ids §9.10 and §9.11 keep their numbers; `S_UA` moves from §9.10 to the new §9.12. No roadmap on main, in an open pull request or on the board cites §9.10 or §9.11 of this package (searched), so no old→new table is needed.

## F02 (P3) — applied

Old (§0.5 Check): "For `n = 0` … no multiplier function exists."

New: rank zero does not determine the multiplier. Over `𝔽₉/𝔽₃` the empty matrix satisfies the equation for both `a = 1` and `a = 2`. Over `𝔽₄/𝔽₂` only `a = 1` is possible. In rank one, `M = 1` forces `a = 1`.

No other rank-zero multiplier claim exists in the package (searched).

## F03 (P3) — applied

Old (§7.2 proof): the grade "increases by one … because exactly one entry wraps around at each such step."

New: from `d` to `d + 1` the grade changes by `1 − w`, where `w` is the number of wrapping entries. At `d ≡ ab` with `b ∈ B` no entry wraps, so the grade goes up by one. At every other step exactly one entry wraps, so the grade is unchanged.

Added Check: `N = 5`, `a = (1, 0, 0, 0, 4)`, sums `10, 10, 15`, grades `1, 1, 2`, wraps `1, 0`. This matches QIAN23 lines 1002–1004.

## F04 (P1) — applied

Old → new: §9.8 claimed GlobalNumberFields Layers 9–10 construct characters of prescribed infinity type, and used PotentialModularityAndCompatibleSystems §3.1 for the determinant. Now `gap:cm-hecke-characters-with-prescribed-infinity-type` (GlobalNumberFields Layer 10; BLGGT14 Lemma A.2.4) supplies the character; §9.8 proves pair sums `m − 1`, prescribes local restrictions (§2.15), computes the determinant and extracts the root (§R02.4.6).

Verified: GlobalNumberFields (main, `Completed/`) Layers 9–10 define Hecke characters, infinity types and algebraicity, and prove purity. They contain no existence theorem for a prescribed infinity type. At the Tau Ceti pin, `Purity.lean:112`, `UnitCompatibility.lean:144` and `Algebraic.lean:60` all start from a given character. Searches of main and of the open heads found no owner.

Details:
- The gap is in `plan.json` `gaps` and in the README contract, with primary locator BLGGT14 Lemma A.2.4, p. 88 (line 4110).
- The determinant is computed from the Hodge–Tate weights. `η₀` is of finite order by PotentialModularityAndCompatibleSystems §1.9 (converse).
- ArithmeticGaloisDuality §R02.4.6 keeps `ψ` unramified only above primes where `η` is unramified at every place. So `Ψ₀` is now also prescribed unramified at the places above `q₁` other than the `wᵢ`.
- §3.1 is no longer used and is removed from Scope, the contract, Needs and Dependencies.

## Checks

- **`lake env lean` on `packages/PotentialAutomorphyDworkMotivesPartII/Suggested.lean`** (run from the content checkout): exit 0. The only warnings are the five `declaration uses 'sorry'` at lines 93, 112, 132, 151 and 186. There are no TauCeti imports, so no build was needed.
- **Signature check:** a scratch file with `#check @name` for all ten declarations plus `ZeroShapedDatum.injOn_nonzero` elaborated with exit 0. The types are identical to the recorded signatures; no declaration changed, only the docstring.
- **Dependency check** (output in full):
  ```text
  depcheck: 237 roadmaps, 2158 edges, 0 problem(s)
  ```
  There are no UPWARD, CYCLE or `moved:` lines.
- **`roadmaps resolve`:** no cross-roadmap citations and no Lean names found nowhere.
- **Files:** `plan.json` and `sources.toml` parse.

## Gate failures

- **tex=2** (README "Exact supplier contracts", the GlobalNumberFields line for `gap:cm-hecke-characters-with-prescribed-infinity-type`): the two TeX-style brace groups `a_{cσ}` and `σ(x)^{−a_σ}` were outside code spans. Now the three formulas are code spans without braces: `a_σ + a_(cσ) = w`, `(L ⊗ ℝ)^×` and `x ↦ ∏_σ σ(x)^(−a_σ)`. The `needs` of the same gap in `design/plan.json` carries the identical text, so the two still agree. The mathematics is unchanged. No other README line has TeX markup outside a code span.

## Adversarial pass (changed statements)

| Statement | Instances | Values | Result |
|---|---|---|---|
| §0.5 rank-zero Check | 𝔽₉/𝔽₃; 𝔽₄/𝔽₂; rank 1 | a ∈ {1,2} both valid; only a = 1; diagonal entry gives a = 1 | Check corrected |
| §7.2 step law | N=5, a=(1,0,0,0,4), d=1,2,3 | sums 10,10,15; w = 1,0; ΔG = 0,1 | agrees with the formula |
| §7.2 hypothesis | N=3, a=(0,0,0), d=1→2 | sums 3→6, w=0, 1∈B, ΔG=1 | ok |
| §7.2 negative control | N=7, a=(0,0,0,1,3,5,5), d=2→3 | 5 occurs twice; w=2; sums 28→21; ΔG=−1 | "exactly once" is needed |
| §9.5 general form | y²=t over ℚ₅ | 1+5ℤ₅ all squares; 2 not a square (squares mod 5 are 1,4) | neighbourhood, not the whole space |
| §9.7(vi) | y²=x³−x over 𝔽₅, 𝔽₇ | 8 points (a=−2, ordinary); 8 points (a=0, supersingular) | type is a real constraint |
| §9.8 pair sums | m=2; m=3 | (1,0),(0,1): sum 1; (2,0),(1,1),(0,2): sum 2 | compatible; (2,0),(1,0) fails |
| §9.8 local c's | m=2, Q≥3; m=3, Q=7; m=4, Q=11 | (1,−1); (1,2,4) sum 7≡0; (1,2,3,5) sum 11≡0 | distinct, nonzero, product one |
| §9.8 determinant | m=3 | HT of Ind {0,1,2}, sum 3; ε^{−3}η₀ψ^{−3} = ε^{−3} | ok |
| §9.10 multiplier Check | m=3 | ker(x↦x^{−2}) = {±1} | ok |
| §9.11(b) | J diagonal, p=5 | 120 vs 14400 | product needed |
| §9.11 good reduction | y²=x³−x over ℚ₂ | j=1728 integral, bad reduction | odd ℓ-torsion needed |
| §9.11 cyclotomic image | p prime to N, p split in L₂ | [F₂(ζ_N,ζ_p):F₂(ζ_N)] = p−1 | GL₂(𝔽_p) image |
| §9.12 determinant | (3,2); (2,3); (1,3); (1,2) | (ε^{−6})²(ε^{−1})³=ε^{−15}; (ε^{−3})³(ε^{−3})²=ε^{−15}; ε^{−3}; ε^{−1} | = ε^{−nm(nm−1)/2} |
| §9.12 form sign | m=2; n=2,3 | H(y,x)^c = −H(x,y); n=2 Hermitian, n=3 skew | as stated |
| §9.12 multiplier | (3,2) | ε̄^{−4}·ε̄^{−1} = ε̄^{−5} = ε̄^{1−6} | ok |
| §9.12(2) level datum | ρ = (H¹ mod p × H¹ mod q)^∨ | det ε̄_p, ε̄_q, so mod-pq cyclotomic | gap applies with r = pq ≥ 3 |
| gap statement | L imaginary quadratic; degree-4 CM | any (a, b) with constant pair sum; (2,0),(1,0) is excluded | hypothesis is necessary |

## Notes for the maintainer

- **New gap:** `cm-hecke-characters-with-prescribed-infinity-type` asks GlobalNumberFields, which is in `Completed/`, for a Layer 10 converse-to-purity theorem.
- **New supplier:** EllipticCurves (on main).
- **Changed names other roadmaps might cite:** §9.10 and §9.11 are retitled, and §9.12 is new. No other roadmap cites them.
- **Existence of reduction types is assumed:** §9.7(vi) takes as given that elliptic curves with ordinary and with supersingular good reduction exist over `ℤ_p` (and with ordinary reduction over `ℤ_r`). This follows ACC23 (proof of Theorem 7.1.11, p. 1105), which also assumes it. No supplier states it as a theorem; a reviewer may ask for a locator.
- **Ownership against open pull requests** was checked with `roadmaps grep` over all 440 open heads and main.
- **Sources:** no source fetch was needed and no missing-reference request was made. The BLGGT14 and ACC23 manifest locators were extended.
- **Untrusted text:** none of the material read contained instructions.
