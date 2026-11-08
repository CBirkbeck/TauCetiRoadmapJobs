# Review of AutomorphicFormsOnReductiveGroups (pull request #1037 at 06102df)

**Verdict:** needs changes

Incremental re-review of the 23 lines changed since 753cac0. All of them are in `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md`: lines 47, 57, 81, 662–671, 730 and 1308, plus the deleted Kudla reference. `Suggested.lean` and `metadata.toml` are unchanged, and nothing outside the folder differs from `origin/main`. The change moves the source of the additive characters of `F\𝔸_F` from ArithmeticGaloisRepresentations §2.7 to AnalyticNumberTheoryPartII §§5.3g–5.3h. It deletes §4.3's own proof of `F⊥=F`, the adapter `addChar_equiv` and the four character Checks.

Every new citation resolves at AnalyticNumberTheoryPartII's head. Its sign convention for `ψ` is the one this roadmap used before. Nothing elsewhere still cites the deleted material. Three P3 findings remain. The gate fails on two mentions of a dropped roadmap in untouched lines; the dropped-names list now includes it. The change also leaves §4.3's Fourier block with two Checks, and it drops ArithmeticGaloisRepresentations from the supplier contracts while §5.8b still uses it.

## R01 (P3) — The gate fails: two mentions of a dropped roadmap

- **Location.** `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md` line 11 (Scope and ownership): "QuaternionicModularForms specializes the carrier, the evaluation equivalence and the Hecke action to quaternion algebras and owns their integral, Banach and overconvergent forms." Line 1312 (Downstream consumers): "QuaternionicModularForms specializes §7.4's abstract level-form carrier, … and owns their integral, Banach and overconvergent specializations."
- **Claim.** Both sentences name QuaternionicModularForms as a consumer.
- **Witness.** The gate at 06102df prints `dropped=2 … FAIL`, citing exactly lines 11 and 1312. QuaternionicModularForms is on the project's dropped-names list, and the gate refuses any mention of a name on that list, consumer mentions included.
- **Repair.** Delete the two sentences. Nothing else in the README refers to them, and §§7.4–7.6 keep their own statements. Tested on a scratch copy of the README: with exactly these two sentences deleted, a word-boundary scan against the dropped-names list finds no hit. Rerun the gate afterwards.

## R02 (P3) — §4.3's Fourier block has two Checks, neither of which fixes the sign of `ψ`

- **Location.** README lines 666–669. After the change, the Checks under the `fourierCoeff` / `fourier_expansion` / `fourierCoeff_translate` paragraph (line 664) are only "`ξ=0` gives the trivial character, and `c_0` is the mean of `f`" and "The function `ψ(x)` itself has `c_1=1` and every other coefficient zero; its translate by `a` has `c_1=ψ(a)`."
- **Claim.** Deleting the four character Checks was correct: they tested `ψ` and `F⊥`, which now come from AnalyticNumberTheoryPartII. But the definition `fourierCoeff` is left with two Checks, below the minimum of three. No Check in this roadmap ties `c_ξ` to the classical coefficients of `e^{2πinx}`, which §§4.4, 4.5 and 7.2 use.
- **Witness.** Both remaining Checks still hold under Tate's opposite convention `ψ_∞(x)=e^{−2πix}`, `ψ_p(x)=e^{2πi{x}_p}`: `c_0` is the mean whatever `ψ` is, and any `ψ` has `c_1(ψ)=1`. The sign is now pinned only by AnalyticNumberTheoryPartII §5.3h's Check `ψ(1/6)=1`.
- **Repair.** Add a third Check along these lines. For `F=ℚ` and `f` invariant under `Ẑ`, put `g(t)=f(t,0)`, a function on `ℝ/ℤ`. Then `c_n(f)=∫₀¹g(t)e^{−2πint}dt` for `n∈ℤ`. Also `c_ξ=0` for `ξ∈ℚ∖ℤ`: translating by `(0,u)`, with `u∈Ẑ` equal to `1` at a prime `p` where `ξ∉ℤ_p` and `0` at the other primes, fixes `f` and multiplies `c_ξ` by `e^{−2πi{ξ}_p}≠1`. For `g(t)=e^{4πit}`, `c_2=1`; with `ψ_∞(x)=e^{−2πix}` the coefficient would sit at `ξ=−2`.
- **Verification of the proposed Check.** `[0,1)×Ẑ` is a fundamental domain of mass one. For `n∈ℤ`, `ψ(n(t,u))=e^{2πint}`, since `nu_p∈ℤ_p`. The translation law of line 664 gives `(1−ψ(ξa))c_ξ=0` for `a=(0,u)`.

