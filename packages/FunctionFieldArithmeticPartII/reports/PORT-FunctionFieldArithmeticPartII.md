# PORT-FunctionFieldArithmeticPartII

## Branch and head

- Branch: `roadmap/function-field-arithmetic-part-ii`, one commit on main `3b51055`.
- Head: `4862b43` — "FunctionFieldArithmeticPartII: roadmap (README, Suggested.lean, metadata)".
- Files: `TauCetiRoadmap/FunctionFieldArithmeticPartII/{README.md,Suggested.lean,metadata.toml}`. Nothing else is touched.
- **For the worker:** a local branch of the same name already existed. It pointed at an earlier, unsubmitted port commit `9ed6991` on the older main `a5f988c`, and that commit is still on the fork remote as `fork/roadmap/function-field-arithmetic-part-ii`. I reset the local branch to `3b51055` with `git checkout -B` and built the port on top of it. **Pushing therefore needs a force-push.** That earlier commit's README was my starting text, after the audit described under "Basis" below.

## Build

`lake build TauCetiRoadmap.FunctionFieldArithmeticPartII.Suggested`:

```text
⚠ [8954/8954] Replayed TauCetiRoadmap.FunctionFieldArithmeticPartII.Suggested
warning: TauCetiRoadmap/FunctionFieldArithmeticPartII/Suggested.lean:89:8: declaration uses `sorry`
warning: TauCetiRoadmap/FunctionFieldArithmeticPartII/Suggested.lean:97:8: declaration uses `sorry`
warning: TauCetiRoadmap/FunctionFieldArithmeticPartII/Suggested.lean:107:8: declaration uses `sorry`
Build completed successfully (8954 jobs).
```

There are 3 warnings, and all three are `declaration uses 'sorry'`.

The brief asks for the bare line `import Mathlib`, and I tried that first. At this toolchain a non-module file that imports Mathlib gets an extra warning: "imports `Mathlib` … designed for use with the module system; consider adding `module`". So the file keeps `module` / `public import Mathlib` / `@[expose] public section`, the same form as several Suggested.lean files on main (for example `TauCetiRoadmap/AffineMorseLefschetz/Suggested.lean`). The gate's import check passes with it (`imports=0`, `no-import-mathlib=0`).

## Gate

```text
gate FunctionFieldArithmeticPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

## Dependency direction

`gate --depcheck … --name FunctionFieldArithmeticPartII --order merge-order/ORDER.txt --movable --content …` after the last edit:

```text
depcheck: 226 roadmaps, 2132 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. FunctionFieldArithmeticPartII is line 363 of the merge order. Every supplier it names that is still a pull request comes earlier: AlgebraicModuliForArithmeticGeometry (32), InverseGaloisAndArithmeticFundamentalGroups (44), DeligneWeightsAndPurity (78), FunctionFieldArithmetic (337), GlobalShtukasAndFunctionFieldLanglands (338).

## Draft pull request body

This roadmap is the second part of FunctionFieldArithmetic. It starts from roots of line bundles with sections and ends with the geometric class field theory of a quadratically ramified double cover of curves over a finite field. Over an arbitrary commutative ring it builds the affine root chart A[t]/(tⁿ−f) with its universal μ_n-coaction. It proves that the action comparison is injective exactly when n=1 or f is a nonzerodivisor, that it is surjective exactly when n=1 or f is a unit, and that the coinvariants are exactly A, in every characteristic, including wild exponents. From these it builds relative finite-root geometry over algebraic-stack bases and the coherent infinite root stack with its fpqc quotient by D(ℚ/ℤ), together with fpqc Kummer towers and the infinite zero-section gerbe over a DVR. It then constructs Yun–Zhang's root Picard stack in every integer degree and its signed adelic presentation, root symmetric powers with Abel–Jacobi maps, symmetric lisse lines whose cohomology is an exterior power, effective Abel–Jacobi descent in high degree, and a normalized character sheaf in every degree. The end theorem (§10.20) identifies the Frobenius trace of the quadratic character sheaf with the quadratic idele class character η_(F′/F). Ordinary stacks, finite root stacks and Picard stacks come from SchemeAndStackFoundations. Constructible derived categories and perverse sheaves on stacks come from GlobalShtukasAndFunctionFieldLanglands §1.4, and DM-stack étale coefficients from DeligneWeightsAndPurity §8.24. Adeles, Artin maps and ray geometry come from FunctionFieldArithmetic. `Suggested.lean` states the three affine headline theorems that can be stated at the pins. Its docstring lists the stack-level headlines (root stacks, root Picard stacks, ℓ-adic sheaves on stacks, the trace comparison) that cannot, and names the carrier each one lacks.

