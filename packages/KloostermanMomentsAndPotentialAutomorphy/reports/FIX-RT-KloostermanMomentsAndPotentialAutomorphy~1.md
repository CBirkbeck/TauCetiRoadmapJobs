# FIX-RT-KloostermanMomentsAndPotentialAutomorphy~1: repair of red-team round 1 (passes a and b)

Seven findings, six sections: 1a/F01 and 1b/F02 ask for the same headline and are settled once.

## RT-KloostermanMomentsAndPotentialAutomorphy~1a/F01, RT-KloostermanMomentsAndPotentialAutomorphy~1b/F02 (P2) — applied

The statable headline `momentSeries_coeff_dvd` (`k ≥ 1`, `p ≠ 2 ∨ Odd k`, every `n`:
`coeff n (momentSeries p k) = p^{n(n−1)}·c` for some `c : ℤ`) is added under Layer 11, with a module-docstring
line. §11.2's Corollary, which covered `p = 2` only, now states the combined result with the Lean name;
§9.1 names it for odd `p`. New Checks: `k = 0` negative control, `k = 13, p = 2`, `k = 9, p = 3`.

## RT-KloostermanMomentsAndPotentialAutomorphy~1a/F02 (P1) — applied

Confirmed: §2.5 used differential Galois groups with no carrier. DiophantineApproximationAndTranscendence
§5.4 (on main) now has a supplier contract, a Scope bullet, and appears in §2.5's Needs and in the
Layer 2 Dependencies. §2.5 states the groups as Picard–Vessiot groups and its proof sketch names its inputs:
analytic monodromy in `G`, the formal torus by restriction, and cover restriction through the
fixed-field correspondence. New Check: the closure of monodromy differs from `G`.

## RT-KloostermanMomentsAndPotentialAutomorphy~1a/F03 (P1) — applied differently

Confirmed: §8.1 cited a nonexistent "§5.2 ℓ-adic counterpart", and §8.2 credited CongruenceSpectralGap
§4.2b, which gives only rank, tameness at 0 and Swan conductor one. New target §1.6 covers the local
monodromy of `Kl₂` at `∞` at every prime, with the Swan conductors, inertia invariants and Frobenius
multiplicities `a_k, b_k` (Yun-moments). §§8.1–8.2 now cite §1.6.
Why it is applied differently: the review proposed a target for characteristic two only, with odd
primes left to §RD.7.21a. That does not work: §RD.7.21a gives the rank only for even `k`, and
`momentSeries_eq_intPolynomial` also needs the degree for odd `k` at odd `p`. The target sits in
Layer 1, the earliest place it fits; no section is renumbered.

## RT-KloostermanMomentsAndPotentialAutomorphy~1a/F04 (P3) — applied

All 11 bullets were checked; each only restated scope. Replacements:
- §4.1: Hodge types at `k = 2, 5`, and the pairing parity at `k = 6, 7`.
- §4.5: the Frobenius eigenvalue `−2` before the Tate twist, and `−4` after it.
- §6.3: the degenerate critical point of `k = 2`.
- §6.5: the filtration at `k = 2`.
- §7.1: the computation over `𝔽₂` and the interior node.
- §11.1: purity at `p = 2` for `k = 5`, and ramification at `p = 3` for `k = 6`.
- §11.2: `N` at `k = 6, p = 3`.

The same pattern also occurred in §3.2, §8.3, §9.1 (two bullets) and §11.3; those bullets were replaced in the same way.

## RT-KloostermanMomentsAndPotentialAutomorphy~1b/F01 (P1) — applied

Confirmed with an independent proof. §7.3 claimed an isomorphism on χ-parts; it now says that
`π^*: H^{k−1}_c(K)^χ → H^{k−1}_c(K′)^χ` is surjective, with kernel `H^{k−2}(T)^χ` of dimension `δ_{4∣k}` and
weight `k − 2`. The χ-part of `E₂^{1,k−2}` is zero. The `k = 4` and `k = 6` Checks are recomputed. The
§7.4 statement now reads `gr^W_{k−1}`, and a sentence is added to the §8.4 proof sketch. The FSY
erratum is recorded.

