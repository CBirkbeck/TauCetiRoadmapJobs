<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2409#issuecomment-6671318640 -->
Review (claude) of 29f13da

Verdict: needs_changes

1. **F01** (P3) ShimuraCompactifications is cited as §§C0.15–C0.18; its sections are §§0.15–0.18

   - Location: `packages/KloostermanMomentsAndPotentialAutomorphy/README.md` lines 98, 275–277, 1225,
     1232–1233, 1246, 1396 (“ShimuraCompactifications §§C0.15–C0.18 (toric schemes of finite fans …)”).
   - Claim: the toric-scheme inputs are ShimuraCompactifications §C0.15 (smooth projective refinements),
     §C0.16 (toric schemes over every commutative ring), §C0.17 (support criterion), §C0.18 (integral toric
     boundary).
   - Witness: at the supplier's open head (pull request on ShimuraCompactifications, head f51ec79) the
     headings are `## Layer 0: admissible fans and relative torus embeddings`, then
     `### 0.15 Smooth projective refinements`, `### 0.16 Toric schemes over arbitrary commutative rings`,
     `### 0.17 Relative toric maps and the support criterion`, `### 0.18 The integral toric boundary`.
     No `C0.` label occurs anywhere in that README, and `roadmaps resolve` reports §C0.15, §C0.16 and
     §C0.17 as found nowhere. The content of the four sections is exactly what the README consumes
     (toric schemes `X_{Σ,R}` of finite fans over any commutative ring with base change, properness by the
     support criterion, the relative boundary), so only the labels drift.
   - Repair: replace every `C0.15`, `C0.16`, `C0.17`, `C0.18` by `0.15`, `0.16`, `0.17`, `0.18` at the seven
     places listed (eight occurrences), including the range forms `§§0.15–0.18` (lines 98, 246) and
     `§§0.16–0.18` (line 1396). Tested: with the labels `0.15`–`0.18` each citation resolves to the headings
     above; the dependency gate output is unchanged (0 problems).

One finding, non-blocking: the citations of ShimuraCompactifications use section labels that do not
exist at that roadmap's head. Everything else checked out: the four headline theorems elaborate
and are faithful to Fresán–Sabbah–Yu Theorems 1.2 and 1.3 and to (1.5), (5.1)–(5.4); every numerical
Check on `Z_k(p; T)` in the README was recomputed from scratch and agrees; the sampled locators are
exact; every supplier section and every library declaration cited resolves; the dependency gate is
clean; the one-tactic probe closes nothing.

## Verified sound

**Elaboration.** `lake env lean Suggested.lean` from the content checkout: exit 0 in 5.8 s, exactly four
warnings, all `declaration uses 'sorry'` (lines 91, 110, 190, 205). Imports: `import Mathlib` only; no
`TauCeti.*` module is needed. No `set_option`, no `lemma`, no `#eval`/`#print`, no sorry'd data: the
17 definitions all have real bodies (finite sums over `GaloisField`, a recursion, `Finset.filter`,
finite products, power-series arithmetic, `Complex.Gamma`), and every one of them occurs in the type of
one of the four theorems. The 21 elaborated signatures in the worker's `signatures.md` were compared
with the README statements of §§0.1–0.3, 8.2, 8.5–8.6, 10.2, 10.4, 11.4–11.5: generality agrees in
every case (prime `p` with `Fact`, `0 < k`, `Odd k`, `Even k ∧ 0 < k`). No section `variable`s exist in the
file, so no binder can have been dropped.

**`PowerSeries.subst` argument order.** The body `(PowerSeries.exp ℂ).subst g` was checked at the pin
(`Mathlib/RingTheory/PowerSeries/Substitution.lean:157`, `subst (a : MvPowerSeries τ S) (f : PowerSeries R)`):
dot notation puts `exp ℂ` in the `f` slot, so the term is `exp ∘ g`, as the README says. Confirmed by
elaborating `example : (exp ℂ).subst X = subst X (exp ℂ) := rfl` in the probe file (no error).

**One-tactic padding probe.** Each of the four sorried theorems was copied into a scratch file with
`simp`, `rfl`, `infer_instance` and `exact trivial` in place of `sorry`: all 16 attempts fail
(`unsolved goals`, `rfl failed`, `type class instance expected`, `type mismatch`). No declaration
restates a definition, mirrors a Check or computes a value. No padding.