## Dependencies that are still pull requests

FunctionFieldArithmetic, GlobalShtukasAndFunctionFieldLanglands, DeligneWeightsAndPurity, InverseGaloisAndArithmeticFundamentalGroups, AlgebraicModuliForArithmeticGeometry. PadicDifferentialEquationsAndRigidCohomology (§RD.6.62) is cited only in Scope, as the owner of unramified geometric class field theory. It is not a supplier.

## Basis: audit of the earlier unsubmitted port text

The cited supplier roadmaps on main, the Mathlib pin and the Tau Ceti pin are byte-identical between `a5f988c` and `3b51055` (`git diff` is empty on `lake-manifest.json` and on every cited roadmap folder). That let me start from the earlier commit's README. I compared it with the package README using a script that ignores whitespace, case, and Greek-letter or arrow transliteration. That left 333 changed hunks, and I read their categories and samples:

- process words, such as "obligation" → "target", "proved in separate nodes" → named sections;
- `hat`/`ℤ/4Z`/`phi:B to C` notation;
- lower-cased section titles in cross-references;
- the GlobalShtukasAndFunctionFieldLanglands §1.4 ownership change below.

I found nothing wrong in these.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already met the acceptance-test form. It has three headline theorems, each with an affine statement and `sorry`:

- `rootChartComparison_injective_iff` (README §1.190);
- `rootChartComparison_surjective_iff` (§1.191);
- `rootChartCoaction_eq_includeRight_iff` (§2.3).

It also has the three definitions those theorems need, each with a real body: `rootChart`, `rootChartCoaction`, `rootChartComparison`. It has no sorry'd data and no padding.

Lean changes:

- Docstrings cite the README sections (from the earlier commit; I checked them).
- The not-statable item "infinite affine coinvariants" now names the missing carriers exactly: the factorial root colimit `C_A(f)` and its `A[ℚ/ℤ]`-coaction `η_f`, constructed in §§3.58, 3.148 and 3.324.
- The rational DM perverse item now says that the missing carrier is a constructible derived category of stacks.

**Headlines checked for statability.** I checked each headline in the docstring list against the pins: grep of the Tau Ceti pin `358314d` for stack carriers (none: `AlgebraicGeometry/` has `PicardFunctor` and `LineBundle` but no algebraic stacks), and Mathlib (no algebraic stacks and no ℓ-adic sheaves). Every listed headline needs one of these.

I considered whether the infinite coinvariant theorem (§3.385) could be stated through a ℚ≥0-graded monoid-algebra model of `C_A(f)`. I did not do it. That model is a different carrier from the README's factorial colimit, and the coaction on the colimit needs the colimit's universal property and compatibility proofs inside the data. The docstring says so.

**Signature check.** I put `#check @name` for all 6 declarations in one scratch file and elaborated it with `lake env lean`. Each type matches its README statement:

- §1.190: `0 < n →` (injective ↔ `n = 1 ∨` injectivity of `a ↦ f * a`);
- §1.191: `0 < n →` (surjective ↔ `n = 1 ∨ IsUnit f`);
- §2.3: `0 < n →` (`δ b = includeRight b` ↔ `b ∈ range (algebraMap A _)`).

No section binder is dropped, because every binder is explicit in each signature. Nothing changed as a result.

## Supplier replacements and duplication removals

