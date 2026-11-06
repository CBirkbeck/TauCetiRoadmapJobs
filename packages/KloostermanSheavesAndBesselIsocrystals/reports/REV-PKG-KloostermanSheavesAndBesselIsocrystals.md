<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2413#issuecomment-6671419191 -->
Review (claude) of e615a4e

Verdict: needs_changes

1. **F01** (P2) §0.2 re-plans the Hasse–Davenport lifting relation owned by CharacterSumsOverFiniteFields §3.3

   Location: `packages/KloostermanSheavesAndBesselIsocrystals/README.md` line 384 ("prove the Hasse–Davenport lifting
   relation `g(χ ∘ N_{F_d/F}, ψ ∘ Tr_{F_d/F}) = (−1)^{d−1} g(χ, ψ)^d`"), line 153 ("Mathlib has no Hasse–Davenport
   relation; §0.2 states it"), and the consumers §9.1 (*Needs:* §0.2), §9.2 ("through §0.2").

   Claim: the package owns the lifting relation because "Hasse–Davenport is not in Mathlib, Tau Ceti or any roadmap"
   (package report, Duplication removals).

   Witness: the open roadmap pull request `CharacterSumsOverFiniteFields` (#1712, a new roadmap folder by another
   author) states it as its target §3.3 "The Hasse–Davenport lifting relation" with Lean name `hasseDavenport_lift`:
   `g(χ.liftNorm, ψ.liftTrace) = −(−g(χ, ψ))^n` under `χ ≠ 1 ∨ ψ ≠ 1`, i.e. `(−1)^{n−1} g^n`, the same identity with the
   same sign, including the trivial-character case the README's fourth Check records. Found by `roadmaps grep
   'Hasse.Davenport'` (20 hits in that README).

   Repair (tested): delete §0.2 as an owned target (keep its Checks nowhere; the supplier has them); add the supplier
   contract `### From TauCetiRoadmap.CharacterSumsOverFiniteFields` with "§3.3: the Hasse–Davenport lifting relation
   `hasseDavenport_lift`, for `χ ≠ 1 ∨ ψ ≠ 1`, with ℂ-valued characters; transported to `K`-valued characters through
   the embedding of the roots of unity"; replace "§0.2 states it" in the Scope by "CharacterSumsOverFiniteFields §3.3
   supplies it"; in §§9.1–9.2 and the Layer 0 and Layer 9 Dependencies replace "§0.2" by "CharacterSumsOverFiniteFields
   §3.3". On a scratch copy with that citation added the dependency check reports `depcheck: 241 roadmaps, 2434 edges,
   0 problem(s)` and `roadmaps resolve` finds nothing missing, so the citation is admissible.

2. **F02** (P3) Supplier drift: §§RD.6.94–RD.6.97 are cited with a parity and coprimality restriction they no longer carry

   Location: README line 115 ("the scalar Kloosterman F-isocrystal for odd `p`"), line 267 ("the scalar Kloosterman
   F-isocrystal for odd `p` with `p ∤ n + 1` (§§RD.6.94–RD.6.97)"), line 1517 ("for `p` odd and `p ∤ r` it is the
   half-twisted Kloosterman F-isocrystal of §RD.6.95").

   Witness: at the open head of PadicDifferentialEquationsAndRigidCohomology (#1002), §RD.6.95 reads "Let `p` be any
   prime … every prime `p` and every rank `n+1 ≥ 1`", and §RD.6.94 "No separability of the power map of degree `n+1`
   is assumed … including at primes dividing the rank"; its ownership paragraph says this roadmap "extends it to
   reductive-group-valued coefficients".

   Repair: drop "for odd `p`" and "with `p ∤ n + 1`" in the Scope and the supplier contract, and in §8.1 state the
   comparison with §RD.6.95 (with `π ↦ −π`) at every prime and rank; the second Check of §8.1 is unchanged.

3. **F03** (P3) Supplier drift: SpringerResolutionAndCharacteristicCycles has no "Layer D" or "Layer H"

   Location: README line 121 ("**SpringerResolutionAndCharacteristicCycles** Layers D and H"), lines 299–301
   ("Layer D (differential operators, good filtrations, characteristic varieties) and Layer H (transfer, duality,
   holonomic modules, intermediate extension, regular holonomic modules)"), and §§1.1, 2.4, 3.3, 3.4 and the
   Dependencies of Layers 1–3 ("Layer H").

   Witness: at its open head (#1828) the roadmap's layers are numbered: Layer 8 "Differential operators and
   characteristic cycles" (§8.3 good filtrations, §8.5 characteristic variety) and Layer 9 "Holonomic operations and
   equivariance" (§9.1 transfer modules and operations, §9.4 holonomic modules, §9.6 intermediate extension, §9.7
   regular holonomic modules); no heading or label "D" or "H" exists there.

   Repair: replace "Layer D" by "Layer 8 (§§8.1–8.6)" and "Layer H" by "Layer 9 (§§9.1, 9.4, 9.6–9.7)" in every
   occurrence (Scope, supplier contract, §§1.1, 2.4, 3.3, 3.4 and the three Dependencies paragraphs).

4. **F04** (P3) The §6.3 Check misdescribes the source misprint it corrects

   Location: README line 1318: "the printed shift to `Sym^{2e_i + 2}` (Xu–Zhu Lemma 4.5.5, p. 53) gives `5 + 7 = 12`".

   Witness: XZ line 2440–2441 prints `Ad ≃ ⊕ S^{2ℓ_i}` with `{ℓ_i + 1}` the set of exponents, i.e. `ℓ_i = e_i − 1` and
   `Sym^{2e_i − 2}`; for `sl₃` (exponents `1, 2`) the printed indexing gives `1 + 3 = 4`, not `12`. The design's
   source issue E9 ("shifts each exponent by one") describes it correctly.

   Repair: rewrite the Check as "the printed indexing `ℓ_i + 1 = e_i` (Xu–Zhu Lemma 4.5.5, p. 53) gives
   `Sym^{2e_i − 2}`, of dimension `1 + 3 = 4` for `sl₃`; `Sym^{2e_i}` gives `3 + 5 = 8 = dim sl₃`".

Four findings, one blocking (P2). The Lean file elaborates with exactly five `sorry` warnings and no padding; the
headline theorems that are statable at the pins are stated and the others are named in the module docstring; the
numeric identities behind the four exponential-sum headlines, the signed 2-adic congruence and the ordinarity
statement were recomputed independently and hold on every instance tried. The repairs are a duplication (§0.2
re-plans a target an open roadmap pull request owns) and three citation drifts.

## Verified sound

**Principles.** No route-specific shortcut (the characteristic-two branch, the even-`A` case and the all-prime
corollaries are built in full; the `p ∤ |W_H|` break statement is stated only where Gross–Reeder proves it); no
re-planned roadmap (the level models, Satake for arithmetic and de Rham coefficients, the Frenkel–Gross connection,
the Bessel F-isocrystal, the hypergeometric arithmetic `D`-modules and the signed congruences have no other owner:
`roadmaps grep` for Frenkel–Gross, Bessel isocrystal, Miyatani/hypergeometric isocrystal, hyperbolic localization,
Dwork congruence and Heinloth over main and all open heads returns only consumers, PadicDifferentialEquationsAndRigidCohomology's
scalar §RD.6.95, and GeometricSatakeAndFusion's ℓ-adic hyperbolic localization); no copied passage; no algorithm;
no sorry'd data, no `set_option`, no `lemma`, single `import Mathlib`, no `#check`. Ownership against the open pull
requests was checked with the grep tool over their heads.

**Elaboration.** `lake env lean packages/KloostermanSheavesAndBesselIsocrystals/Suggested.lean` from the content
checkout: exit 0, exactly five warnings `declaration uses 'sorry'` (lines 62, 127, 139, 150, 163), nothing else.
Binder audit: the thirteen elaborated signatures were compared with the README statements; every hypothesis the
README states is in the Lean type (`CharZero K`, `IsAdicComplete`, `¬ IsUnit 2`, `Fact p.Prime`, `ψ ≠ 1`,
`1 ≤ n`, `2 ≤ N`, `ringChar F ≠ 2`, `[DecidableEq F]`); nothing was dropped and nothing changed.

**One-tactic probe.** On a scratch copy with every `sorry` replaced by `simp`: `signed_dwork_congruence` leaves
unsolved goals; the four exponential-sum theorems: "`simp` made no progress". No declaration restates a definition,
mirrors a Check or computes a value. The six definitions are the minimum needed to state the five headlines.

**Headline theorems** (README summary): the `H`-valued Bessel F-isocrystal with the Heinloth–Ngô–Yun traces; geometric
Satake for arithmetic `D`-modules; Zhu's comparison and the de Rham–rigid comparison; the Frenkel–Gross and Bessel
monodromy classification including `SO_{2n+1}` and `G₂` at `p = 2`; functoriality and companion monodromy; generic
ordinarity for every `H`; everywhere ordinarity for the classical groups and `G₂`; the exponential-sum identities;
the signed 2-adic Dwork congruences; `Be†_{2n+1} ≅ Be†_{SO_{2n+1},Std}` at `p = 2`; adjoint rigidity and the
simple-wild parameter. Statable at the pins and stated: the three identities, ordinarity on trace functions for
types `B`/`D`, the signed congruences. The rest are named in the module docstring with the missing carrier
(overconvergent F-isocrystals, `ℓ`-adic local systems, arithmetic `D`-modules, opers, Tannakian monodromy, Newton
points, local Weil parameters), each checked absent at the Tau Ceti pin (`grep -rli 'kloosterman|isocrystal'`
finds only Sobolev Bessel potentials). The type `A`/`C` ordinarity on traces is the declared supplier gap.

**Dependency check** (run as instructed, with `--movable`):

```
depcheck: 241 roadmaps, 2433 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

**Declared gaps.** All seven slugs are in `design/plan.json` `gaps` and stated in the supplier contracts with the
same supplier and a one-sentence `needs`; each is precise and minimal: scalar ordinarity is absent from the
KloostermanMomentsAndPotentialAutomorphy design (no ordinarity or slope target), the principal-`SL₂` classification
from ReductiveGroups Layer 7, Baldassarri's comparison and D'Addezio's theorem from the RD head, V. Lafforgue's
bound and the relative level geometry from GlobalShtukasAndFunctionFieldLanglands (§0.14 is cuspidal functions over
`𝔽_q` only; §§0.1, 1.1–1.2 are over a finite field). No gap has supplier `none`.

**Supplier citations resolved** (every `*Needs:*` line and the contracts): PadicDifferentialEquationsAndRigidCohomology
§§RD.0.37, RD.0.44, RD.1.11–1.19, RD.1.35, RD.1.44–1.46, RD.2.13–2.16, RD.2.33, RD.2.51, RD.3.8, RD.3.25,
RD.3.33–3.37, RD.3.43–3.47, RD.3.51, RD.4.58–4.59, RD.5.8–5.9, RD.5.76, RD.5.89, RD.5.101–5.103, RD.5.112,
RD.6.3–6.4, RD.6.23, RD.6.25, RD.6.28, RD.6.41–6.48, RD.6.51–6.52, RD.6.55, RD.6.64–6.65, RD.6.82, RD.6.94–6.97: all
present at head #1002 with the titles the README uses. PadicDifferentialEquationsAndRigidCohomologyPartII MS.4 "Curve
reconstruction" with subsections "Specified curve lift" and "Minimal slope reconstruction" (board design).
KloostermanMomentsAndPotentialAutomorphy KM.1/normalized-sheaf, KM.1/monodromy (table agrees with README §6.1,
§11.4), KM.2/connection, KM.2/bessel-dictionary, KM.2/differential-galois, KM.4/rigid-realization (`E = (O, d + ϖ dz)`
with multiplier `exp(ϖ(z^p − z))`, so `ϖ = −π` as the conventions say) (board design). CongruenceSpectralGap §4.2a
(`hyperKloosterman`, the same sum over unit tuples as `kloostermanSum`, with `CommRing K`) and §4.2b.
GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.14, 1.1, 1.2, 1.4, 1.5, 1.6, 1.8, 1.9, 1.12. BunGAndNewtonStrata
§1.5, §1.22. MotivesAndAlgebraicCycles §§6.1–6.3, 6.5. FormalConnectionsOpers F2, F4, F6. DeligneWeightsAndPurity
§§8.5, 8.12, 8.14, 8.19. On main: AffineLieAlgebras A7–A8, ReductiveGroupsPartII RG2.3.3, RG2.3.6, RG2.4.1,
ReductiveGroups Layers 1, 7, 9, 10, Completed/OrthogonalSpinGroups Layers 0–1, EtaleCohomologyFoundations.
Mathlib at the pin: `AddChar.compAddMonoidHom` (AddChar.lean:233), `AddChar.mulShift` (:439), `AddChar.sum_eq_ite`
(:330), `AddChar.sum_eq_zero_of_ne_one` (AddCharacter.lean:240), `FiniteField.algebraMap_trace_eq_sum_pow`
(Finite/Trace.lean:49), `FiniteField.trace_to_zmod_nondegenerate` (:37), `gaussSum` (GaussSum.lean:72),
`gaussSum_mul_gaussSum_eq_card` (:188, hypotheses `χ ≠ 1` and `IsPrimitive ψ` as the README says), `quadraticChar`
(QuadraticChar/Basic.lean:119), `MulChar.ringHomComp` (MulChar/Basic.lean:454), `PadicComplex`, `PowerSeries.expand`
(PowerSeries/Expand.lean:33), `IsDiscreteValuationRing`, `IsAdicComplete`, `IsFractionRing`, `Matrix.trace`,
`ZMod.algebra`. Tau Ceti: `FGComoduleCat`, `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` (GroupFunctor.lean:138).

**Sampled locators** (all read in the cached texts): 1.5 = XZ §4.1.2 (4.1.2.1)–(4.1.2.4) lines 1779–1815 and §4.1.8
(4.1.8.1)–(4.1.8.4) lines 1870–1896; 2.1 = FG §5 (5.1) lines 346–357 (FG's `N` is the sum of negative simple root
vectors, the README follows XZ's positive convention, a conjugate choice) and XZ §4.3.1, (1.2.2.2) line 227; 2.4 =
Zhu Theorem 8 and Corollary 9 lines 377–443 (flatness of `D′` over `A` as a hypothesis, eigenvalue the oper
`π(χ)`) with BD §5.5 (line 6934) and §7.8 (line 8536) present; 2.5 = Zhu Lemmas 18–21 lines 918–1010 and XZ
(4.3.5.1) line 2265; 4.1 = XZ §4.4.1 (4.4.1.1)–(4.4.1.3) lines 2292–2313 (independence of the comparison through
`Z_G(K)`); 4.4 = XZ §4.4.3 and Theorem 4.4.4 lines 2323–2331; 5.3 = XZ Theorem 5.4.2(i) and proof lines
2932–2940 and A.2 lines 3021–3031; 7.2 = XZ §§4.1.9–4.1.10 lines 1897–1942 (all five items, including the `p = 2`
clause of (4.1.10.4)); 7.6 = XZ Corollary 4.5.6 lines 2469–2477 (its proof infers an isomorphism from a surjection,
as the README says); 8.3 = XZ §5.3.3 lines 2733–2735, (5.3.6.5) line 2869, Corollary 5.3.11(ii) line 2909; 9.4 = XZ
§5.3.9 and 5.3.11(i) lines 2893–2907 with Miyatani Main Theorem (ii) line 85 and Proposition 3.3.3 line 1120; 10.4
= XZ Lemma A.12 lines 3129–3158 (`F`, `G`, `u(0,1,m) = 1`, `u(1,1,m) = (−1)^m`); 10.5 = XZ A.8, Proposition A.9,
A.11 lines 3088–3138; 10.6 = XZ Proposition A.1, Theorem A.3 lines 3013–3039, Proposition 5.3.8(ii) line 2886; 11.5
= XZ Corollaries 4.5.6–4.5.7 and Remark 4.5.8(iv) lines 2469–2516. Also checked: Theorem 1.2.4 lines 245–258
(types `A, B, C, D, G₂` everywhere ordinary; Remark 1.2.5(i) expects it in general), (1.2.9.1)–(1.2.9.2) lines
297–336, Theorem A.5(i′) lines 3058–3059 (matches `signed_dwork_congruence` term by term), Carlitz (4) line 37,
Sperber Theorem (2.35) line 537, Dwork Theorems 2–3 lines 394, 527, HNY Proposition 1.1, Lemma 2.1, Remark 2.2,
Corollary 2.15 lines 527–892, Gross–Reeder Proposition 5.6 line 67. All hypotheses agree with the README's.

**Adversarial table** (exact arithmetic in `ℤ[ζ_p]`, fields built with a primitive element, every nontrivial
character `ψ(Tr(c·))`, closed-form sums cross-checked against brute force in 40 cases):

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `orthogonalSum_sub_card_eq_kloostermanSum` (i) | `𝔽₂` (n ≤ 3), `𝔽₄` (n ≤ 3), `𝔽₈` (n ≤ 2), all `a`, `ψ = ψ₀∘Tr` | `𝔽₂`: `U_n(1) = 1`, `1 − 2 = −1 = R_{2n+1}(1)`; `𝔽₄`: `R₂(1) = 3`, `R₃(1) = 5`, `U₁(1) = 9 = 5 + 4`; `𝔽₈`: `R₂(1) = −5`, `R₃(1) = 17`, `U₁(1) = 25 = 17 + 8` | holds in every case | none |
| (i) for `ψ₀(Tr(c·))`, `c ≠ 1` | `𝔽₄` (`c = ω, ω²`), `𝔽₈` (6 values of `c`), n ≤ 3 | `U_n(a) − Q = R_{2n+1}(a/c)`, and `≠ R_{2n+1}(a)` in 73 instances | hypothesis `traceChar` necessary | none |
| `gaussSum_mul_orthogonalSum_sub_card` (ii) | `𝔽₃` (n ≤ 3), `𝔽₉`, `𝔽₅`, `𝔽₇` (n ≤ 2), all `a`, all `c` | `𝔽₃`: `R₂(1) = −1`, `R₃(1) = −2 − 3ζ₃`, `U₁(1) = 1`; `g·(U_n − Q) = H_{2n+1}(4a)` | holds; with `Σρ(y)ψ(y)` instead of `Σρ(y)ψ(−y)` it fails over `𝔽₃` and `𝔽₇`, holds over `𝔽₅`, `𝔽₉` | none |
| `orthogonalSum_sub_card_eq_convolution` (iii) | all seven fields, `N = 2, 3` where defined, all `a`, all `c` | e.g. `𝔽₂`, `N = 2`: `Σ(R₂²−2)R₂ = −1 = U₂(1) − 2`; printed (1.2.9.2): `−(1/√2)(1 − 2) = 1/√2 ≠ −1` | holds; printed form false | none |
| `U₁(a) = R₂(a)²` (conventions, §11.1 bullet) | all seven fields, all `a`, all `c` | equal | holds | none |
| `orthogonalSum_ordinary` (slopes `0, …, 2n`) | `p = 2`: n = 1, 2, 3 (`𝔽₂`…`𝔽₁₂₈`); `p = 3`: n = 1 (a = 1, 2), n = 2 (a = 1, 2, up to `𝔽₂₄₃`); `p = 5`: n = 1; `p = 7`: n = 1 | power sums `P_d = U_n(a) − Q^d`, elementary symmetric `e_k` integral in `ℤ[ζ_p]`, e.g. `p = 2`, n = 3: `e = (−1, −42, 280, 2240, −21504, −32768, 2^21)`; `p = 3`, n = 2, a = 1: `e = (4, −69, −621, 2916, 3^10)`; `v(e_k) = k(k−1)/2` in all nine cases | ordinary, rank `2n+1`, one eigenvalue per slope | none |
| `signed_dwork_congruence` on the §10.4 datum | n = 1, 2; `s ≤ 3`, `m ≤ 3`, all `N < 2(m+1)2^{s+1} + 8` | (b) holds; (c′) holds with `u(1,1,m) = (−1)^m`; ordinary (c) fails in 24 cases; `v₂(coeff) − (s + v₂(B^{(s+1)}(m))) ≥ 3` (n = 1), `≥ 2` (n = 2), minimum at `(m,s,N) = (1,1,4)` | holds | none |
| §10.1 sign witness | `B(j) = (−2)^{3j}/(j!)³` | `B(4)/B(2) = 1/27`, `v₂(1/27 − 1) = 1`, `v₂(1/27 + 1) = 2` | (c) fails at `s = 1`, (c′) holds with `u = −1` | none |
| §8.5 boundary constant | chart sum over `Q°(𝔽_Q)` with `p₀ = 1`: n = 4 over `𝔽₂` (`|Q°| = 9`), `𝔽₃` (`|Q°| = 196`, a = 1, 2); n = 3 over `𝔽₂`, `𝔽₄` | chart `7, 13, 40`; `S_n + Q^{n−1} − Q = 7, 13, 40`; printed `(Q−1)Q^{n−2}` gives `5, 7, 34`; n = 3: `3, 37` both constants | corrected constant holds, printed fails at n = 4 | none |
| §8.3 / §8.6 at `𝔽₂`, n = 3 | `a = 1` | `T_{SO₈} = 7/8`, `T_{SO₇} = (U₃(1) − 2)/8 = −1/8`, difference `1` | holds | none |
| §9.4 normalized convolution from (iii) | symbolic | `K_{2n−2} = −Q^{−(2n−3)/2}R_{2n−2}`, `T_{SO₃} = (R₂²−Q)/Q`, so `Σ T_{SO₃}K_{2n−2} = −Q^{1/2}T_{SO_{2n+1}}` | half twist and sign as stated | none |
| §4.3 residue relation | `SL₂`, `C₀ = diag(t⁻¹, t)`, `t² = q`, `N = E₁₂` | `NC₀ = tE₁₂`, `qC₀N = qt⁻¹E₁₂ = tE₁₂` | holds; inverse gives the opposite relation | none |
| §4.4 rank one | `A = −a` | `δC = (1−q)aC ⇒ C = x^{−(q−1)a}` | agrees with §RD.6.48 | none |
| §10.5 quotient Frobenius | `c = q^n/f_{F,q}` | `c′/c = −f′/f = q x^{q−1}η(x^q) − η(x)`, `c(0) = q^n`, slope `n` | the quotient is `(O, d + η dx)`, dual of `E_F`; XZ A.9(ii) names `E_F` itself | none (README already corrects it) |
| §6.3 principal decomposition | `sl₃`, `G₂` | `Sym²⊕Sym⁴ = 3 + 5 = 8`; printed indexing `1 + 3 = 4`; `14/6 < 3` | holds; Check text wrong about the printed value | R04 |
| §6.6 Euler characteristic | `SL₂` adjoint | `h¹ = Irr_∞ − dim Ad^{I₀} − dim Ad^{I_∞} = 1 − 1 − 0 = 0`; `I₀` twice: `−1` | holds | none |
| §0.1 normalization | `q = 2, 3`, `a = ±1` | `R₂(1) = 1` (`𝔽₂`), `R₂(1) = −1`, `R₂(−1) = 2` (`𝔽₃`); normalized `−1/√2`, `1/√3`, `−2/√3` | holds; `√3 ∉ ℚ₃(μ₃)` | none |
| §0.2 Hasse–Davenport | `𝔽₃ → 𝔽₉` | `g = i√3`, lift `3 = −(i√3)²` (also the supplier's own Check) | holds, but owned elsewhere | R01 |
| Rank-one dictionary | `d − π dt` | `(exp π(t − t^p))′/exp = π(1 − pt^{p−1})`; `d + π dt` defect `2π`; KM.4 uses `d + ϖ dz` with `exp(ϖ(z^p − z))`, so `ϖ = −π` | consistent with §RD.6.48 and KM.4 | none |
| Lean context | all five theorems | `CharZero K` excludes the equal-characteristic DVR `𝔽₂[[t]]`, where `¬IsUnit 2` also holds; `1 ≤ n`, `2 ≤ N` exclude the truncated `2n − 2`; `ψ ≠ 1` excludes the trivial character (`𝔽₂`: `U₁ − 2 = −1 ≠ 1 = R₃`); `L : Type` as the conventions say | binders match the README | none |
| Trivial group / torus | `H = 𝔾_m` | `V = 0`, eigenobject constant, `2ρ = 0`, `ν_a = 0` | consistent in §§0.3, 1.6, 4.1, 5.2 | none |

**Shape.** Summary, Scope, Conventions, supplier contracts, How to read, Layers 0–11 each with Examples and
Dependencies, Downstream consumers, Worked examples, References; every definition with API bullets and at least
three Checks; every theorem with hypotheses and a locator; no process residue, no LaTeX delimiters, no local path;
every backticked own name (seven) is declared in `Suggested.lean` and every Lean name appears in the README. The
local `kloostermanSum` repeats CongruenceSpectralGap's `hyperKloosterman` body because a roadmap module cannot be
imported; the Scope says so, and the fully qualified names differ.

**Manifest.** All 24 cited works are recorded; the seven uncertified entries are settled by locator. No entry was
added or changed.

## Not verifiable

- `AS89`, `Wan93`, `Wan04` (§§11.2–11.3), `Bal82` (§6.3), `DH35` (§0.2), `ESDE`, `KatzCC` (§9.1): uncertified,
  no text; cited by locator as the manifest records.
- Sperber Theorem (2.35): the OCR of line 537–539 breaks off before the slope list; the hypothesis `p > n + 3`
  (rank `r + 2`) is the manifest's locator note and was not re-read in the text.
- Beilinson–Drinfeld §§5.3, 5.5, 7.8: located by heading (lines 6178, 6934, 8536); their content was not read
  beyond Zhu's citation of them.
- Lam–Templier and Pech–Rietsch–Williams (§8.4): not in the sample, not read.

## Source issues

- **Misprint** in XZ at Lemma 4.5.5, p. 53: the source indexes the principal-`SL₂` decomposition by `ℓ_i + 1 =` exponent, giving `Sym^{2e_i − 2}`; it should be `Sym^{2e_i}` with `e_i` the exponents; affects nothing.
- **Error** in XZ at Proposition 5.3.5(ii), (5.3.5.2), pp. 59–60: the source gives the boundary constant `(q−1)q^{n−2}`; it should be `q^{n−1} − q` (first differing at `n = 4`, where the chart sum over `𝔽₂` is `7`, not `5`); affects a stated result.
- **Error** in XZ at (1.2.9.1), p. 6: the source puts a factor `−1/√q` in front of the rank-three sum at `p = 2`; it should be absent, the identity being `R₂² − q = R₃` in raw sums (over `𝔽₂`: `−1` versus `1/√2`); affects a stated result.
- **Error** in XZ at (1.2.9.2), p. 7, and Corollary 5.3.11(i), p. 61: the source prints `−(1/√q)(U_n − q^{n−1})` and an untwisted convolution; it should be `U_n − q` with the half twist and sign of §9.4; affects a stated result.
- **Misprint** in XZ at Proposition 5.3.8(i), p. 61: the source lists the zero spectrum `{q^{−n}, …, q^{−1}, 0, q, …, q^n}`; the middle eigenvalue should be `1`; affects nothing.
- **Gap** in XZ at Proposition A.9(ii), p. 66: the source identifies the maximal-slope quotient with the unit-root `E_F` without its Frobenius scale; the quotient is the dual connection `d + η dx` with Frobenius `q^n/f`, which the minimal-slope theorem needs; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e615a4e78ef3fdb3df6743b1b92cd0042fe89875", "job": "REV-PKG-KloostermanSheavesAndBesselIsocrystals", "model": "fable", "worker": "chris-x19"} -->
