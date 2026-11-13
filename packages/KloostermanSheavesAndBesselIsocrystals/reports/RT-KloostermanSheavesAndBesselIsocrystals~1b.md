<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13150#issuecomment-6857279230 -->
Red team round 1 pass b (claude) of 2531294

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) `orthogonalSum_sub_card_eq_convolution` is an elementary reindexing, not a headline

   **Location.** `packages/KloostermanSheavesAndBesselIsocrystals/Suggested.lean:152-161`; README §11.1,
   `README.md:2208-2212` ("(iii) is §9.4 in odd characteristic and, at `p = 2`, follows from (i) and the convolution
   property"); README §11.5, `README.md:2350` ("the identity (iii) of §11.1 hold at `p = 2`").

   **Claim.** Identity (iii), `U_N(a) − |F| = Σ_{uv=a} (R₂(u)² − |F|) R_{2N−2}(v)`, is presented as a headline
   "obtained from the comparison of Bessel F-isocrystals for different groups" (module docstring, lines 12–13), with
   a route through §9.4 (odd `p`) and §10.6 (`p = 2`).

   **Witness.** It needs nothing the roadmap builds. Write `R₂(u)² = Σ_{x₁,x₂} ψ(x₁ + x₂ + u(x₁+x₂)/(x₁x₂))` and
   `R_{2N−2}(a/u) = Σ_{∏y = a/u} ψ(Σy)`; summing over `u` with `u = a/∏y` gives exactly
   `Σ_{uv=a} R₂(u)² R_{2N−2}(v) = U_N(a)`. Then `Σ_v R_{2N−2}(v) = (Σ_{x∈F^×} ψ(x))^{2N−2} = (−1)^{2N−2} = 1`
   (Mathlib `AddChar.sum_eq_zero_of_ne_one`), so the `|F|` terms agree. Two reindexings and one orthogonality
   lemma; valid in every characteristic, for every nontrivial `ψ`, and for `N ≥ 1` (at `N = 1`, `R₀(v) = [v = 1]`:
   over `𝔽₂`, `U₁(1) − 2 = −1 = (R₂(1)² − 2)·1`). The hypothesis `2 ≤ N` is not needed. Recomputed numerically
   for `N = 2, 3` over `𝔽₂` and `N = 2` over `𝔽₃, 𝔽₄, 𝔽₅`: all instances agree. Consequently (i) for general `n`
   follows from Carlitz's `n = 1` case, and (ii) from Katz's `n = 1` case, by (iii) and the elementary convolution
   of raw sums; (i) and (ii) remain genuine headlines (their `n = 1` cases are not formal).

   **Repair.**

   1. Delete `orthogonalSum_sub_card_eq_convolution` from `Suggested.lean` (the README keeps the statement). In
      the module docstring, the statable headlines are then the two identities (i), (ii) of README §11.1, the
      ordinarity statement of §11.3 and the signed congruence of §10.2; no other line changes.
   2. README §11.1: remove the backticked name from (iii), state it for `N ≥ 1`, and replace its route by:
      "(iii) is elementary and uses no other target: substituting `u = a/∏_i y_i` gives
      `U_N(a) = Σ_{uv=a} R₂(u)² R_{2N−2}(v)`, and `Σ_v R_{2N−2}(v) = (Σ_{x ∈ F^×} ψ(x))^{2N−2} = 1` for nontrivial
      `ψ` (Mathlib `AddChar.sum_eq_zero_of_ne_one`). It is the trace form of §9.4 and reduces (i) and (ii) for
      general `n` to their `n = 1` cases." Remove §9.4 and §10.6 as inputs of (iii) (they stay inputs of (i), (ii)).
   3. README §11.5: delete "and the identity (iii) of §11.1" from the list of statements extended to `p = 2`
      (the object-level convolution isomorphism stays); (iii) already holds at every `p`.
   4. Docstring cross-references to "§9.4 and §11.1" for the convolution disappear with the declaration.

2. **F02** (P2) §6.4 uses "Swan `1`" for the standard object of `SL_{2n+1}` with no owner

   **Location.** README §6.4, `README.md:1526-1532`: "a proper image `SO_{2n+1} ⊂ SL_{2n+1}` would make the standard
   Swan conductor at `∞` even, contradicting Swan `1`"; `*Needs:* §§2.8, 4.3, 6.1–6.3, 2.9;
   KloostermanMomentsAndPotentialAutomorphy §§1.1, 1.3`.

   **Claim.** The Swan conductor at `∞` of `Be†_{SL_{2n+1}, Std}` is `1`, taken as known inside §6.4.

   **Witness.** No listed input gives it. §6.3 bounds only the adjoint irregularity. The supplier facts (Swan one
   of the scalar sheaf, CongruenceSpectralGap §4.2b) concern `Kl_r`, and the identification of the standard object
   with `Kl_r` is §8.1, whose `*Needs:*` contains §7.4, which needs §6.4 (`README.md:1688`, `1763`): read from
   there it is a cycle §6.4 → §8.1 → §7.4 → §6.4. The source proves it differently: XZ line 2463–2465 (proof of
   Theorem 4.5.2, case (b)) combines Lemma 4.5.3 with Baldassarri's bound.

   **Repair.** In §6.4, after "(Xu–Zhu (4.1.10.5)), normalized to a `μ₂`-descent cocycle", replace "and a proper
   image … contradicting Swan `1`" by: "the standard object of `SL_{2n+1}` has Swan conductor exactly `1` at `∞`:
   by gap:formal-slope-comparison every `p`-adic break is at most the formal slope `1/(2n+1)` of the rank-`(2n+1)`
   connection, so the irregularity is at most `1`, it is an integer equal to the Swan conductor (§RD.6.52), and it
   is nonzero because wild inertia acts nontrivially through the faithful standard representation (§6.2); a proper
   image `SO_{2n+1} ⊂ SL_{2n+1}` would descend the object along the double cover and make this conductor even."
   Add `gap:formal-slope-comparison` and `PadicDifferentialEquationsAndRigidCohomology §§RD.1.17–RD.1.19, RD.6.52`
   to the `*Needs:*` line of §6.4. Tested on the refuting instance: for `SL₃`, `p` odd, the bound is
   `3 · (1/3) = 1`, nonzero by §6.2, hence `1`, with no use of §8.1.

Two findings: one P2 (an input of a proof plan that no `*Needs:*` line owns, with a hidden cycle if it is
read from the nearest owner) and one P3 (a `Suggested.lean` theorem that is an elementary reindexing, with the
README route that hides this). No false statement was found: every Lean statement and every numerical Check
that could be evaluated was recomputed and agrees.

## The pass: computed record

Declarations of `Suggested.lean` (no `variable` block; every binder is in the declaration's own signature;
compared with the elaborated types in the worker's signature list: nothing lost).

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `dworkBlock` | `p = 2, m = 1, s = 2`; `p = 2, m = 0, s = 1, B = 1` | indices `4..7`; `1 + x` | matches README §10.1 | none |
| `signed_dwork_congruence` | `B = 1, u = 1`; constant `F` (`r = 3, 5`); `G`; alternating pair; `s ≤ 3, m ≤ 2, N ≤ 40` over `ℤ_(2)` | `B = 1`: both products equal, difference `0`; least `v₂` of nonzero quotient by `2^s B⁽ˢ⁺¹⁾(m)`: `0` (`F`), `1` (`G`), `3` and `2` (pair, `r = 3, 5`) | holds; `2^s` sharp; agrees with XZ line 3058–3059 | none |
| (c′) signs | `F`, `G`, pair; `i < 5, s < 4, m < 4, n < 12` | `F`: `u(i,1,m) = (−1)^m`; `G`: all `+1`; pair: `u(0,1,m) = 1`, `u(1,1,m) = (−1)^m`; `u = 1` for `s ≠ 1` | as README §10.1, §10.4 | none |
| `hc` at `m = 0` | `a = n = 0` | `(1 − u(i,s,0))·unit ∈ 2^{s+1}R` forces `u(i,1,0) = 1` | consistent, not contradictory | none |
| `kloostermanSum` | `k = 0, 1`; `𝔽₂`, `𝔽₃` | `k = 0`: `[a = 1]`; `𝔽₃`: `R₂(1) = −1`, `R₂(2) = 2` | as README | none |
| `orthogonalSum` | `n = 1` over `𝔽₃`; `n = 2, 3` over `𝔽₃`; `n = 2` over `𝔽₄` | `U₁ = 1, 4 = R₂²`; `U₂ = 7, −2`; `U₃ = −11, 16`; `U₂(𝔽₄) = −7, 25, −7` | as README §8.5, §9.4, §11.1 | none |
| `quadraticCharIn`, `quadraticHypergeometricSum` | `𝔽₃`, `N = 0, 1, 3` | `H₀ = ζ², −ζ`; `H₁ = 0, i√3`; `H₃(1) = 2i√3`; `g = −i√3`; `g(𝔽₉) = 3` | as README | none |
| `traceChar` | `Algebra (ZMod p) L` without scalar tower | Mathlib `Subsingleton (Algebra (ZMod p) R)` (`Mathlib/Algebra/Algebra/ZMod.lean:23`) | no ambiguity | none |
| `orthogonalSum_sub_card_eq_kloostermanSum` | `𝔽₂` (`n ≤ 3`), `𝔽₄` (`n ≤ 2`), `𝔽₈` (`n = 1`), all `a`; character shift `ψ(c·)` | all equal; under `ψ(c·)`: left becomes `U(ac^{2n})`, right `R(ac^{2n+1})`, so only `ψ₀ ∘ Tr` works | true as typed (restricted to `traceChar`) | none |
| `gaussSum_mul_orthogonalSum_sub_card` | `𝔽₃` (`n ≤ 2`), `𝔽₅, 𝔽₇, 𝔽₉` (`n = 1`), all `a`, two characters each | all equal; shift rule: both sides pick up `ρ(c)` and `a ↦ ac^{2n}` | true for every nontrivial `ψ` | none |
| `orthogonalSum_sub_card_eq_convolution` | `𝔽₂` (`N = 2, 3`), `𝔽₃, 𝔽₄, 𝔽₅` (`N = 2`); `N = 1` | all equal; proved by two reindexings | true, elementary | R01 |
| `orthogonalSum_ordinary` | `p = 2, F = 𝔽₂, n = 1`; odd `p`, `n = 1`; sign bookkeeping | `β = α², 2, β̄²` with `α + β̄ = −1`, `αβ̄ = 2`: norms `1, ‖2‖, ‖2‖²`; odd `p`: `U − |L| = Σ (γ_i/(−g))^m` by Hasse–Davenport, slopes `(i + 1/2) − 1/2` | consistent with §§9.2, 11.2 | none |

README targets (65 subsections read; values computed where the target has a formula or a Check).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, rank-one dictionary | `exp(π(t − t^p))` against `d ∓ π dt`; Kummer `A = −a` | log-derivative `π(1 − pt^{p−1})` = required for `d − π dt`; `C = x^{−(q−1)a}` | agrees with §RD.6.48 (`ε = −1`) | none |
| §0.1 normalization | `q = 2, 3, 4` | `−1/√2, 1, −1/2`; `1/√3`, `√3 ∉ ℚ₃(μ₃)`; `c₄^{−2} = 1/4` | Checks true | none |
| §1.2 hyperbolic localization | `𝔸²`, weights `(1,−1)`, `(1,1)` | both sides `K[−2](−1)`; `K[−4](−2)` | direction and shifts correct | none |
| §2.8 table and rigidity | `SL₂`; centralizers | `h¹ = 1 − 1 − 0`; table rows against FG Corollary 10 | holds; FG misprints recorded below | none |
| §2.9 | `SL_r` | `ψ(c·)` pulls back by `c^r = c^h`; odd rank duality by `x ↦ −x` | consistent | none |
| §4.3–4.5 | `SL₂`, `C(0) = diag(c_q^{−1}, c_q)` | `NC(0) = qC(0)N` (entry `c_q`); `δΦ = ΦA − qA(x^q)Φ`; `Ad((2ρ)(√−1))` gives `(−1)^h` | conventions consistent | none |
| §6.3 | exponents of `A₂`, `B₂`, `G₂`; `p = 2` | `3 + 5 = 8`; `e − ⌊e/p⌋ ≥ 2` fails only for `A₁`, and `A₂` at `p = 2` | exception list correct | none |
| §6.4 | source of Swan `1` | not in `*Needs:*`; §8.1 route is circular | unowned | R02 |
| §6.5 control | `𝔽₅((t))`, `u⁴ = t`, `z⁵ − z = u^{−2}` | `v(u(2z+1)) = 3`, `D₁ = D₂ = C₅`, break `1/2`, `b(Ad) = 1`; `τστ^{−1} = σ^{−1}` | Check true | none |
| §7.1 centralizers | `G₂ ⊂ SO₇`, `Sp_{2n} ⊂ SL_{2n}`, `SO_{2n+1} ⊂ SO_{2n+2}`, `F₄ ⊂ E₆` | `1`, `μ_{2n}`, `±1`, `μ₃`: each `Z(H)` | holds | none |
| §7.3 Check | `p = 2`, rank two | `v₂(4^j/(j!)²) = 2s₂(j)` | radius `1` | none |
| §8.2 | `n = 1` odd, `n = 3` even | form equations hold entrywise; `N(e₃ − e₄) = 0`; operator `δ³ − λ²x(4δ + 2)`; coefficients `(2r−1)!!(2λ²)^r/(r!)³` | holds | none |
| §8.3, §8.5, §8.6 | `𝔽₂` (`n = 3, 4`), `𝔽₃`, `𝔽₄` | `7/8 − (−1/8) = 1`; chart sums `3`; `13, 4`; `5, 37, 5`; `13, 40` | corrected constant `Q^{n−1} − Q` consistent with (i) | none |
| §9.1–9.3 | `n = 1, m = 0`; `(2n+1, 1)` | operator `δ + πx` is `d − π dx`, trace `ψ`; trace `H/((−c_q)^{n−1}∏g_j)`; `x ↦ x/4` gives `δ^{2n+1} − π^{2n}x(δ + 1/2)` | Miyatani's sign `(−1)^{n+mp}` matches Miy line 73 | none |
| §9.4, §11.5 | `𝔽₃` and `𝔽₂`, `n = 2`, `a = 1` | `−4/9` against `4/9`; `1/4` against `−1/4`; rank `(2n−2) + 3` | shift `[1]` correct | none |
| §10.3, §10.5 | `B = 1`; `c = q^n/f` | `f = (1 − x^p)/(1 − x)`; `c′ + ηc = qx^{q−1}cη(x^q)` | holds | none |
| §11.2 | `n = 1`, `d = 1, 2`; `f₁` summed over `z` | bipyramid, three facets of determinant `±d`, volume `d/2`; `S(f₁) = q·R_{2n} − 1`, slopes `0..2n`; `S(f₂) − S(f₁) = H_{2n+1}(a)` | holds | none |

## Verified sound

- Declarations read: 11 of 11 (5 theorems, 6 definitions), every line of `Suggested.lean`; single `import
  Mathlib`, no `set_option`, no sorry'd data, `theorem` only. Elaborated types compared with README statements
  for all 11: no binder lost. Library near-matches (11 lists) give no pinned proof of a target.
- Targets read: 65 subsections of Layers 0–11, every line of the README. Each definition has at least three
  Checks; every target has a locator; no forward reference other than R02.
- Numerical Checks recomputed: about 40, all correct (table above).
- Locators verified against the cached texts: 42 in XZ, 11 in HNY (printed page = cached page + 240), 7 in FG,
  6 in Zhu, 13 in Miy, 5 in GR, and Car (4), VL Proposition 2.1, DAd Theorem 1.2.1 and §4.3, Spe80 (2.35),
  AC 1.3.13, LT Theorems 1.8/7.10, PRW §3.3 and Theorem 3.2, Dw69 Theorems 2–3, Tsu Theorem 1.3: over 90 in
  all, none wrong.
- Sibling citations checked at current heads: KloostermanMomentsAndPotentialAutomorphy §§1.1, 1.3, 2.1, 2.5, 2.6
  (board package; the "found nowhere" lead for §2.6 is a false positive); CongruenceSpectralGap §§4.2a–4.2b and
  `hyperKloosterman F k ψ r`; CharacterSumsOverFiniteFields §3.3 `hasseDavenport_lift`;
  GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.3, 0.14, 1.1–1.6, 1.8, 1.9, 1.12;
  PadicDifferentialEquationsAndRigidCohomology, 62 section ids (all present; RD.6.64 is mapped by its owner to
  §RD.2.52, so the citation stands); PartII MS.4 (MS.4.6–MS.4.8); BunGAndNewtonStrata §§1.5, 1.22;
  MotivesAndAlgebraicCycles §§6.1–6.3, 6.5; DeligneWeightsAndPurity §§8.5, 8.12, 8.14, 8.19;
  FormalConnectionsOpers F2, F4, F6; AffineLieAlgebras A7–A8; SpringerResolutionAndCharacteristicCycles §§8.1–8.6,
  9.1, 9.2, 9.4, 9.6, 9.7; ReductiveGroups Layers 1, 7, 9, 10; ReductiveGroupsPartII RG2.3.3, RG2.3.6, RG2.4.1;
  OrthogonalSpinGroups Layers 0–1: 119 ids, none missing.
- Pinned declarations: the 11 lemma and definition names of the Mathlib contract that are not basic carriers,
  and the 4 Tau Ceti names, exist at the pins;
  no Kloosterman, isocrystal or Hasse–Davenport declaration exists there, as the README says.
- Gaps: the 11 slugs of `design/plan.json` are the 11 stated in the README, each with a named supplier.
- Ownership against open pull requests: searched by object (Frenkel–Gross, Bessel F-isocrystal, Heinloth,
  Miyatani, Dwork congruences, Gross–Reeder, simple wild, universal local acyclicity, Braden, arithmetic
  D-modules). No second owner. GlobalShtukasAndFunctionFieldLanglandsPartII is a consumer and cites the former
  `KB.k` labels, all of which the README's mapping table covers. `orthogonalSum` occurs in lattice roadmaps under
  other namespaces and for another object; no fully qualified name collides.
- Policy: `git diff --stat origin/main...HEAD` touches only the package folder; no pull-request numbers, no
  machine paths, no `lemma`.
- Dependency check output: `depcheck: 223 roadmaps, 1985 edges, 0 problem(s)` (no UPWARD, CYCLE or `moved:` line).

## Not verifiable

- AS89, Wan93, Wan04, Bal82, DH35, ESDE, KatzCC: uncertified, cited by locator only; the statements of the
  toric gaps, of the formal-slope gap and of §9.1's zero spectrum were checked for internal consistency
  (§11.2 table row), not against the texts.
- The Hodge numbers "`1` at each `j/d`" of §11.2 were checked only through the resulting Newton slopes for
  `d = 1` and the degree count, not by enumerating lattice points.
- The geometric targets of Layers 1–3 (cleanness, relative specialization, the quasi-minuscule middle image)
  have no computable instance beyond the rank and degree counts recorded; their corrections of XZ Lemma 4.2.6
  were read for coherence only.
- No Lean elaboration was run in this pass; the worker's elaborated signatures were used.

## Source issues

- **Misprint** in FG at Corollary 10, p. 28 (FG line 1239): the source says type `D_{2n+1}` with `n ≥ 4` has group of type `B_n`; it should be type `D_{n+1}`; affects a stated result.
- **Misprint** in FG at Proposition 11, (14.1), p. 29 (FG lines 1267, 1271): the source subtracts the invariants of inertia at `0` twice; it should subtract those at `0` and at `∞`, as the display before it has; affects a stated result.
- **Misprint** in XZ at proof of Lemma 4.5.5, p. 53 (XZ lines 2440–2441): the source indexes the adjoint summands so that the exponents are one more than the half-degrees; it should take half-degrees equal to the exponents; affects the proof.
- **Error** in XZ at Proposition 5.3.5(ii), (5.3.5.2), p. 59 (XZ line 2782): the source says the additive constant is `(q − 1)q^{n−2}`; it should be `q^{n−1} − q` (they differ from `n = 4`); affects a stated result.
- **Misprint** in XZ at proof of Proposition 5.3.8(i), p. 61 (XZ line 2890): the source lists the middle Frobenius eigenvalue at `0` as `0`; it should be `1`; affects nothing.
- **Error** in XZ at (1.2.9.1), case `p = 2`, p. 6 (XZ line 305): the source puts a factor `−1/√q` before the three-variable sum; it should have no factor (over `𝔽₂`: `−1` against `1/√2`); affects a stated result.
- **Error** in XZ at (1.2.9.2), p. 7 (XZ line 332): the source's right side is `−1/√q` times the toric sum minus `q^{n−1}`; it should be the toric sum minus `q`, with no factor (over `𝔽₂`, `n = 2`: `−1` against `1/√2`); affects a stated result.
- **Error** in XZ at Lemma 4.2.6(i), p. 44 (XZ line 2057): the source says the shifted direct image from the smooth part of the quasi-minuscule family is holonomic; for `PGL₂` its first cohomology object has rank one, so only the degree-zero map should be used; affects the proof.

## Copyright, licences and scope

- Wording: the README and `Suggested.lean` were compared mechanically with all 17 cached texts for shared runs
  of seven or more words, and by hand at XZ lines 994 (§1.2), 2918–2931 (§5.1), 3042–3059 (§10.1–10.2),
  2425–2450 (§6.3), GR lines 1302–1312 (§6.5), Miy lines 64–82 (§9.1) and VL lines 274–281 (the Newton gap).
  Every shared run of seven or more words is a bibliographic title. The longest run in a statement is six words
  (GR Proposition 5.6, a list of four conclusions in standard terms). No finding.
- Arrangement: XZ has the largest share. Its sections against the layers: Layer 1 ↔ §§2, 3, 4.1 together;
  Layer 2 ↔ §4.3; Layer 3 ↔ §4.2; Layer 4 ↔ §4.4; Layer 5 ↔ part of §5.4; Layer 6 ↔ §4.5; Layer 7 ↔ §5.1;
  Layer 8 ↔ §5.3; Layer 9 ↔ §5.2; Layer 10 ↔ Appendix A; Layer 11 ↔ §§1.2.9, 5.3.10–11, 5.4(ii). The map is
  not one to one and not in order (three sections merged, two pairs exchanged, §5.4 split across Layers 5 and
  11); the order kept is forced by `*Needs:*` (§4.1 needs §§2.7, 3.5; §6.4 needs §4.3; §7.1 needs §6.4; §10.5
  needs §5.3). No finding.
- Reuse: no table, figure or example list is taken over; the monodromy table of §2.8 is restated in prose with
  two corrections. No public formalisation with matching names was found.

Source independence: 7 passages compared by hand and all 17 cached texts scanned for shared seven-word runs, none shared outside bibliographic titles; largest share XZ, 96 of about 170 locators; contents compared with XZ: independent.

## For the human reviewers

- **Licence.** BD (`sources.toml` id `BD`) is an unpublished, author-hosted preprint; it is cited once, for §1.3 (§5.3 of the text), README line 2424.
- **Not tested.** Seven sources are uncertified and were not read: AS89, Wan93, Wan04, Bal82, DH35, ESDE, KatzCC; four declared gaps rest on the first four.
- **Scope.** After R01, `Suggested.lean` states four theorems; nine headline results are named as not statable in its module docstring (lines 17–45).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2531294283fdfa135e58332570000f90627fddd1", "job": "RT-KloostermanSheavesAndBesselIsocrystals~1b", "model": "fable", "worker": "chris-x13"} -->
