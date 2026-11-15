# Review of HilbertModularForms (pull request #1724 at 73285f0)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 73285f0. The folder did not change; the gate now fails on two rules at this head (R01, R02), the previous report's R01 is not repaired (R03), and the pull request's description, read against the head for the first time, is wrong in three places (R04–R06).

## R01 (P2) — Layer 10 takes its quaternionic carriers from a roadmap that may not be cited as a supplier

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:159`, `:2313`, `:2338` (gate rule `dropped`), and the same supplier under its spaced name at `:189`, `:215`, `:2279`–`2281`, `:2307`: "From [Quaternionic modular forms](../QuaternionicModularForms/README.md): the spaces of forms on a totally definite quaternion algebra".

**Claim:** QuaternionicModularForms is on the project's list of names a roadmap never cites as a supplier. §§10.2–10.3 rest on its §§0.1, 0.3, 1.3, 2.1, 3.1, so the Eichler order, the class set, the weight convention, the form spaces and the Hecke action of the Jacquet–Langlands dictionary have no admissible owner.

**Witness:** Gate at 73285f0: `dropped=3` (lines 159, 2313, 2338). The same objects are owned by two suppliers this README already cites, both earlier in the merge order: GL2AutomorphicRepresentationsAndTransfer R17.3.8a–R17.3.8d and HilbertModularVarietiesAndShimuraCurves §§R18.5.16a, R18.5.16c, R18.3.1.

**Repair:** Replace every citation, section by section:

- §0.1 (Eichler order of level `𝔫𝔇⁻¹`) → HilbertModularVarietiesAndShimuraCurves §R18.5.16a.
- §0.3 (class set and stabilizers) → GL2AutomorphicRepresentationsAndTransfer R17.3.8b (`Cl(U)=D^×\D_f^×/U`, finite) and HilbertModularVarietiesAndShimuraCurves §R18.3.1 (stabilizers).
- §1.3 (algebraic weight and dual convention) → R17.3.8a (`L_{n,s}`, determinant normalization).
- §2.1 (form spaces) → R17.3.8c (`M_{n,s}(U;K)`).
- §3.1 (Hecke action) → R17.3.8d (`T_v=[Uη_vU]`, `S_v`, `U_{ϖ_v}`).
- Line 159–162: rewrite the bullet as two bullets under those two suppliers; line 189–190: name the same sections; line 215: delete "Quaternionic modular forms Layers 4–5," (Ordinary automorphic forms and modularity lifting stays); lines 2307 and 2338: list the sections above.
- §10.3: define `B(𝔭)` as the matrix, by `LinearMap.toMatrix`, of R17.3.8d's `T_v` with `U=𝒪̂_B^×` on the indicator basis of R17.3.8b's class set, and add one sentence: HilbertModularVarietiesAndShimuraCurves §R18.5.16c's neighbour matrix `B(v)` is `[Uη_v⁻¹U]=S_v⁻¹T_v` (its item 2), so it differs from `B(𝔭)` by the permutation `s_v` and agrees with it when `𝔭` acts trivially on the class set.

Tested on the three §10.3 Checks: both matrices have row sums `N𝔭+1`; at norm 4 the subtraction is `5·(1−1)=0` and at norm 13 it is `36−14·(1+1)=8` under either convention, because the characters there are quadratic; the trace identity as stated uses `T_𝔭`, which the R17.3.8d definition keeps.

## R02 (P3) — `coeff` extracts its class and generator with `choose`

**Location:** `TauCetiRoadmap/HilbertModularForms/Suggested.lean:391`–`392`: "fourierCoeff F (f h.choose : UpperHalfSpace F → ℂ) h.choose_spec.choose * ∏ w, ((realEmbedding F w h.choose_spec.choose : ℝ) : ℂ) ^ (k.m w)".

**Claim:** The body of a `def` chooses its datum (gate rule `statement-hygiene`): the value is stated through an arbitrary witness instead of through the property that determines it.

**Witness:** Gate at 73285f0: `statement-hygiene=3`, lines 391, 391, 392, def `coeff`, `h.choose` and `h.choose_spec.choose`.

**Repair:** Delete `open Classical in` and replace the body by the sum over the set of values, which is a singleton by §2.4:

```lean
def coeff {𝔫 : Ideal (𝓞 F)} {k : Weight F} {R : NarrowRepresentatives F}
    (f : HilbertModularForms F 𝔫 k R) : IdealArithmeticFunction F := fun 𝔪 =>
  ∑ᶠ v ∈ {v : ℂ | ∃ (c : NarrowClassGroup F) (μ : F), IsTotallyPositive μ ∧
      FractionalIdeal.spanSingleton (𝓞 F)⁰ μ =
        ((𝔪 : Ideal (𝓞 F)) : FractionalIdeal (𝓞 F)⁰ F) * (R.rep c : FractionalIdeal (𝓞 F)⁰ F) *
          ((differentIdeal ℤ (𝓞 F) : Ideal (𝓞 F)) : FractionalIdeal (𝓞 F)⁰ F)⁻¹ ∧
      v = fourierCoeff F (f c : UpperHalfSpace F → ℂ) μ *
        ∏ w, ((realEmbedding F w μ : ℝ) : ℂ) ^ (k.m w)}, v