**Headline theorems.** From the README summary: (1) integrality, degree and polynomiality of
`Z_k(p; T)` — stated as `momentSeries_eq_intPolynomial`; (2) weights 0, `k`, `k + 1` of its reciprocal
roots — stated as `momentSeries_weights`; (3) the Hodge numbers (Theorem 1.8) — not statable, named in
the docstring with the missing carriers; (4) the regular polarized compatible system and its potential
automorphy (Theorems 5.8, 5.17, 5.38) — not statable, named; (5) the odd functional equation
(Theorem 1.2) — stated as `oddMoment_functionalEquation`; (6) the even functional equation
(Theorem 1.3) — stated as `evenMoment_functionalEquation`, with the same existential form as the
source (an integer `r_k`, a rational polynomial `L_k(2;T)⁻¹` and a sign, FSY line 142–146). The
monodromy groups and the Nori motive are named in the docstring as not statable. Nothing statable is
missing and no headline is forced through a stand-in.

**Dependency gate.**

```
depcheck: 241 roadmaps, 2438 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Every roadmap cited is earlier in `ORDER.txt` (MixedHodgeModulesAndIrregularHodgeTheory at 181, ShimuraCompactifications at 178, this roadmap at 274); KloostermanSheavesAndBesselIsocrystals (275) is only named as a consumer.

**Supplier citations resolved** (each opened at main or at the open head listed by `roadmaps list`):
CongruenceSpectralGap §4.2a (`hyperKloosterman F k ψ r`, eliminated-variable comparison) and §4.2b
(`L_ψ`, curve Euler–Poincaré, Swan-constancy, Kloosterman realization `R^{k−1}mult_!`, Deligne bound);
PadicDifferentialEquationsAndRigidCohomology §§RD.6.94–RD.6.98, RD.7.20 (hypothesis `Q − u·(√−p)²`,
`u` a unit: exactly unit thickness), RD.7.21 (geometric and `(C_dR)`/`(C_st)` hypotheses as the README
lists them), RD.7.21a (the odd-`p` factorization with `f, m, n` equal to the README's `u, m, v`),
RD.7.22; SpringerResolutionAndCharacteristicCycles Layers 8–9 are its `D`-module layers (the README's
“Layer D”/“Layer H” are the names that roadmap's own supplier table uses; its headings read
`Layer 8: Differential operators…`, `Layer 9: Holonomic operations…` — this is how the roadmap labels
them in its contracts, not a drift); MixedHodgeModulesAndIrregularHodgeTheory design Layers D, F,
H.0, H.1, E, I, C, P, G, T, N all present with the cited contents (T/stationary-phase is regular input
only, so the irregular gap is genuinely missing there); ComplexComparisonPartII §C5.6, §C5.7;
EtaleCohomologyFoundations (main) F.0.4, F.2.4–F.2.7, F.4.5, F.5, F.6, F.7, F.10.1–F.10.2b;
InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3; EtaleDualityAndPerverseSheaves §§2.3, 2.8, 3.3;
DeligneWeightsAndPurity §§0.16, 7.12, 8.14, 8.19, 8.24; SchemeAndStackFoundations (main) Layer 0, §§2.11,
4.11, 4.13, 4.17; LefschetzPencilsAndVanishingCycles §§2.1–2.8, the Layer LPV.2 Examples (the
Fresán–Sabbah–Yu quadratic character of `ℚ_p(√((−1)^{(1+ap)/2}·2ap))`, line 2242 of its README) and
§6.6; MotivesAndAlgebraicCycles §2.7, Layer 5 §§5.3–5.9 (and its §5 states explicitly that no global
weight filtration is provided, so gap:nori-weight-filtration is needed); ArithmeticGaloisRepresentations
§§1.7, 2.5, 2.6, 2.7, 3.3, 5.3, 7.4 (no statement that semisimplification preserves a form: the gap is
needed); PotentialModularityAndCompatibleSystems §§1.1, 1.5, 1.6, 1.15 (real-place factor with `d_±`
from `det ℛ(c_v)`, as §10.2 uses); ModularityAndLanglandsExtensions §2.42, §2.49;
CohomologyComparisons §§2.13, 3.4, 3.5, 4.3, 4.4; PadicHodgeTheory §3.2, Layer 5.

**Declared gaps.** The five slugs in `design/plan.json` match the five `What <Supplier> must provide
(gap:…)` sentences of the README; each names its supplier and section, states its hypotheses, and
asks for nothing the supplier, Mathlib or Tau Ceti already provides (checked above).

**Library declarations at the pins** (file:line): `AddChar.sum_eq_ite` Algebra/Group/AddChar.lean:330;
`AddChar.compAddMonoidHom` ibid.:233; `ZMod.stdAddChar` Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83;
`GaloisField.card` FieldTheory/Finite/GaloisField.lean:130 (needs `n ≠ 0`, as the README says);
`FiniteField.trace_to_zmod_nondegenerate` FieldTheory/Finite/Trace.lean:37;
`FiniteField.algebraMap_trace_eq_sum_pow` ibid.:49; `SymmetricPower` LinearAlgebra/TensorPower/Symmetric.lean:52;
`PowerSeries.exp` RingTheory/PowerSeries/Exp.lean:49; `PowerSeries.subst` RingTheory/PowerSeries/Substitution.lean:157;
`MvPolynomial.hsymm` RingTheory/MvPolynomial/Symmetric/Defs.lean:312; `Polynomial.Chebyshev.U`
RingTheory/Polynomial/Chebyshev.lean:261 (indexed by `ℤ`); `LSeriesSummable` NumberTheory/LSeries/Basic.lean:178;
`MeromorphicNFOn` Analysis/Meromorphic/NormalForm.lean:632; `legendreSym` NumberTheory/LegendreSymbol/Basic.lean:109;
`Complex.Gamma` Analysis/SpecialFunctions/Gamma/Basic.lean:287. Tau Ceti: `TauCeti.Hodge.MixedHodgeStructure`
Geometry/Hodge/Mixed/Basic.lean:72; `…Hom.range_inf_F_eq_map_F` Geometry/Hodge/Mixed/Strictness.lean:110;
`…Hom.range_inf_WQ_eq_map_WQ` ibid.:131; `TauCeti.Hodge.tate` Geometry/Hodge/Tate/Basic.lean:91.
`roadmaps resolve`: no backticked name of this roadmap's own is undeclared.

**Sampled locators** (all read in the cached texts; FSY pages are arXiv v5 pages, as the README says):
§0.2 — FSY (1.1) line 64–67, Weil's `Kl₂ = −(α+β)`, `αβ = q` lines 68–70, moments lines 71–77 (p. 2) ✓.
§0.3 — `Z_k = exp(Σ m₂ᵏ(pⁿ)Tⁿ/n)` lines 81–84 (pp. 2–3), `Z₁ = Z₂ = 1 − T`, `Z₃`, `Z₄` lines 88–96 ✓.
§1.2 — FSY §1.2 lines 174–198 (pp. 4–5): `Rπ_!f^*L_ψ[1]`, forget-supports isomorphism, trace
`−(α_a+β_a)`; §3.2.1 lines 971–973 (p. 23) trace `(−1)^n Kl_{n+1}`; XZ (1.1.2.1)–(1.1.2.3) lines 107–139
(p. 3): properties (ii)–(iv) and the monodromy table ✓.
§2.2 — FSY §2.1 lines 429–440 (p. 10): the cover `z = t^{n+1}`, `(t,x) ↦ (t, x/t)` turns `f̃` into `t·g(y)`,
`Kl_{n+1} = ([n+1]_+K̃l_{n+1})^{μ_{n+1}}` ✓; §3.1 line 939–941 (p. 22) the action `t ↦ ζt`, `y ↦ ζ⁻¹y` ✓.
§2.6 — XZ (1.1.1.1)–(1.1.1.6) lines 58–100 (pp. 2–3): Bessel matrix, `E_λ = (O, d − λdx)`, `Be_n ≅ Kl_n^{dR}`;
§4.1.13 lines 1972–1985 (p. 42): `E_λ = K⟨x,∂⟩/(∂_x − λ)` ✓. Recomputed: with ∇ = d + A dx/x, the first
coefficient of a horizontal vector satisfies `θ^n f₁ = (−1)^n λ^n x f₁` and the last basis vector satisfies
`θ^n e_n = λ^n x e_n`, as §2.6 states.
§4.2 — FSY (3.1) line 777 (p. 18), Theorem 3.8 and (3.9) lines 891–908 (p. 21), Remark 3.10 lines 948–953 ✓
(hypothesis `kn ≥ 2` present in the README).
§4.3 — Theorem 3.8 (three forms, smooth case) ✓; Example A.27 lines 3208–3225 (pp. 70–71) ✓.
§5.1 — FSY §4.1 lines 1075–1093 (pp. 26–27): `θv₀ = v₁`, `θv₁ = zv₀`, `(1/2)t∂_t`; (4.4)–(4.5) lines
1131–1139 (p. 27); Lemma 4.15 lines 1305–1307 (p. 31) ✓.
§5.3 — Corollary 4.9 lines 1189–1203 (pp. 28–29): isomorphism at `∞` iff `k ≢ 0 mod 4`, cover iff `k` odd;
uniqueness of the proper submodule ✓ (the README's “no quotient supported at 0” is the equivalent
characterization, since the cokernel of `j_{0†+} → j_{0+}` is `i_{0+}ℂ`, lines 1272–1274).
§7.1 — FSY §5.1.2 lines 1740–1764 (pp. 40–41): smoothness along the boundary, `(g₁)∩(z₁) = ∅`,
`(g₁)∩(z_r) = (1 + z₁(1 + z₂ + ⋯))`; Remark 3.10 ✓; (4.23) lines 1528–1534 (p. 36) gives the displayed `g₁`
(recomputed for `k = 2`: `1 + z₁ + z₁²z₂² + z₁z₂²`, and dividing by `z₁z₂` recovers `y₁+y₁⁻¹+y₂+y₂⁻¹`).
§7.4 — (5.5) line 1735 (p. 40), (5.9) lines 1853–1857 (p. 42), (5.19) line 2042 (p. 46) ✓; dimension `m`
line 1738–1739 ✓.
§8.6 — (5.22) lines 2156–2176 (p. 48), conductor `2^{r_k}Π p^{⌊k/2p⌋}` and `r_k = Sw + codim` lines
2185–2192 (p. 49), Theorem 5.17's `E` lines 1991–1994 ✓.
§9.2 — FSY §5.3.3 lines 2604–2624 (pp. 57–58): purity `k+1`, Hodge–Tate weights as jumps of `F` on the
middle de Rham cohomology, `GO_m`/`GSp_m` with similitude `χ_cyc^{−k−1}`, Serre Th. 4.2.1 for the
semisimplification, crystalline for `ℓ > k` ✓.
§10.2 — Corollary 5.30 lines 2350–2362 (p. 52): `π^{−ms/2}ΠΓ((s−j)/2)`, `m = ⌊(k−1)/2⌋ − δ_{4|k}`; Serre's
recipe lines 2336–2349; the middle-line sign `ε = −1` for `k = 4r+3` lines 2370–2399 (p. 53) ✓.
§10.4 — Theorem 1.2's `Λ_k = (N_k/π^m)^{s/2}ΠΓ((s−j)/2)ΠL_k(p;s)` lines 118–131 (p. 3), `N_k = 1_s3_s⋯k_s`
line 115, Theorem 1.3 and `Λ_k = 2^{r_k s/2}L_k(2;2^{−s})Λ′_k` lines 142–146 (p. 4); (5.13)–(5.14)
lines 1945–1968 (pp. 44–45); (5.22) ✓. Absolute convergence for `Re s > (k+3)/2`: line 110–111 and
line 1956 ✓.
Headlines — (1.5) lines 203–205, degree formulas lines 210–225 (p. 5); (5.3)–(5.4) lines 1699–1729
(p. 40); Theorem 1.8 lines 314–341 (pp. 7–8); Theorem 5.8 lines 1806–1836 (p. 42); Theorem 5.17 lines
1983–1994 (p. 45); Proposition 5.23 lines 2199–2205 (p. 49); Lemma 5.40 lines 2629–2634 (p. 58);
Remark 5.41 lines 2660–2679 (p. 59); Theorem 5.38 / Corollary 5.39 lines 2569–2603 (pp. 56–57);
(5.34)–(5.36) and the archimedean signs lines 2460–2533 (pp. 55–56); Prop. 4.6, Lemma 4.7, (4.8),
Cor. 4.10, (4.11), Prop. 4.12/(4.13), Prop. 4.14, Lemma 4.17 (pp. 27–31); Prop. 4.20 (pp. 32–34), Prop. 4.21
(p. 34). Every one supports the README statement at the README's generality.

**Numerical recomputation.** A script (finite-field arithmetic in `GF(p^m)`, character
`exp(2πi·Tr/p)`, `h_k` by the recurrence, `exp` of the log series over `ℚ`) computed `Z_k(p;T)` for
`p = 2` (`m ≤ 6`), `p = 3` (`m ≤ 4`), `p = 5` (`m ≤ 3`), `p = 7` (`m ≤ 2`). Results, all equal to the README:
`Z₁ = Z₂ = 1 − T` (p = 2, 3, 5); `Z₃(2) = 1 + 3T − 4T²`; `m₂³(2) = 3`, `m₂³(4) = −17`; `Z₄(2) = 1 − T`;
`Z₅(2) = 1 − 5T + 68T² − 64T³ = (1−T)(1−4T+64T²)`; `Z₆(2) = (1−T)(1+8T)`; `Z₈(2) = (1−T)(1−16T)`;
`Z₁₀(2) = (1−T)(1+24T+2048T²)`; `Z₁₂(2) = 1 − T − 4096T² + 4096T³`; `Z₁₄(2) = (1−T)(1+128T)(1−216T+2^{15}T²)`;
`Z₁₆(2) = (1−T)(1−256T)(1+528T+2^{17}T²)`; `Z₃(3) = 1 − T`; `Z₄(3) = 1 − 10T + 9T²`; `Z₅(3) = Z₆(3) = 1 + 26T − 27T²`;
`Z₇(3) = (1−T)(1−90T+6561T²)`; `Z₈(3) = (1−T)(1+81T)(1−81T)`; `Z₉(3) = (1−T)(1+54T+3^{10}T²)`;
`Z₁₀(3) = (1−T)(1+243T)(1−252T+3^{11}T²)`; `Z₁₂(3) = (1−T)(1+729T)(1−729T)²`; `Z₃(5) = (1−T)(1+25T)`;
`Z₄(5) = (1−T)(1−25T)`; `Z₅(5) = (1−T)(1−125T)`; `Z₆(5) = (1−T)(1−150T+5^7T²)`; `Z₃(7) = Z₄(7) = (1−T)(1−49T)`.
In every case the trailing coefficients vanish up to the computed order and the degree equals
`momentDegree p k`; the middle factors have `|α|² = p^{k+1}` and the boundary factors are `1 ∓ p^{k/2}T`
with the multiplicities `v`, `m − v`, `a_k`, `b_k` of §8.2 (e.g. `k = 12, p = 3`: `u = 2, v = 1, m = 3`,
`deg M = 0`; `k = 14, p = 2`: `a = 0, b = 1, deg M = 2`). The §0.3 negative control was also run: with
`(α+β)^{12}` in place of `h₁₂` at `p = 2` the series has coefficients `1, 1, 265722, 82177372, …` growing
through `T⁶`, so it is not the degree-3 polynomial.

**Adversarial table** (sampled targets, headlines, and the target of R01).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1 `h_k` recurrence = `Σαⁱβ^{k−i}` | `(t,d)=(3,2)`, `(2,1)`, `(−1,2)`, `k=0` | `h₂(3,2)=7=4+2+1`; `h₃(2,1)=4=(3+1)·1`; `h₂(−1,2)=−1`, `h₃(−1,2)=3`; `h₀(0,0)=1` | agrees; `3²=9≠7` refutes the power definition | none |
| §0.2 `Kl₂`, first moment | `𝔽₂`, `𝔽₃`, `𝔽₅` trivial ψ | `Kl₂(1;𝔽₂)=1`; `𝔽₃`: `Kl₂(1)=ω+ω²=−1`, `Kl₂(2)=2`, `m¹=−1`; trivial ψ over `𝔽₅`: `Kl=4`, `m¹=−16` | agrees | none |
| §0.3 `momentSeries` | `k=0` (`(1−T)/(1−pT)`, `[T²]=p²−p`), `k=1`, `k=3,p=2`, `k=12,p=2`, power-trace control | `m₂⁰(q)=q−1`; `Z₁=1−T` at `p=2,3,5`; `Z₃(2)=1+3T−4T²` with `m₂³(4)=−17`; `Z₁₂(2)` as stated; control not polynomial | agrees | none |
| `momentSeries_eq_intPolynomial` degree | 34 pairs `(p,k)` listed above | degrees `(k+1)/2−⌊(k+p)/2p⌋`, `(k+1)/2`, `k/2−⌊k/2p⌋`, `⌊(k+2)/4⌋` all match; `k=9,p=3`: `5−2=3` | agrees; ℕ-subtraction never truncates since `(k+p)/(2p) ≤ (k+1)/2` | none |
| `momentSeries_weights` | `k=1,2` (`Q=1`, vacuous), `k=3,p=2`, `k=4` both parities of `p`, `k=6,p=3`, `k=8,p=2`, `k=10,p=2`, `k=12,p=3` | roots `−1/4` (`2^{−2}`); `1/p²` (`p^{−k/2}`); `−1/27` (`3^{−3}`); `1/16`; `|T|=2^{−5.5}`; `±1/729` | agrees; boundary roots occur only for even `k` | none |
| §1.2 characteristic polynomial, pairing | `𝔽₂`, `a=1`; `k=3,p=2` partner | `1+T+2T²`, roots `2^{−1/2}`; `16/(−4)=−4` vs `4/(−4)=−1` not a root | agrees; refutes the `p^{(k+1)/2}` involution printed in FSY | none |
| §1.1/1.3 normalization, monodromy table | `r=2`, `r=3`, `r=7,p=2`, `c↦−c` | trace `−1/c`; `c^{−2}=p^{−1}`; `G₂` | agrees with XZ (1.1.2.1)–(1.1.2.3) | none |
| §2.2 cyclic cover | `r=2`, `r=3` with `y↦ζy` | `t(y+y⁻¹)` invariant under `(−t,−y)`; `ζ²` on `t·y₁` for `r=3` | agrees | none |
| §2.6 Bessel dictionary | `r=2,λ=1`; odd `r`; `λ=0` | `θ²f=xf`, `θ²e=xe`; `θ^r f₁=(−1)^rλ^r x f₁` vs `θ^r e_r=λ^r x e_r` | agrees; sign difference for odd `r` as stated | none |
| §4.2 `K_{r,k}` | `(2,2)`, `(2,3)` over `ℚ` and `𝔽₃`, `nk=1` excluded | `(y₁+y₂)(1+y₁y₂)`; `±2±2±2≠0`; `6≡0 (3)` | agrees; `kn ≥ 2` hypothesis present | none |
| §4.3 weights | `r=2,k=3` | `nk−1=2`, twist gives `4=k+1` | agrees with Theorem 3.8 | none |
| §5.1 frame | `k=1,2` | `θ(v₀v₁)=v₁²+zv₀²`; `dz/z=2dt/t` | agrees with (4.5) | none |
| §5.3 extensions | `k=2,4`; `j_!→j_*` at `0` | `(−1)^{k/2}=−1` for `k=2` (iso), `+1` for `k=4` (not iso); cokernel `i_{0+}ℂ` always | agrees with Cor. 4.9 | none |
| §5.5 `d_k` | `k=1..12` | `0,0,1,0,2,2,3,2,4,4,5,4`; `2⌊(k−1)/4⌋` for even `k` | agrees with (4.13) | none |
| §6.6 Hodge table | `k=3,5,6,7,8,9,10,4` | middle indices `{2,4,…,k−1}` resp. `min∈{2,…,2⌊(k−1)/4⌋}`; counts equal `d_k`; extra `(k/2+1,k/2+1)` iff `4∣k` | agrees with Theorem 1.8 | none |
| §7.1 boundary | `k=2` chart; `K̄∩(z_r)` | `g₁(0,z₂)=1`; `A=−1/z₁` a unit | agrees | none |
| §7.2 singular orbits | `k=9,p=3`; `k=6,p=3`; `k` odd, `p=2` | `a∈{1,3}`, constants `6,18` (`v₃(18)=2`); `b∈{0,2}`; `g(1,…,1)=2k`, `v₂=1` | agrees; the `a=3` point has thickness 2, outside RD.7.20 | none (gap declared) |
| §7.4 `V_{k,ℓ}` | `k=1,2,4,6,7`; pairing multiplier | dims `0,0,0,2,3`; `p^{k+1}` on geometric Frobenius | agrees | none |
| §8.3 odd local structure | `k=9,p=3`; `k=3,p=3`; `k=5,p=3,5` | `Θ⁻₃={1}`, `Θ⁺₃={3}`, eigenvalue `((−1)^5·2/3)·3^5=+243` (`−2≡1`); `V^{I₃}=0`; factors `(1+27T)⁻¹`, `(1−125T)⁻¹` from `Z₅(3)`, `Z₅(5)` | agrees with Theorem 5.8 and the computed `Z₅` | none |
| §8.5 `oddEulerFactorInv`, `oddConductor` | `k=1`; `p=2`; `k=9`; `k=3`; `k=5` | empty product; `Θ⁺₂=∅`; `3·5·7=105=sf(3)sf(5)sf(7)sf(9)`; `3`; `15` | agrees; `(1+ap)/2` is exact for odd `a,p` | none |
| §8.6 `evenEulerFactorInv`, `evenConductor` | `k=4` odd `p`; `k=6,8,p=3`; `k=2` | `1`; `1+27T`, `1+81T`; `evenConductor 6=3`, `8↦3`, `2↦1`; `oddRad` vs `sf` differ at `k=6` (`3` vs `15`) | agrees with (5.22) and the computed `Z₆(3)`, `Z₈(3)` | none |
| §9.2 polarization | `k=7`, `k=6` | HT weights `2,4,6` / `2,5`; multiplier exponent `−8` even / `−7` odd | agrees with Patrikis–Taylor's parity condition | none |
| §10.1 determinant | `k=3,7,1`; sign rule | `3!!=3≡3 (4)` → `ℚ(√−3)`; `105≡1 (4)` → `+`; residues of `k!!` mod 4 give `+` iff `k≡1,7 (8)` | agrees with FSY p. 53 | none |
| §10.2 `paperGamma` | `d=0,1,2`; `k=7` | `1`; `Γ_ℝ(s−1)=π^{1/2}G₁`; `Γ_ℝ(s−1)Γ_ℝ(s−2)=π^{3/2}G₂`; with `h^−=1` the `k=7` recipe gives `Γ_ℝ(s−1)Γ_ℝ(s−2)Γ_ℝ(s−3)` | agrees; constant `π^{d(d+1)/4}` | none |
| §10.3 epsilon | `k=6,p=3`; `k=3,∞`; `k=8` prediction | `v=⌊6/12⌋=0`; `i^{(9−1)/8}=i`; `t₈=1+0+0+1=2` | agrees with (5.34)–(5.36) | none |
| §10.4 / `oddMoment_functionalEquation` | `k=1`; `k=3` | `Λ₁=1`, `1=1`; `3^{s/2}π^{−s/2}Γ((s−1)/2)L(s−2,χ_{−3})`, reflection `s↦5−s` | agrees with Theorem 1.2 | none |
| `evenMoment_functionalEquation` | `k=2,4`; `k=6` | `r=0`, `P=1`, `ε=1` satisfy it with `Λ=1`; `N′₆=3`, `d₆=2`, factor `(1+27·3^{−s})⁻¹` | agrees with Theorem 1.3's existential form | none |
| §6.1 fan (R01's target) | `k=1,2` | rays `3^k−1=2,8`; cones `2^k k!=2,8` | agrees; only the supplier's section labels are wrong | R01 |

**README shape and style.** Summary, Scope and ownership, Conventions, Exact supplier contracts,
How to read the build, Layers 0–11 with `### k.n` prose, `**Checks.**` (three or more per definition,
each with a computed value or a non-example), `*Needs:*` lines, `### Examples` and `### Dependencies`
per layer, Downstream consumers, Worked examples, Corrections to the sources, References. No LaTeX
delimiters, no process words, no pull-request numbers, no machine paths, no HTML anchors, no `lemma`.
Every cited work is in `sources.toml` (FSY, XZ, Serre-orthogonal certified; Saito-orthogonal
uncertified by its DOI). Ownership against open pull requests was checked by object for the Kloosterman
sum (CongruenceSpectralGap §4.2a owns it; the Lean file's `kloostermanSum` is documented as its rank-two
eliminated form, needed only so the headlines are statable) and for the Kloosterman `F`-isocrystal and
`p`-adic comparison (PadicDifferentialEquationsAndRigidCohomology owns them); the board package
KloostermanSheavesAndBesselIsocrystals (design only) is later in the order and only a consumer.