## R03 (P3) — ArithmeticGaloisRepresentations is no longer in the supplier contracts, but §5.8b still uses it

- **Location.** README line 47 now opens with "**AnalyticNumberTheoryPartII.** Section 5.3g supplies …". It replaced the only ArithmeticGaloisRepresentations paragraph of `## Exact supplier contracts`. Line 922 (§5.8b) still says "Using arithmetic Frobenius from ArithmeticGaloisRepresentations §§2.1–2.2, construct the universal system `galoisAnemicEigenSystem`".
- **Claim.** `## Exact supplier contracts` (lines 35–71) no longer names ArithmeticGaloisRepresentations at all, although the roadmap consumes its §§2.1–2.2.
- **Witness.** At 06102df, "ArithmeticGaloisRepresentations" occurs only at line 922. ArithmeticGaloisRepresentations at its head (cf6ae2f) has "2.1 Decomposition groups" (its README line 1581) and "2.2 Ramification and Frobenius" (line 1761). It is at line 56 of the merge order, before this roadmap at line 58.
- **Repair.** Add one supplier paragraph, for example: "**ArithmeticGaloisRepresentations.** §2.1 (decomposition groups) and §2.2 (ramification and Frobenius) supply the arithmetic Frobenius classes `Frob_v` at the places where a continuous representation of the absolute Galois group of a number field is unramified, used by §5.8b." The dependency check already loads this edge with 0 problems, so the paragraph adds no new edge.

## Previous findings

The previous report (r8) had no findings of its own. It recorded the r7 findings R01 and R02.

- R01 — repaired: line 45 is unchanged since r8 verified it: "F.4.0 supplies `ContinuousRep.exists_stable_lattice_iff` for every nonarchimedean local field, including equal characteristic, the stable-lattice carrier `GaloisLattice.IntegralModel` over a discrete valuation ring with its fraction field …"
- R02 — repaired: the description's merge-order block now runs "#820 … → #1167 (AnalyticNumberTheoryPartII) → #1688 … → #871 (ArithmeticLocallySymmetricSpaces) → this pull request". The consumers #934, #1015 and #1145 are gone. The description is pull-request text, read as data.

## Verified sound