```

and say in the docstring that `c(𝔪, f)` is the single element of this set. Tested: a scratch copy of `Suggested.lean` with this body elaborates with the eleven `sorry` warnings only, no headline changes, and `coeff F f 𝔪 = v₀` follows from `finsum_mem_singleton` whenever the set is `{v₀}`; the text contains no `choose` and no `Classical`. The README's name `coeff` and its statements are unchanged.

## R03 (P3) — Name the primary source of the continuation that §4.2 cites through Dasgupta–Kakde

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:1183`–`1185`: "the latter writes Hecke's trick as congruence-restricted lattice sums at an arbitrary cusp and continues them before specializing s=0"; the Shimura 1978 entry at `:2667`–`2671` cites §2 and §4 only.

**Claim:** Dasgupta–Kakde take the continuation of these sums and their constant terms at `s=0` from Shimura 1978, §3; the README attributes both to Dasgupta–Kakde and gives no locator into the text that proves them.

**Witness:** dasgupta-kakde line 721 (the definition is recalled from its reference [10], Prop. 3.4), lines 759–760 (continuation asserted, not proved), line 798 (constant term from [10], equation (3.7)), line 1280 (entry [10] is Shimura 1978).

**Repair:** After the Dasgupta–Kakde locator in §4.2 add "the continuation of these sums and their constant terms are Shimura 1978, §3, Proposition 3.4 and equation (3.7)", and extend the Shimura 1978 reference entry to "§2 …; §3 (Proposition 3.4, equation (3.7): continuation and constant terms of the Hecke-trick sums); §4 …". With the clause, each fact of the sentence names the text that proves it.

## R04 (P3) — The description's count of milestones is that of an earlier head

**Location:** pull request description: "`TauCetiRoadmap/HilbertModularForms/README.md`: the roadmap, 12 layers and 55 milestones."

**Claim:** The head has 56 numbered milestones in its 12 layers.

**Witness:** `grep -c -E '^### [0-9]+\.[0-9]+' README.md` gives 56 at 73285f0 and 55 at 51d3991, the first commit; the added heading is `README.md:836`, "### 2.7 Finite nebentypus and the nonparallel extension".

**Repair:** "the roadmap, 12 layers and 56 milestones."

## R05 (P3) — The summary names the library as the owner of the parallel-weight theory

**Location:** pull request description, summary block: "The construction reuses Tau Ceti’s parallel-weight theory and Mathlib’s upper half-plane action, product-torus Fourier analysis and number-field arithmetic."

**Claim:** The parallel-weight theory is not in the pinned Tau Ceti; the README consumes it from another roadmap, which is a supplier a reader of the description must know of.

**Witness:** `README.md:108`–`114`: "From NoncommutativeAndEquivariantIwasawa §F.5: hilbertForms, hilbertCuspForms and hilbertQExpansion"; the "From Tau Ceti" contract (`README.md:294`–`319`) lists no Hilbert form, and `hilbertForms` occurs nowhere in the pinned Tau Ceti sources.

**Repair:** "The construction reuses the parallel-weight theory of NoncommutativeAndEquivariantIwasawa §F.5, Mathlib’s upper half-plane action and product-torus Fourier analysis, and the number-field arithmetic of Mathlib and Tau Ceti."

## R06 (P3) — The description gives the wrong exponent lattice

**Location:** pull request description: "the groups Γ₀(𝔫)_𝔟 on each narrow-class component, Fourier expansions over the inverse different and Koecher's principle".

**Claim:** The component `𝔟` expands over `𝔟𝔡⁻¹`, which is the inverse different only for `𝔟 = 𝒪_F`.

**Witness:** `README.md:242`: "`f_𝔟` expands over the trace dual `(𝔟⁻¹)^∨ = 𝔟𝔡⁻¹`"; `Suggested.lean:294`, `dualLattice`. For `F=ℚ(√5)`, `𝔟=(2)`: `1/√5 ∈ 𝔡⁻¹` and `1/√5 ∉ 2𝔡⁻¹`.

**Repair:** "Fourier expansions of the component `𝔟` over the totally positive elements of `𝔟𝔡⁻¹` (the trace dual of the translation lattice `𝔟⁻¹`), and Koecher's principle".

## Previous findings

- R01 — not repaired: `README.md:1183`–`1185` still reads "the latter writes Hecke's trick as congruence-restricted lattice sums at an arbitrary cusp and continues them before specializing s=0"; the Shimura 1978 entry still cites §2 and §4 only. Written again as R03.

## Verified sound