- **GlobalShtukasAndFunctionFieldLanglands §1.4** owns the constructible derived categories D_c(𝒳,Λ) of finite-type algebraic stacks over a finite field, with six operations, the perverse t-structure glued from a smooth atlas, intermediate extensions, and the identification with the DeligneWeightsAndPurity §8.24 étale theory on DM stacks. I verified this at the head `2379b34` of that pull request, in section "1.4 ℓ-adic sheaves on stacks of finite type". The package's §7.7 had constructed rational DM perverse descent itself. It is now narrowed to what is new here: perverse t-exactness of proper quasi-finite pushforward between tame DM stacks, and the comparison Rf_*(j′_!*P)≅j_!*(Rf_𝒰*P). A "From TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands" contract is added. The deferral is recorded in Scope. This came from the earlier commit; I re-verified it. I also aligned the DeligneWeightsAndPurity contract sentence with it.
- **Duplication sweep by object.** `roadmaps grep` ran over main and all 441 open heads, and I also read sibling checkouts directly. Objects searched: infinite root stack, root stack, root Picard, parabolic line bundle, geometric class field theory, character sheaf, Abel–Jacobi, Serre–Lang, Lang isogeny, Kummer torsor/sheaf, zero-section gerbe, D(ℚ/ℤ), μ_∞, symmetric power of a local system, Laumon, automorphic sheaf, eigensheaf, Yun–Zhang, Taylor expansion. I also read CurvesOverFiniteFields, CountingBundlesAndHallAlgebrasOfCurves and DrinfeldModulesAndTModulesPartII at their heads.
  - Finite root stacks, Picard stacks, Abel maps and line-bundle norms are already imported from SchemeAndStackFoundations §§1.21 and 3.3–3.7.
  - Unramified geometric class field theory is PadicDifferentialEquationsAndRigidCohomology §RD.6.62 (noted in Scope; different object).
  - FunctionFieldArithmetic §§4.6–4.10 (ray Picard schemes, Lang ray covers) uses a different route on generalized Jacobians and does not construct the root Picard stack or its character sheaf.
  - No new duplicate was found, and nothing else was removed.
- **Supplier names.** I extracted all 429 backticked names. 402 library names are covered by a scratch `#check` file elaborated at the same pins, with no errors apart from this roadmap's own names, which that file did not import. The 6 own declarations are covered by the signature check. The other 21 I checked one by one:
  - other roadmaps' names, checked in those roadmaps: `rootStack`, `affine_transition_limits` (SchemeAndStackFoundations); `rootGerbe`, `neutralizationEquivalence`, `GerbeLimitFamily`, `limitStackDescent`, `nonemptyAffineLimitGerbe` (AlgebraicModuliForArithmeticGeometry head);
  - Tau Ceti and Mathlib names, found by grepping the pins with file and line:
    - `TauCeti/Algebra/AlgebraicGroup/RootsOfUnity/Basic.lean`: `RootsOfUnityGroup.generator` (61), `pointsMulEquiv` (124), `pointsMulEquiv_symm_apply_single_generator` (151);
    - `…/RootsOfUnity/Scheme.lean`: `groupScheme` (82), `schemePointsMulEquiv` (101), `schemePointsMulEquiv_mapValue` (194);
    - `TauCeti/AlgebraicGeometry/LineBundle/Pullback.lean:72` (`InvertibleSheaf.pullback`); `…/LineBundle/Functoriality.lean` 49 and 69 (`pullbackId`, `pullbackComp`);
    - `TauCeti/CategoryTheory/Sites/Units.lean` (`CategoryTheory.Sheaf.additiveUnitsFunctor`, `additiveUnitsFunctor_obj_obj` at 58);
    - `TauCeti/AlgebraicGeometry/WeilDivisor/FixedDegree/Addition.lean` 41 and 112 (`EffectiveDivisorOfDegree.add`, `equivSym_add`);
    - `Mathlib/RingTheory/RootsOfUnity/Basic.lean:144` (`restrictRootsOfUnity`).

  All resolve. The line locators are correct at the pin:
  - `Mathlib/RingTheory/Jacobson/Ring.lean:676` (`finite_of_finite_type_of_isJacobsonRing`);
  - `Mathlib/Order/DirectedInverseSystem.lean:130` (`DirectLimit.exists_eq_mk`);
  - `AdjoinRoot.finitePresentation`, an instance in `Mathlib/RingTheory/AdjoinRoot.lean` line 158.