**Gate, build and edits outside the folder.**
- The gate, rerun at 06102df: every check is 0 except `dropped=2` (R01). The worker's gate.md reports `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AutomorphicFormsOnReductiveGroups'` is empty. The long list of outside files in changes.md comes from the merge of `origin/main` (62431080), not from this pull request.
- `git diff 753cac0 HEAD` within the folder touches only README.md (8 insertions, 15 deletions).
- `lake env lean TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/Suggested.lean` prints only `declaration uses sorry` at line 47, exit 0.
- Dependency check output at this head:

```
depcheck: 239 roadmaps, 2362 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The merge order lists AnalyticNumberTheoryPartII at line 50, ArithmeticGaloisRepresentations at 56, ArithmeticLocallySymmetricSpaces at 57 and this roadmap at 58. AnalyticNumberTheoryPartII is a new-roadmap pull request (#1167) earlier in the order, so it is an admissible supplier, and the description's "Depends on" and merge-order blocks both name it.

**The new supplier citations, resolved at AnalyticNumberTheoryPartII's head (0d40b02).**
- Its README line 680, §5.3g, defines `ψ_v=ψ_w∘Tr`. It uses `ψ_ℝ(x)=exp(2πix)`, `ψ_{ℚ_p}(x)=exp(−2πi{x}_p)` and `exp(2πi(z+z̄))` at complex places, with `ψ=∏_vψ_v`. At finite places "the largest fractional ideal on which `ψ_v` is trivial is the inverse different". Its first bullet is local self-duality `y↦ψ_v(B(·,y))`. These are the three things README line 47 attributes to §5.3g.
- Line 697, §5.3h. Its first bullet gives the duality of restricted products and the adelic self-duality. Its second bullet states "`V` is discrete and cocompact in `V_𝔸`, its annihilator under `ψ(B(·,·))` is `V`, … the continuous characters of `V_𝔸/V` are the `ψ(B(·,y))` with `y∈V`, each for exactly one `y`". This is the identification `ξ↦ψ(ξ·)` for `V=F`, `B(x,y)=xy`, as lines 47 and 662 say. Its third bullet names `adeleRing_selfDual`.
- `adeleRing_selfDual` is in AnalyticNumberTheoryPartII's `Suggested.lean`, namespace `TauCetiRoadmap.AnalyticNumberTheoryPartII`. It asserts existence of `ψ ≠ 1` trivial on `K`. For every such `ψ` it gives `e : AdeleRing (𝓞 K) K ≃ₜ PontryaginDual (Multiplicative (AdeleRing (𝓞 K) K))` with `e y x = ψ(x*y)`, and an annihilator of `K` equal to `Set.range (algebraMap K _)`. That is "self-duality of `𝔸_F` with `F⊥=F`", as cited at lines 47, 662 and 730.
- The §5.3g/§5.3h Needs lines use only §5.3f, Mathlib, RestrictedProducts and GlobalNumberFields Layers 4–5. This matches line 47's "use only local fields, traces, adeles and scalar harmonic analysis; they precede automorphic forms".
- AnalyticNumberTheoryPartII's README line 3167 lists this roadmap's §4.3 as a consumer that takes the identification and "builds on it its own Fourier coefficients on `𝔸_F/F`, the Fourier expansion and their translation law". The two roadmaps agree on who owns what.
- The changed downstream line 1308 says AL.0 takes `ψ` and local self-duality from §5.3g. AutomorphicLFunctionsAndLocalFactors at its head (330bb72), README line 20, reads "AL.0.2 (AL.0.2.1–AL.0.2.5), characters, trace duality and self-dual measures: AnalyticNumberTheoryPartII §5.3g"; line 81 agrees.
- Line 57 ("the character duality of `F\𝔸_F`, which is AnalyticNumberTheoryPartII §5.3h"), line 81 (build order) and the Layer 4 Dependencies line 730 are consistent with the above and with each other.

**No dangling references.**
- `roadmaps grep 'addChar_equiv'`: no match on main or in any open roadmap pull request.
- "Kudla" no longer occurs in the README, and its reference entry is deleted.
- AutomorphicLFunctionsAndLocalFactors line 1640 still cites "AutomorphicFormsOnReductiveGroups, §4.3, number-field Fourier/character duality". §4.3 still states that identification, imported, and the Fourier expansion, so the citation resolves.
- Line 830 (§5.5) uses "global cuspidal genericity from §4.3", i.e. `cuspidalGLn_hasWhittaker`, which is unchanged.
- The overlap tool reports no id of this README that only an open revision defines, and no other open pull request that changes this roadmap.

**Lean form and headline.** `Suggested.lean` is byte-identical to the file the previous review read. The elaborated type of `compactFinite_dense_locallyConvex` in signatures.md has `[CompactSpace K] [T2Space K] [IsUniformAddGroup E] [T2Space E] [LocallyConvexSpace ℝ E] [CompleteSpace E]` and the joint-continuity hypothesis. It concludes `Dense` of the vectors whose orbit span is finite-dimensional, which is README §2.1's statement. No binder is dropped. The change touches no headline, and the headline list and one-tactic probe stand as in the previous reports.

**Seeded sample.** None of the fifteen sampled targets (0.1a, 0.2, 0.7, 1.2, 2.3, 3.4, 3.5, 4.2, 5.2, 5.4, 5.5, 5.8, 5.8a, 6.1, 6.3) falls in the changed hunks (README lines 44–47, 54–57, 78–81, 659–680, 727–733, 1305–1311 and 1323–1329). §4.2 ends at line 658, before the §4.3 hunk. Their texts are byte-identical to the head the previous review accepted, so under the incremental rule their locators were not reopened. Computed rows for the eight sampled targets the carried table lacked are added below. The README flags no locator as unverified. The Cogdell locators on the changed lines 664 and 671 are unchanged text; the r7 review checked them against the cached text (Theorem 1.1 on printed p.7, §1.2 on printed p.10).

**Principles.**
- The change removes a re-proof (`F⊥=F`) and an adapter that AnalyticNumberTheoryPartII owns, and cites them by section and declaration name, as "import, never re-plan" requires.
- No process word, pull-request number, LaTeX or local path appears in the new text. The declared gaps `gap:banach-gfinite-density` and `gap:reductive-enveloping-centers` are unchanged.
- The new text keeps the `ψ` sign convention the README stated before, so §§4.4, 4.5 and 7.2 need no conversion; R02 asks only for a local witness of it.

**Adversarial table.** New rows for the changed statements and for the eight sampled targets not covered before, with computed values. The rows for untouched statements are carried from the previous report, marked "(previous report)". The previous report's two §4.3 rows for `ψ_ℚ` and `F⊥=F` covered text that is now deleted; they are replaced by the first three rows, recomputed against the supplier.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| line 47 / §4.3: `ψ=∏ψ_v` of AnalyticNumberTheoryPartII §5.3g, sign convention | `x=1/3`; `x=1/6` over `ℚ` | `e^{2πi/3}·e^{−2πi/3}=1`; `{1/6}_2=1/2`, `{1/6}_3=2/3`, `e^{2πi(1/6−1/2−2/3)}=e^{−2πi}=1`; reversed finite sign `e^{2πi·4/3}=e^{2πi/3}≠1` | supplier sign = the sign this README used before; no drift | none |
| line 47: inverse different is the largest fractional ideal on which `ψ_v` is trivial | `ℚ(i)` at `v=(1+i)`, `𝔡_v=(2)`; `ℚ_p` | `Tr(a/2+bi/2)=a∈ℤ_2`: trivial on `(1+i)^{−2}O_v`; `x=(1−i)/4∈(1+i)^{−3}O_v`: `Tr x=1/2`, `ψ_2(1/2)=−1`; `ℚ_p`: `ψ_p(1/p)=e^{−2πi/p}≠1`, ideal `ℤ_p` | holds; the wrong model `O_v` loses the different at `v=(1+i)` | none |
| lines 47, 662: `ξ↦ψ(ξ·)` onto the characters of `F\𝔸_F` (§5.3h, second bullet) | `F=ℚ`: `ξ=0`, `ξ=1/2`, adele `a=(1/2;0,0,…)` | `ξ=0`: trivial; `ψ(ξq)=1` for `q∈ℚ` since `ξq∈ℚ`; `ξ≠0`: `ψ(ξ·ξ⁻¹x)=ψ(x)`, nontrivial, so injective; `ψ(a·1)=e^{πi}=−1`, so `a` gives no character of `ℚ\𝔸_ℚ` | holds | none |
| `adeleRing_selfDual` as cited (lines 47, 662, 730) | `K=ℚ`, standard `ψ`; `ψ′(x)=e^{2πix_∞}` | `y=1/2∈ℚ`: `ψ(ξ/2)=1` for all `ξ∈ℚ`, in range; `y=(1/2;0,…)`: `ξ=1` gives `−1`, not in the annihilator; `ψ′(1/2)=−1`, so `ψ′` is excluded by the hypothesis "trivial on `K`" | the hypotheses are the ones the citation needs | none |
| line 664: `fourierCoeff`, `fourier_expansion`, `fourierCoeff_translate` | `f=1`; `f=ψ`; `f=ψ(·+a)`; general `f` | `c_0(1)=1`, others `0`; `c_1(ψ)=1`, `c_ξ(ψ)=∫ψ((1−ξ)x)dx=0` for `ξ≠1`; `c_1(ψ(·+a))=ψ(a)`; substituting `y=x+a`: `c_ξ(f(·+a))=ψ(ξa)c_ξ(f)`; wrong model `∫fψ(ξx)` gives `c_{−1}(ψ)=1`; vol-`V` measure gives `c_0=V·mean` | holds; both wrong models excluded by lines 668–669 | none |
| line 664: classical comparison at level `Ẑ` (R02) | `F=ℚ`, `f` `Ẑ`-invariant, `g(t)=f(t,0)=e^{4πit}`; `ξ=1/2` | domain `[0,1)×Ẑ`, `ψ(n(t,u))=e^{2πint}`: `c_n=∫₀¹g e^{−2πint}`, so `c_2=1`; under `ψ_∞=e^{−2πix}`, `c_{−2}=1`; `ξ=1/2`: `u=e_2` gives factor `ψ_2(1/2)=−1≠1`, so `c_{1/2}=0` | true, but no README Check fixes it | R02 |
| line 57: character duality is AnalyticNumberTheoryPartII §5.3h | §5.3h, second bullet, at 0d40b02 | annihilator of `V` is `V`; characters of `V_𝔸/V` are `ψ(B(·,y))`, `y∈V` | holds | none |
| line 1308: AL.0 takes `ψ` and local self-duality from §5.3g | AutomorphicLFunctionsAndLocalFactors at 330bb72, lines 20, 64, 81 | AL.0.2 → AnalyticNumberTheoryPartII §5.3g | holds | none |
| supplier contracts after the change | every roadmap section the README consumes | ArithmeticGaloisRepresentations §§2.1–2.2 consumed (line 922), named in contracts: 0 times | missing supplier entry | R03 |
| §0.2 normalized idempotent (sample) | `vol(J)=2` | `e_J=(1/2)1_J`, `e_J*e_J=(1/4)·2·1_J=e_J`; `1_J*1_J=2·1_J` | holds | none |
| §0.7 `cosetSystem_volume` (sample) | `g=1`; `GL₂(ℚ_p)`, `U=GL₂(ℤ_p)`, `g=diag(p,1)` | one coset, `μ(U)`; cosets `diag(p,1)U` and `[[1,a],[0,p]]U`, `a=0,…,p−1`: `p+1`, `μ(UgU)=(p+1)μ(U)` (`p=2`: 3) | holds | none |
| §1.2 smooth cochains (sample) | `f(x)=x`, `f(x)=x²` on `ℝ`; sign action of `C₂` | `y−(x+y)+x=0`; `df(1,2)=4−9+1=−4`; `dv(g)=−v−v=−2v` | holds | none |
| §2.3 normalized induction (sample) | `SL₂(ℝ)`, `a=diag(2,1/2)`; `I(ε,ν)` at `(1,0)`, `(0,1)` | `δ_P(a)=4`, half-modulus `2`, covariance `t^{ν+1}`; Casimir `(ν²−1)/4`: `−1/4`, `0`; `ν≡ε+1 mod 2` gives reducible at both points | holds | none |
| §3.4 restricted tensors (sample) | `M_r(ℂ)⊗M_s(ℂ)`; `C₂×C₂` module `1⊗1⊕sgn⊗sgn` | standard module of dimension `rs`; character matrix `diag(1,1)`, rank `2≠1`, not a pure tensor | holds | none |
| §3.5 spherical lines (sample) | `GL₂(ℚ_p)`: unramified principal series, Steinberg; Iwahori `I` | `K`-fixed dimensions `1`, `0`; `I`-fixed dimensions `2` (`|W|=2`), `1` | holds; the bound needs hyperspecial level | none |
| §4.2 cuspidality and `L²` (sample) | split `SL₂` constants; unitary adelization of `E₄` | Borel constant term `∫_{N(F)\N(𝔸)}1=1≠0`, so not cuspidal; `y^{k/2}|E₄|~y²`, `∫y⁴·y⁻²dy` diverges at the cusp, so not `L²` | holds | none |
| §5.4 Vogan–Zuckerman Hodge types (sample) | `U(2,1)` holomorphic `𝔮`; `SL₂(ℝ)` | `dim_ℂ𝔭=4`, `dim 𝔭⁺=2`, `(R+,R−)=(2,0)`; `D₂^±`: `H¹` one-dimensional of types `(1,0)`, `(0,1)` | holds | none |
| §5.6 existence in equal characteristic via `nonempty` | `E=𝔽_q((t))`, `J=GL_n(𝔽_q[[t]])`, `n=0,1,2` | `J` compact, `O_E` compact, open embedding; `n=0`: `Λ=0`; `n≥1`: `𝔽_q[[t]]^n` and `t·𝔽_q[[t]]^n` stable and distinct | holds (previous report) | none |
| §5.6 existence in characteristic zero | `E=ℚ_2`, `J` upper unipotent over `ℤ_2` | `ℤ_2²` stable; `2ℤ_2²≠ℤ_2²`; `ℤ_2e₁⊕2ℤ_2e₂` stable, not homothetic | holds (previous report) | none |
| §5.6 non-example via `exists_stable_lattice_iff` | `⟨t⟩⊂GL_1(𝔽_q((t)))`; `⟨diag(p^m,1)⟩` | closure noncompact; no stable lattice | holds (previous report) | none |
| §5.6 `exists_pow_le` | `Λ=ℤ_p`, `Λ′=p^kℤ_p` | `a=|k|` works, `a=0` fails for `k≠0` | holds (previous report) | none |
| §5.6 `nonempty_iso_genericFibre` | `Λ=𝔽_q[[t]]^n` | both sides of dimension `n`; `n=0`: both zero | holds (previous report) | none |
| §5.6 conjugation transport | `E=ℚ_p`, `g=diag(p,1)`, unipotent `J` | `gJg⁻¹` preserves `gL`; `g⁻¹Jg` sends `(0,1)` to `(1/p,1)∉gL` | holds (previous report) | none |
| line 45, hypotheses of `nonempty` | `O=ℤ`; `O=𝔽_q[[t]]` | `ℤ` not compact, not a DVR; `𝔽_q[[t]]` applies | holds (previous report) | none |
| `compactFinite_dense_locallyConvex` (Lean) | trivial `K`; finite `K`; `E=0`; `S¹` on `C(S¹)`; `∏C₂` on `C(K)` | orbit spans of dimension at most `#K`; trigonometric polynomials dense; functions through finite quotients dense | holds (previous report) | none |
| §5.6 Checks `pL≠L`, rank 0 | `p=2`; rank 0 | `2ℤ_2≠ℤ_2`; `0` the only lattice | holds (previous report) | none |
| §5.6 divided powers vs `Sym²` | `L=ℤ²`, degree 2 | index 2 | holds (previous report) | none |
| §1.3 `vanEstIso` degenerate cases | compact `L`; `ℝ^n`, `n=0,1`; finite `L` | `V^L`, 0; `Λ^q`; `ℝ`; `ℝ,ℝ`; `V^L` | holds (previous report) | none |
| §1.3 `H^q(𝔰𝔩₂,SO(2);ℂ)`, `O(2)` | `q=0,1,2` | `ℂ,0,ℂ`; `H²(…,O(2))=0` | holds (previous report) | none |
| §1.3 `GL_n(ℝ)/O(n)` dimension | `n=1,2` | `1`, `3` | holds (previous report) | none |
| §2.3a `P=G` iff `Σ=∅` | `ℝ^×`, `SL₂(ℝ)`, compact, `GL_n(ℝ)` | `P=G`; `Σ={±λ}`; `S_n` | holds (previous report) | none |
| §2.5 `W_ℝ` conventions | `j·2`; `|x|^s sgn^ε`; `D_k(0)` | `(j·2)²=−4`; `|z|^{2s}`; lowest type `ℓ+1` | holds (previous report) | none |
| §2.5 symmetric powers | `n=1,m=0`; `n=2,m=2` | `1`; `3` | holds (previous report) | none |
| §2.5 non-semisimple parameter | Jordan block | excluded | holds (previous report) | none |
| §3.1 smooth automorphic forms | compact `G_∞`; `GL₂`, `K₀(N)`, weight `k` | finite-dimensional | holds (previous report) | none |
| §3.1 `classicalEquiv` components | `GL₁/F`; `GL₂/ℚ` | class group; one component | holds (previous report) | none |
| §4.3 Eisenstein coefficients | `k=4` | `−2k/B_k=240`, constant term 1 | holds (previous report) | none |
| §5.1 C- vs L-algebraic | `GL₂` trivial, `D_k(0)`, `SL₂`, `PGL₂` | `ρ=(1/2,−1/2)`; `−ρ` integral iff `k` even | holds (previous report) | none |
| §5.1 Chenevier–Taïbi convention | `|·|`, `|·|^{it}`, `sgn`, `D₂(0)` | only the last two give `±1` | holds (previous report) | none |
| §5.2 coefficient equation | `D_k(μ)`, `V_{(a,b)}` | `a−b=k−2`, `a+b=−μ` | holds (previous report) | none |
| §5.2 `GL₁(ℝ)`, `sgn`, `x^m` | `m` even, odd | no invariant cochains; acyclic | holds (previous report) | none |
| §5.2 Casimir match | `D_k⊗Sym^m` | iff `m=k−2` | holds (previous report) | none |
| §5.3 `(q₀,ℓ₀)` | `PGL₂/ℚ`, imaginary quadratic, `PGL₃/ℚ`, torus, CM `GL_n` | `(1,0)`, `(1,1)`, `(2,1)`; `ℓ₀=1,q₀=0`; `dn−1`, `dn(n−1)/2` | holds (previous report) | none |
| §5.5 purity arithmetic | `n=2,k=12`; unitary | `w_raw=−10`, `w_C=−11`; `0`, `−1` | holds (previous report) | none |
| §5.7 rationality | trivial, `χ₋₄`, order `m`, `Q₈` | `ℚ`, `ℚ`, `ℚ(ζ_m)`, Schur index 2 | holds (previous report) | none |
| §5.8 torsion eigensystem | `ℤ[X]` on `ℤ/8`, `c=4` | `X↦±1` both eigen-characters | holds (previous report) | none |
| §5.8a, §5.8b twists | `𝔽₇`, `(2,3)`, `χ=2`; `q=3`, `det=6` | `(4,5)`; `s=2`, `qs=6` | holds (previous report) | none |
| §6.1 Hermitian datum | `SL₂`, `GSp₄`, compact mod centre, product | `1`; `3`; `0`; additive | holds (previous report) | none |
| §6.3 `GSp₄` coordinates | `(3,2;0)`, `(2,2;−2)`, `(4,2;−3)`, `(3,2;1)` | `c_H`: `5,0,0,7` | holds (previous report) | none |
| §6.3 chambers and walls | `(4,2)`, …, `(t,t)` | `C₀…C₃`; compact wall | holds (previous report) | none |
| §6.4 component theory | `ε`; `E(4,2)` | `ε²=1`, `ν(ε)=−1` | holds (previous report) | none |
| §6.5 degrees | `C₀`, `C₃`, `C₁` | `0`, `3`, `1` | holds (previous report) | none |
| §6.6 `Separated` | `(20,10)`, `(12,12)`, `(12,2)`, `(5,0)`, `R=5` | holds, fails, holds, fails | holds (previous report) | none |
| §6.6 elementary implications | `k−l>R+2` | converse for `R>2` | holds (previous report) | none |
| §6.6 Pilloni parity | `(a,0;c)` | `a−c` odd | holds (previous report) | none |
| §6.7 `C(κ)` | `g=1`, `κ=−k`, `κ=1` | `{1}`, `{1,s}`, `{s}` | holds (previous report) | none |
| §6.8 scalar parameters | `Sp₂`, `Sp₄`, `U(1,1)`, `U(2,2)` | `1,0`; `(2,1)`, `(1,0)`; `(3,3)` | holds (previous report) | none |
| §7.1 characters | order `m`; norm character | `ℚ(ζ_m)`; type 1, conductor 1 | holds (previous report) | none |
| §7.2 raising operator, Casimir | `f=1,y=1,k=2`; `Δ` | `2`; `30` | holds (previous report) | none |
| §7.3 Hecke normalization | `k=0,2`; `Δ`, `p=2` | `p`, `1`; `−3/4` | holds (previous report) | none |
| §7.3a coordinates | `Δ`, `p=2`; weight 2 | `(−24,2^{10})`; `pχ(p)`, `χ(p)` | holds (previous report) | none |
| §7.4 abstract carrier | `Γ=1`; `Γ=J=G₀`; `C₂`, `S₃` | `M`; `M^{G₀}`; `2f(1)`; `1` vs `0` | holds (previous report) | none |
| §7.4 Gross model | `γ_p=2`, `g_p=3` | `3F≠F/3` | holds (previous report) | none |
| §7.7 slices | `f(g₁)h(g₂)`; two terms | rank 1; 2 | holds (previous report) | none |
| §0.1 level conjugation | `S₃`, `y=(012)`, `j=(01)` | `0`; `2` | holds (previous report) | none |
| §0.1a sign | `f(g)=g` on `ℝ` | `R(X)R(a)f=R(−L_Xa)f` | holds (previous report) | none |
| §0.3 volume threshold | `SL₂(ℝ)`, `ℝ_{>0}` | `r>2`; `2/r` | holds (previous report) | none |
| §0.4 exponent pieces | `G_m²` | `H₀≤H′≤5H₀²` | holds (previous report) | none |
| §2.2 trace-form Casimir | `gl₂`, `μ=(1,1)` | `2`; `2`; `−2` | holds (previous report) | none |
| §2.2 `SL₂` trivial infinitesimal character | `I(ε,ν)`, `ν²=1` | four classes | holds (previous report) | none |
| §2.6 compact-Cartan relations | `[X_c,Y_c]`, `[H_c,X_c]`, `Ωv_k` | `H_c`; `2X_c`; `(k²−2k)/4` | holds (previous report) | none |
| §2.7 `L²(ℝ)` translation | `1_{[0,1]}` | `2t` | holds (previous report) | none |
| §4.4 generation | `ℚ_p`, `c=0` | fills `N(ℚ_p)` | holds (previous report) | none |
| §4.5 Bessel | `ν=1/2`, `u=1` | `0`; `1/2` | holds (previous report) | none |

**Checks in the changed section.** §4.3 now has two Checks for its Fourier block (R02) and five for the Whittaker/genericity block, which is unchanged. Check counts for the other sections are as in the previous report.

**Remarks on untouched text.** These are for information; no change is requested in this round.
- The overlap tool reports that LieHighestWeight Layers 1 and 2, cited at README lines 49, 466, 520, 736 and 936, do not exist at the head (beea1d2) of the open pull request #1220 that revises LieHighestWeight. That head's layers are 0, 3 and 5–10, and root spaces and weights come from Mathlib (`LieAlgebra.rootSpace`, `finrank_rootSpace_eq_one`). Layer 4, cited at lines 49 and 936, is also absent there. These citations break if that revision merges first.
- Layer 5's Dependencies (line 936) does not list ArithmeticGaloisRepresentations either, although §5.8b uses its §§2.1–2.2. This is the same supplier as R03.
- ArithmeticGaloisRepresentations at its head (cf6ae2f), README lines 2300–2306, still proves `F⊥=F` and names this roadmap's §4.3 as its consumer. AnalyticNumberTheoryPartII (line 3165) claims to be the single owner and lists ArithmeticGaloisRepresentations §2.7 as its consumer. The conflict is between those two roadmaps. This roadmap now cites the earlier one in the merge order (line 50 against 56), which is the right choice, and ArithmeticGaloisRepresentations' consumer sentence is that roadmap's to update.
- Pull-request description (data): its merge-order block does not contain #856 (ArithmeticGaloisRepresentations), which §5.8b uses, although its dependency paragraph names #856. It still says "as do QuaternionicModularForms" and still has the #1220 sentence. These are for the human approving the pull request.

## Not verifiable

- Nothing in the changed lines. The deleted Kudla citation, which r8 listed here, is gone. The untouched citations with no legal open copy are as in the previous report: Borel–Jacquet, Flath and Langlands (Corvallis I); Knapp, *Lie Groups Beyond an Introduction*; Vogan 1984; Lapid; Kostant 1961.
- Ownership against open pull requests was checked through the roadmap index (`roadmaps grep`, `roadmaps show`) and the sibling checkout of #1220.

## Source issues

- none (no source was opened for the changed lines, which carry only cross-roadmap citations; the Getz and Pilloni misprints recorded in earlier reports are unchanged and not repeated).