| Statement | Instances tried | Values computed on each side; result | Change |
| --- | --- | --- | --- |
| `coeff` (§2.4), present body against the R02 body | `F=ℚ(√5)`, `𝔪=𝒪_F`, `rep=𝒪_F`; an ideal with no generator; a non-invariant `f` | `μ=(5+√5)/10`, conjugate `(5−√5)/10`, both positive, norm `1/5=N(𝔡⁻¹)`; generators `με^{2j}`; the value set is one point by §2.4, so both bodies give `a(μ)`. Empty set: `0` and `0`. Non-invariant `f`: outside `M_k`. | R02 |
| §10.3 trace subtraction, with the suppliers of R01 | Norm 4 and norm 13 Checks; row sums | `(4+1)(1+(−1))=0`, `0−0=0`. `(13+1)(1+1)=28`, `36−28=8=4+4`. Row sums `N𝔭+1` for `T_v` and for `S_v⁻¹T_v`. Quadratic characters do not separate the two conventions. | R01 |
| §10.2 existence of `B` | `n=2`, `𝔇=1`; `n=3`, `𝔇=1`; `n=3`, `𝔇=𝔭` | Ramified places `2+0=2` even, exists; `3+0=3` odd, none; `3+1=4` even, exists. As the Checks say. | None |
| §4.2 real-place integral `I(s)=−√π Γ(s+1/2)/((s+1)Γ(s))` | Midpoint rule in `x=tan θ`, 400000 nodes, `s=1` and `s=0.3` | `s=1`: `−0.7853982` against `−0.7853982=−π/4`. `s=0.3`: `−0.5306049` against `−0.5306049`. | None (R03 is a locator) |
| `hasSum_fourier` exponent set (R06) | `F=ℚ(√5)`, `𝔟=(2)` and `𝔟=𝒪_F` | `dualLattice F 𝔟 = dual(𝔟⁻¹) = 𝔟𝔡⁻¹`: `2𝔡⁻¹ ∌ 1/√5` for `𝔟=(2)`; equal to `𝔡⁻¹` for `𝔟=𝒪_F`. README and Lean agree; the description does not. | R06 |
| Description counts (R04) | Heads 51d3991 and 73285f0 | Layers 12 and 12; numbered sections 55 and 56; Lean declarations at head 49, of which 11 sorried theorems. | R04 |

The rows for every other statement stand as in the previous review, of `73285f0`.

- Gate at 73285f0, run again: FAIL, `statement-hygiene=3` (R02) and `dropped=3` (R01); every other text check 0, `outside-folder=0`, `stray-files=0`. No file outside the folder is changed.
- Dependency check against the merge order: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD or CYCLE line. HilbertModularForms is line 185; the replacement suppliers of R01 are lines 102 and 164.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with eleven `declaration uses sorry` warnings and nothing else. The scratch copy with the R02 body: the same eleven, no error.
- Cross-roadmap citations resolved at open heads: 9 sections (GL2AutomorphicRepresentationsAndTransfer R17.3.8a, R17.3.8b, R17.3.8c, R17.3.8d, R17.3.9; HilbertModularVarietiesAndShimuraCurves §§R18.5.16a, R18.5.16c, R18.3.1; NoncommutativeAndEquivariantIwasawa §F.5).
- Library declarations opened at the pin: `TauCeti/NumberTheory/ArithmeticDirichletSeries/Basic.lean:79` (`IdealArithmeticFunction := (Ideal (𝓞 K))⁰ → ℂ`, so `coeff` is evaluated at nonzero ideals only); Mathlib `finsum_mem_singleton`.
- Source locators checked against the text: 4 (dasgupta-kakde lines 721, 759–760, 798, 1280). No seeded target falls in a changed passage, there being none.
- Pull request text: title and the remaining sentences of the description agree with the head (12 layers, topic `math.NT`, weights of common parity, weight-two Eisenstein series by Hecke's trick, newform weights at least 2, HilbertModularSurfaces as consumer at `README.md:2601`).
- Overlap check: read BianchiModularForms, HilbertModularSurfaces, SiegelModularForms, MaassForms, HalfIntegralWeightModularForms, ModularForms, LFunctions, GlobalNumberFields; the domain, the groups `Γ₀(𝔫)_𝔟`, their cusps and form spaces are shared with HilbertModularSurfaces and owned here (it cites §§0.1, 0.3–0.4 and Layer 1); nothing else shared.
- Remark: on main GlobalNumberFields is now under `Completed/`, so the four links `../GlobalNumberFields/README.md` (`README.md:48`, `:121`, `:932`, `:1504`) resolve on the branch and not after a merge of main.

Source independence: 0 passages compared with 0 sources (changed passages only: the folder did not change since 73285f0); the arrangement was not compared again, no layer being added, removed or reordered.

## Not verifiable

- Shimura 1978, §3, Proposition 3.4 and equation (3.7): behind the publisher's paywall; R03 cites it by locator alone, on the evidence of dasgupta-kakde lines 721 and 798.
- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts" (description): a statement about other pull requests, which the head of this one neither supports nor contradicts.
- The previous reports' list of texts that could not be read (Freitag, Miyake, Doi–Naganuma, van der Geer, Garrett, Diamond–Shurman, Atkin–Li, Shimura 1971, Iwaniec–Kowalski, four LMFDB knowls) is unchanged.

## Source issues

- none

## For the human reviewers

- **Scope.** QuaternionicModularForms is on the dropped-names list, yet the merge-order candidate (line 61) and the description's generated `depends-on` block (#934) still list it as a supplier of this roadmap; R01 removes the README's citations only.