- **Cross-roadmap citations, re-resolved against main `3b51055` and the current heads.**
  - SchemeAndStackFoundations: all of §§0.1, 0.9, 1.1, 1.15, 1.16, 1.18–1.23, 2.3, 2.10, 2.11, 3.2–3.7 and 4.13 exist. `rootStack` (§1.21), `affine_transition_limits` (§0.9) and `NonabelianH1` `map` (§2.3) are present.
  - EtaleCohomologyFoundations: §§0.11, F.0.1, F.0.2, F.0.4, F.0.A1, F.0.A2, F.1, F.2.1, F.2.6, F.2.7, F.3a, F.4.0–F.4.6, F.5, F.6 and F.8 all exist.
  - Also present on main: AlgebraicVectorBundles L0A–L0C; ModularCurves §0F; AlgebraicCurves Layers 5 and 12 (12A); JacobianChallenge Layers A–D; ProfiniteCohomology Layer 10; RepresentationTheory/SchurWeyl Layer 8.
  - At the heads: InverseGaloisAndArithmeticFundamentalGroups — the target "Finite-cover criteria for full monodromy image" sits inside §IG.5.7. DeligneWeightsAndPurity — the stack clause of §8.24 is present. AlgebraicModuliForArithmeticGeometry — §4.3, §4.4 and §4.23, with `neutralizationEquivalence`, `rootGerbe`, `GerbeLimitFamily`, `limitStackDescent` and `nonemptyAffineLimitGerbe`. FunctionFieldArithmetic — §§0.1, 2.1, 4.1, 4.2 and 4.5–4.10.
- **Ownership against open pull requests** was checked: by object with `roadmaps grep` over all open heads, and by reading the sibling checkouts named in the brief. Nothing was moved down from a later roadmap.

## Fixes made in the reviewer read (this run)

1. **Summary.** "Its end theorem identifies the quadratic Frobenius trace with the idele character" did not say which trace and which character. It now states §10.20: for a geometrically connected double cover of smooth projective curves over a finite field of odd characteristic with reduced branch divisor R, the Frobenius trace of the quadratic character sheaf on the root Picard stack equals η_(F′/F) under the signed adelic presentation, with +1 at split and −1 at inert points.
2. **Missing Checks.** Three definition sections carried their witnesses only as prose: §4.7 (root degree components), §6.12 (valuation divisor and degree sign) and §10.14 (quadratic reciprocity on the root quotient). Each now has a `**Checks.**` list of 3–4 computed, discriminating tests:
   - the pointless real conic, whose degree-1 component has a ℂ-object but no ℝ-object;
   - degree invariance under 𝔽_q→𝔽_(q²);
   - the idele π_x⁻¹ at a degree-2 point giving degree 2, not −2 and not 1;
   - for s²=t over 𝔽₃: x=1 split (+1), x=−1 inert (−1), the degree-2 point t²−t−1 inert and t²+1 split (norm to 𝔽₃ equal to −1 versus 1, and squares of 𝔽₉× are the norm-one elements), and the residue Legendre symbol at the branch point.
3. **Source labels.** Locator labels carried tool and job-hash suffixes. They are renamed to readable source ids, with the same URLs and line numbers, in the text and in References: `NormalizationThree-codex-…` → STACKS-01JO, `FramedRoot-codex-…` → ALPER-MODULI, `FramedFppfCover-codex-…` → STACKS-021M, `Stacks-finite-root-projections-codex-…` → STACKS-01YW, `AffineRootPointGroupoid-…` → STACKS-022Y. The source file is the same in each case, so `<id> line N` locators keep their meaning.
4. **Glued locators.** 116 tokens fixed, for example "Definitions39.10.1", "draft5January2026", "tag01JO", "Tag040N".
5. **Process wording.** "The exact-pin proof …", "no new generic tensor construction is planned", "is replanned" now read as mathematics.
6. **DeligneWeightsAndPurity contract.** It said §7.7 does "perverse descent", which contradicted the GlobalShtukas ownership. It now names exactly what §7.7 proves and points the perverse t-structure to GlobalShtukasAndFunctionFieldLanglands §1.4.

The accepted review's non-blocking notes F01–F07 are all resolved in the text:

- No `*Needs:*` line names a section of a later layer of this roadmap; I checked every `*Needs:*` item mechanically.
- Camel-case Needs items are backticked.
- The ASCII and slug residue is gone.
- No truncated boilerplate remains.
- §3.86 is a theorem, not a definition.
- The DM perverse section (§7.7) is stated over a finite field k, as the supplier is.

## Adversarial mathematics pass (computed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `rootChartComparison_injective_iff` (§1.190) | monic bases s^i t^j → h^i t^(i+j); n=1; n=2 over ℤ f=2; ℤ/4 f=2; field f=0; zero ring; n=0 | map is a permutation of bases times entries 1 or f, with at least one f iff n≥2 (position (n−1,n−1)); ℤ,f=2: injective; ℤ/4,f=2: 2(x⊗x)≠0 ↦ 4(e₁⊗1)=0; field f=0: kernel dim 1; zero ring: bijective; n=0, A=ℤ, f=2: both rings 0, bijective, but "0=1 ∨ 2 injective" — hypothesis `0<n` needed | true | none; n=0 negative control already in Layer 1 Examples |
| `rootChartComparison_surjective_iff` (§1.191) | ℤ f=2 n=2; 𝔽₂ f=1 n=2; ℤ/8 f=4 | ℤ: cokernel ℤ/2, e₁⊗1 ∉ image; 𝔽₂: bijective with n not invertible; ℤ/8: cokernel A/(4) with z: 2z≠0, 4z=0 | true | none |
| `rootChartCoaction_eq_includeRight_iff` (§2.3) | b=Σc_i t^i; 𝔽₂ f=0 n=2; ℤ/4 f=0 b=2t; char p, n=p, f=0 | δ(b)=Σc_i h^i⊗t^i against Σc_i 1⊗t^i: distinct basis pairs for 0<i<n, so c_i=0; 𝔽₂: t not coinvariant; ℤ/4: 2t not coinvariant; field points fix t but δ(t)=h⊗t≠1⊗t | true | none |
| `rootChartCoaction` well-defined | (h⊗t)ⁿ=hⁿ⊗tⁿ=1⊗f | equals algebraMap f | ok | none |
| Θ determinant at n=2 (Layer 1 Examples) | bases {1,t}² | σ swaps (1,0),(1,1) with factor f: det = −f | true | none |
| Θ(t⊗t)=f•(e₁⊗1) (§1.26) | n=2 | (e₁⊗t)(1⊗t)=e₁⊗f | true | none |
| Lower-coordinate count | n=0,1,2,3 | n(n−1)/2 = 0,0,1,3 | true | none |
| Factorial indices | i=0,1,2 | d=1,2,6; u_2⁶=f | true | none |
| Uniform bound B=ρ+max(2g−1,1) | g=0,ρ=1,d=2; g=1; g≥1 | B=2, n=3, a=2, weights (2,2,1); a ≥ max(g,2−g) ≥ 1 | true | none |
| Norm sign | c+dt on t²=a | matrix ((c,ad),(d,c)), det c²−ad²; a=0: c² | true | none |
| Idele sign | π_x⁻¹, deg x=2 | E=−x, O(x), degree 2 | true | new Check in §6.12 |
| Supplier sign comparison | 2 ∈ 𝔽₅× | b=a⁻¹=3, inverse rigidification 2 | true | none |
| Kummer class | n=3, a=2 over ℚ; λ→3λ | [1/2] against [2], ratio 4 not a cube; [3/2]=[3][1/2] | true | none |
| Real infinite gerbe | μ_n(ℝ) | ζ_n=ζ_(2n)²=1; two classes, trivial and ([−1]_n) | true | none |
| Section-quotient witness | 𝔽₅, γ=α=1, u=2 | (γ′,α′)=(4,2), γ′⁻¹α′²=4·4=1 | true | none |
| Root units on s²=t over 𝔽₅ | c=v₀²=v∞² | 2·2·2=8 units; norms (w²,w,w): 4; (1,1,−1) not a norm; quotient of order 2 | true | none |
| Factorial restriction | 6!→5 | 720/5=144=6·24 | true | none |
| Layer 4 inertia | one split branch point | {(c,u):u²=c}≅𝔾_m, relative μ₂; α=1 forces u=c=1 | true | none |
| §4.7 degree components | ℙ¹ with O(−1); pointless real conic; 𝔽_q→𝔽_(q²) | component −1, not −1/2; degree-1 component has no ℝ-object (real degrees even); degree preserved | true | 4 Checks added |
| Layer 5 incidence | ℙ¹, R={0,∞}, d=1,2 | points disjoint; lines in ℙ² meet at 0+∞; μ₂²→μ₂ with diagonal kernel | true | none |
| Layer 6 residue square | 𝔽₅ | squares {1,4}; 2 excluded | true | none |
| §7.27 exterior cohomology | nontrivial L, dim H¹=2, d=0..3 | 1,2,1,0 in degrees 0..3; d=0 gives ℚ̄_ℓ | true | none |
| Layer 7 signed invariants | d=2, dim 2; 𝔽₂ | Λ²: dim 1, Sym²: dim 3; e₁⊗e₁ signed-invariant and not in the antisymmetrizer image | true | none |
| §7.7 t↦t² Check | 𝔸¹→𝔸¹, odd char | stalks 2 on 𝔾_m, 1 at 0; sign summand 0, constant 1 | true | none |
| §8.7 simple connectivity | ρ=0 | P(2^a) has a μ₂ gerbe, so not simply connected; hypothesis ρ≥1 needed and present | true | none |
| §10.14 quadratic reciprocity | s²=t over 𝔽₃ at x=±1, t²−t−1, t²+1, branch residues ±1 | +1, −1, −1 (norm −1), +1 (norm 1), Legendre −1/+1 | true | 3 Checks added |
| Layer 10 Examples | O(1) under t↦t² | pullback degrees 2ℤ, 1 ∉ 2ℤ | true | none |
| Infinite DVR gerbe (§3.421) | char p, k[ℚ/ℤ] | (e_[1/p]−1)^p=e_[1]−1=0; Hom(μ_(p^r),G)=0 by divisibility of ℚ/ℤ | true | none |
| Layer 3 fpqc not fppf | X^(n!)−2 over ℚ | Eisenstein: degrees unbounded; residue (T²−2) has degree 2, so no cube root | true | none |
| Finite presentation at n=0 | D=B[T]/(1−u), u=1 | B[T] | true | none |
| Worked example, ℤ/4 coefficient 3 | squares in ℤ/4 | 1²=3²=1, so 3 is not a square | true | none |