## Not verifiable

- `Saito-orthogonal` (Invent. Math. 120, 1995): paywalled, recorded as uncertified; its hypotheses are
  carried by the declared gap:orthogonal-motive-root-number and were not checked against the text.
- The degrees of `Z_k(p;T)` for `p = 5` with `k ∈ {6, 8, 10}` and `p = 7` with `k ∈ {6, 8}` were checked only
  up to the order the computation reached (`m ≤ 3`, resp. `m ≤ 2`); the computed coefficients are
  consistent with the claimed factorizations but the vanishing of the next coefficient was not seen.
- The `2`-adic quantities `r_k`, `L_k(2;T)` and `ε_k` for even `k` are existential in the source as well;
  no value was checked beyond `r₆ = 1` from the level-6 newform and the `k = 2, 4` trivial cases.

## Source issues

- **Misprint** in FSY at §5.1.1, p. 40 (line 1731): the source says the reciprocal roots of `M_k(p;T)` are stable under `α ↦ p^{(k+1)/2}/α`; it should be `α ↦ p^{k+1}/α`, as the self-duality into `ℚ_ℓ(−k−1)` and the example `k = 3`, `p = 2` (root `−4`, partner `−4`) show; affects nothing.
- **Misprint** in FSY at §3.2.1, p. 23 (line 987): the source says `K̃l_{n+1}` is the localized Fourier transform of `Rg_*ℚ_ℓ(ζ)_{𝔾_m^{kn}}[n]`; it should be the torus `𝔾_m^n` for the single sheaf, `kn` being the dimension for the `k`-th tensor power; affects nothing.
- **Gap** in FSY at proof of Proposition 5.23, p. 50 (lines 2249–2254): the source says every ordinary quadratic point of `K̄′` over `ℤ_p[√−p]` has a local equation `Q − u·(√−p)²` with `u` a unit; it should allow constant terms `2ap` (resp. `2bp`) of `p`-adic valuation greater than one when `p ∣ a` (resp. `p ∣ b`), for instance `18` at `k = 9`, `p = 3`, `a = 3`, which is `Q − u·(√−3)⁴`; affects the proof (semistability of the blow-up at those points needs a higher-thickness Picard–Lefschetz input, declared here as a supplier gap).
- **Misprint** in FSY at proof of Proposition 4.20, p. 33 (line 1408): the source says the graded pieces of the monodromy filtration centred at `k − 1` are the `Ñ^ℓ P_k`; it should be `P_{k−1}`, the primitive part of the single Jordan block of size `k`; affects nothing.
- **Misprint** in FSY at §5.1.2, p. 41 (line 1761): the source says `∂g₁/∂z₁` does not vanish on the divisor `(z_r)`; it should say on `(g₁) ∩ (z_r)`, where it equals the unit `−1/z₁`, which is what the displayed equalities give and what smoothness needs; affects nothing.
- **Misprint** in XZ at §2.1.5(i), p. 10 (line 489): the source says the Frobenius structure `F^*A_π → A_π` of the connection `d + π dt` is multiplication by `exp(π(x − x^p))`; with that direction and sign convention the horizontal multiplier is `exp(π(x^p − x))` (`exp(π(x − x^p))` is horizontal for the map in the other direction); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "29f13da2062c79d85b0f4e4e4346309fe0268d64", "job": "REV-PKG-KloostermanMomentsAndPotentialAutomorphy", "model": "fable", "worker": "chris-x18"} -->