Evidence (the review's computation, reproved independently):
1. The localization sequences give `H^{k−2}_c(K′) → H^{k−2}(T) → H^{k−1}_c(K) → H^{k−1}_c(K′) → 0`.
2. The decomposition theorem gives `π_*IC_{K′} = IC_K ⊕` skyscrapers on `S`. Perverse Artin vanishing on
   the affine `K` gives `H^{−1}_c(K, IC_K) = 0`.
3. A linear section inside a quadric restricts to `−h^{(k−2)/2}`. So the restriction map has image
   `⊕ℚh^{(k−2)/2}`, which has no χ-part.
4. The stabilizer acts on the primitive class by `sgn` on `S_{k/2}×S_{k/2}` and by `+1` on `(σ₀, −1)`,
   because a similitude of multiplier `−1` with determinant `(−1)^{k/2}` is proper. Since
   `χ(σ₀, −1) = (−1)^{k/2}`, `dim H^{k−2}(T)^χ = δ_{4∣k}`.

The same argument works over `𝔽̄_p`, using `IC_{K′}` because `K′` keeps its positive-`b` nodes.
§9.1 never stated the isomorphism, so it was left unchanged.

## RT-KloostermanMomentsAndPotentialAutomorphy~1b/F03 (P3) — applied

Confirmed at the heads:
- PadicHodgeTheory §5.1 imports `deRham_iff_potentiallySemistable` from another roadmap, and §5.2 is the
  Robba-modification equivalence.
- The two theorems actually used are owned elsewhere: `deRham_iff_potentiallySemistable` by
  NoncommutativeAndEquivariantIwasawa §F.6 (stage 3), and `dSt_isWeaklyAdmissible` and
  `isWeaklyAdmissible_iff_polygon` by FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.2–R07.3.3.

These owners are now cited in Scope, in a new supplier contract, in the §11.2 proof sketches and Needs,
and in the Layer 11 Dependencies. PadicHodgeTheory is kept for §§3.2 and 5.3.

## Checks run

- **Elaboration.** `lake env lean packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean`
  (run from the content checkout) gives five `declaration uses 'sorry'` warnings, at lines 95, 114, 196,
  206 and 221. There are no errors.
- **Signatures.** All 22 declarations were checked with `#check @name` in one scratch file. The new
  `momentSeries_coeff_dvd` elaborates to
  `∀ (p : ℕ) [Fact (Nat.Prime p)] (k : ℕ), 0 < k → p ≠ 2 ∨ Odd k → ∀ n, ∃ c, coeff n (momentSeries p k) = ↑p ^ (n * (n - 1)) * ↑c`,
  which matches §11.2. There are no section variables, and the other 21 signatures are unchanged.
- **Dependency check** (output, verbatim):

```text
depcheck: 240 roadmaps, 2189 edges, 0 problem(s)
```

  There is no UPWARD or CYCLE line. Every new supplier is either on main
  (DiophantineApproximationAndTranscendence) or earlier in the merge order:
  NoncommutativeAndEquivariantIwasawa is at line 30, FiniteFlatGroupsAndIntegralPadicHodgeTheory at 66,
  EtaleDualityAndPerverseSheaves at 108 and ArithmeticGaloisRepresentations is in the allowed list;
  this roadmap is at line 310.
- **Citation resolver.** `roadmaps resolve` on the README finds no unresolved cross-roadmap citation and
  no unresolved Lean name.
- **Sources.** Yun-moments (arXiv:1308.3920v2) was added through `sources fetch` and is certified as
  open-repository. Its key is new: no manifest on the board had this work. No text is missing, and
  `needs-references.toml` was not written.
- **Gate failures.** None were listed for this round.

## Adversarial pass (new or changed statements)

Values come from exact finite-field moments. The `Z_k(p;T)` coefficients were computed for:
- `p = 2`: `k ≤ 20` and even `k ≤ 40`;
- `p = 3`: `k ≤ 14`;
- `p = 5`: `k ≤ 10`.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `momentSeries_coeff_dvd` | all ranges above; `n = 0, 1`; `k = 0` | `p^{n(n−1)} ∣ c_n` in every case, e.g. `Z₁₃(2)`: `v₂ = 0,0,2,6,12,20,30,42`; `Z₉(3)`: `0,0,3,10 ≥ 0,0,2,6`; `Z₁₂(3)`: `0,6,12,18`; exponent `0` at `n = 0,1`; `k = 0`: `c₂ = p²−p`, `v = 1 < 2` | holds; `hk` necessary; `p = 2`, even `k` holds numerically but is not asserted (not proved in FSY) |
| §1.6 Swan = `momentDegree` | `p = 2`, `k ≤ 20` and even `k ≤ 40`; `p = 3`, `k ≤ 14`; `p = 5`, `k ≤ 10` | `deg Z_k` equals the formula in every complete case; `p = 3, k = 6`: `(7 − 3)/2 = 2` | holds |
| §1.6 inertia invariants and `a_k`, `b_k` (`p = 2`) | even `k ≤ 40` | multiplicities of the roots `±2^{−k/2}` equal `(a_k, b_k)`, e.g. `k = 24: (2,1)`, `k = 36: (2,2)`; `deg M = ⌊(k+2)/4⌋−1−a_k−b_k = 2⌊(k+2)/12⌋−2δ_{12∣k}` | holds; Yun Lemma 4.3.4's twist `(d/2)` gives `±2^{−d/2}` and is refuted, so it is recorded as a misprint |
| §1.6 invariant dimension at odd `p` | `p = 3`, even `k ≤ 14`; `p = 5`, even `k ≤ 10` | number of roots of absolute value `p^{−k/2}` equals `⌊k/2p⌋+δ_{4∣k}` (e.g. `k = 12, p = 3`: 3), with FSY (5.3) signs | holds |
| §1.6 lower filtration (`p = 2`) | `Sw(Kl₂)` | `2/3+2/12+2/12 = 1`; a filtration with one more step gives `7/6` | holds |
| §8.1 weights | all ranges above | middle roots have `|α|²/p^{k+1} = 1.0`; the other roots are `1` and `±p^{k/2}` | holds |
| §7.3 open comparison | `k = 4, 6, 8` | stabilizer signs: `χ(σ₀,−1) = +1, −1, +1`, action `+1`; `dim H^{k−2}(T)^χ = 1, 0, 1`; `k = 4` stabilizer `(S₂×S₂)·⟨(13)(24),−1⟩`, the explicit rulings `a = tc, e = −tb` are preserved | the kernel is `δ_{4∣k}`-dimensional, so the printed isomorphism is false for `4∣k` |
| §7.3 restriction image | `k = 4` (`d = 1`), general `d ≥ 1` | `[Z]∪e(N) = −deg·h^d`; IC stalk at a node in degree `n−1` has dimension 1 (link `S^{n−1}`-bundle over `S^n`), skyscraper dimension `2−1 = 1` | the image is the line spanned by `h^d` |
| §2.5 carrier | `r = 2` | closure of monodromy = `𝔾_a` (dimension 1), `G = SL₂` (dimension 3); `y′ = y`: `G = 𝔾_m`, monodromy trivial | the carrier is needed; the Check was added |
| §4.1 new Checks | `k = 2, 5, 6, 7` | types `(3,3)`; `(2,4),(4,2),(6,6)`; parity `(−1)^{k+1} = −1, +1` | agrees with FSY Theorem 1.8 |
| §4.5 new Check | `k = 3, p = 2` | `−2·2 = −4`, weight `2 → 4` | agrees with `M₃(2) = 1+4T` |
| §6.3 / §6.5 new Checks | `k = 2` | `(1,−1,1)` is critical; `F² = F³` is a line and `F⁴ = 0` | agree with the theorems |
| §7.1 new Checks | `k = 2` | `g₁(1,0) = 2 = 0` in `𝔽₂`, `∂g₁/∂z₁ = 1`; `(1,−1)` gives `g = 0` and both derivatives `0` | agree |
| §8.3, §9.1, §11.1–§11.3 new Checks | `(5,3)`, `(6,5)`, `(5,2)`, `(6,3)`, cubic `χ` mod 7 | `Z₅(3) = (1−T)(1+27T)`; `Z₆(5) = (1−T)(1−150T+78125T²)`, `v₅ = 0,0,2,7`; roots `2±2√−15`, `|·| = 8`; eigenvalues `−27/−81`, product `3⁷`; `τ(χ)³ = 7J`, `J` not real | agree |

There are no `variable` blocks. The README and the Lean generality agree for the one changed declaration.

## Ownership and notes for the maintainer

- **§1.6 ownership.** §1.6 is owned here. `roadmaps grep` over main and every open head finds no other
  owner of the rank-two local monodromy at `∞` (searched by object: binary tetrahedral image, Swan
  conductor of `Sym^k`, inertia at `∞`, Fu–Wan).
  - KloostermanSheavesAndBesselIsocrystals §6.5 (later in the merge order, a consumer) treats general
    `H` with `p ∤ |W_H|`. It may cite §1.6 for `H = SL₂`, including `p = 2`.
- **Picard–Vessiot carrier.** The owner is DiophantineApproximationAndTranscendence §5.4, on main. No
  open head defines a second carrier.
- **Ids and names.** No id was renumbered or deleted, and no Lean name changed.
  - §1.6 is new.
  - KloostermanSheavesAndBesselIsocrystals cites §§1.1, 1.3, 2.1 and 2.5–2.6; those ids are unchanged.
    The claim of §2.5 is unchanged; it now names its carrier.
- **Source errata recorded in the README.**
  - FSY (5.18) and (5.20), proof of Theorem 5.17: the printed isomorphism is false on χ-parts when
    `4 ∣ k`.
  - Yun-moments Lemma 4.3.4: the twist `(d/2)` should be `(−d/2)`.
- **Further erratum, not cited.** Yun-moments Lemma 4.2.2 (odd `p`) asserts that Frobenius acts by
  `+p^{d/2}` on `V^{I_∞}`. The computed `Z₆(3;T) = (1−T)(1+27T)` shows `−27`, in agreement with FSY (5.3)
  and §RD.7.21a. The README does not cite that eigenvalue claim, and §1.6 relies on Yun only for the
  structure at odd `p`.
- **Untrusted text.** No suspicious instructions were found in the reviews or in the fetched texts.