Context check: the three Lean theorems carry every binder in their own signatures (`A`, `[CommRing A]`, `f`, `n`, `hn : 0 < n`, and `b` for §2.3). There is no section `variable` block.

## Unresolved

- The README is very fine-grained: 817 numbered subsections, Layer 1 alone has 219. Many targets are single-lemma steps written in Lean-API vocabulary, for example "`pullbackSymmetry_hom_comp_snd`" in a `*Needs:*` line. The port keeps the full detail, as the brief requires. A reviewer may ask for Layers 1 and 3 to be merged into larger mathematical targets; I did not restructure them.
- The supplier contracts still contain the eight "What X must provide (gap:…)" requests: three on SchemeAndStackFoundations, two on AlgebraicVectorBundles, and one each on AlgebraicCurves, FunctionFieldArithmetic and EtaleCohomologyFoundations. These are requests to the suppliers, accepted by the review, and none is met by the supplier text at main or at the heads checked. The same format is used on main in `TauCetiRoadmap/FlagVarieties/README.md`.
- The adversarial pass covered the Lean statements, the Conventions witnesses, every supplier-contract witness, every layer's Examples, all Worked examples, and the sections I re-read: §§1.7, 1.26, 1.190, 1.191, 2.1–2.3, 3.148, 3.324, 3.385, 3.421, 4.7, 6.12, 7.7, 7.27, 8.7, 10.14, 10.20 and 10.24. It did not cover each of the 817 subsections one by one.
- No untrusted text contained instructions. Nothing suspicious to report.


Pull request: #1831 (roadmap/function-field-arithmetic-part-ii at 4862b43)
