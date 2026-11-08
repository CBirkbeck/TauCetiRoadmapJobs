# GATE-AbelianVarietiesOverFiniteFields~3: answers to the human review

There is one unanswered comment (CBirkbeck, 2026-11-06T16:39:19Z). It reports the design edits of
`2293bfb` and is cut off in the quote after its second item. It makes four checkable points:

- the branch takes main's pin (H01);
- §2.1 puts `AbelianTate` on `A(K^sep)` (H02);
- §1.5 has a new supplied paragraph stating the Galois-equivariant Kummer isomorphism (H03);
- the gates pass (H04).

Each point was checked against the roadmap at `2293bfb` and at the repair commit `3ef7d747`. The
issue-level reference in the comment is not a roadmap pull request, so it was not consulted. No
text in the comment asks for anything outside this job.

## H01 (CBirkbeck) — answered

Confirmed. The branch's `lake-manifest.json` is byte-identical to the pin of the content repository's
main checkout. Main's head `eaf17b1` is an ancestor of the branch, and no main commit is missing from it
(`HEAD..origin/main` is empty).

## H02 (CBirkbeck) — answered

Confirmed, with no change needed. The Conventions row (`TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:180`) reads
`T_ℓ A := AbelianTate A ℓ = TateModule ℓ (A(K^{sep}))`, on `SeparableClosure K`-points. So do:

- the A4.1 supplier bullet (lines 297–302);
- the 1.2 comparison `A(K^{sep}) ≃+ A(K̄)` (with `PerfectField.ofFinite` and `separableClosure.eq_top_iff`);
- §2.1 (line 776).

The convention came in with `8dd2854` and is in the merge `e71184a`.

It matches the supplier at the head of its roadmap PR (`bb1d12a`). A4.1 there defines
`T_ℓ A = TateModule ℓ (A(K^{sep}))` over a field. Its `Suggested.lean` declares
`OverField.geometricPoints A := Additive (Over.mk (Spec.map (algebraMap K (SeparableClosure K))) ⟶ A.toOver)`
and `OverField.tateModule A ℓ := TateModule ℓ (geometricPoints A)`.

Every remaining `A(K̄)`, `A[n](K̄)` or `End(A_{K̄})` in the README is read through 1.2. This covers
5.x, 6.1, 7.2, 9.x and the provenance section. No Tate module is defined on algebraic-closure points.

## H03 (CBirkbeck) — applied differently

The paragraph's mathematics is right; each step is recomputed in the table below. Its supplier
citation did not resolve.

At the head of the DeligneWeightsAndPurity roadmap PR (`6045677`), DWP.1 §1.6 states only the
curve's point count and zeta function through its Jacobian, with input from the
InverseGaloisAndArithmeticFundamentalGroups §IG.0.T1 trace comparison. No section of DWP.1 states a
comparison with `μ_{ℓⁿ}` coefficients, and the word "Kummer" does not occur in DWP.1. No open head
or main roadmap states the Galois-equivariant curve form; a search over all 459 heads and main finds
only:

- EtaleDualityAndPerverseSheaves (a step inside `curveH1Duality`, over an algebraically closed `k`);
- AnabelianGeometryAndNonabelianChabauty (algebraically closed `k`, no Galois action);
- this roadmap.

On main, the owner of the ingredients is SchemeAndStackFoundations:

- §2.11 has `hilbert90` and `fppf_kummer_sequence`, which give `0 → Γ(X, 𝒪)^×/n → H¹(X, μ_n) → Pic(X)[n] → 0` for every scheme `X`, exact étale-locally for `n` invertible. Its line 3668 says "Both Kummer statements are owned here".
- §3.6 has `jacobian X := Pic⁰_{X/k}` with no rational point, `picardComponent_zero`, `jacobian_dim` and `picardSheafPoints`.

### What changed in the README

**Kummer paragraph** (`TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md:629`). Old: "which DWP.1 §1.6 owns and this milestone consumes". New: the isomorphism is read from SchemeAndStackFoundations §2.11 and §3.6, step by step. Galois-equivariance is proved by naturality under `1 × Spec σ`. Compatibility with `ζ ↦ ζ^ℓ ↔ [ℓ]` is proved by an explicit map of Kummer sequences. DWP.1 §1.7 is now cited for the untwisted rational form `H¹(C_{K̄}, ℚ_ℓ) ≅ (V_ℓ J)^∨`, with geometric Frobenius of characteristic polynomial `P_{π_J}`.

**Supplier contracts and scope:**
- the DWP.1 bullet (line 313) now states §§1.6–1.7 as they read at the head;
- the IG.0.T1 bullet (line 327) is updated to match;
- a new SchemeAndStackFoundations §§2.11, 3.6 bullet (line 383) is added;
- the Not-owned bullet (line 117) is rewritten;
- the *Needs:* lines and the Layer 1 Dependencies are updated.

If DWP.1 §1.6 later states the curve isomorphism, the citation can move there; it would still rest
on §2.11.

### The same pattern elsewhere: Jacobians of curves without a rational point

On main, JacobianChallenge is pointed. Its standing hypothesis is "A chosen `k`-rational point
`x₀`", and Layer E's `JacobianVariety` is the neutral component of the pointed curve. Only Layer D's
Picard scheme assumes no point (line 257). The README attributed the pointless Jacobian to
"JacobianChallenge Layers D–E" or "Layer E" in four places, now re-cited to SchemeAndStackFoundations
§3.6:

- 1.5 (line 618);
- the JacobianChallenge supplier bullet (line 359);
- 7.5 (line 1389);
- the provenance bullet for `Picard/Jacobian.lean` (line 2437).

The pointless case actually occurs: the README's own `2.2.ad_f` Jacobian curve
`y² + (x³ + x² + 1)y = x⁶ + x⁵ + 1` has no `𝔽₂`-point. For such curves the principal polarization
used by 7.4 and 10.2–10.3 is now stated in the JacobianChallenge bullet (line 365). It is built over a
finite Galois `L/K` where `C` has a point, and Layer E makes it independent of the translation. It
then descends along the effective epimorphism `(Jac C)_L → Jac C`, by Mathlib's subcanonical
`Scheme.fpqcTopology` (`Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:76,88,116`).

### A wrong library citation in 7.5

7.5 cited `Divisor.degreeOneEquivDegreeZeroClassGroup` for `A(K) ≅ Cl⁰(F)`. At the pin the
declaration is `TauCeti.Place.degreeOneEquivDegreeZeroClassGroup` and carries `hg : genus k F = 1`
(`TauCeti/FieldTheory/FunctionField/Elliptic/Basic.lean:167`). It is the genus-one bijection between
degree-one places and `Cl⁰(F)`.

It is replaced by:
- `Pic(C) ↪ Pic_{C/K}(K)` with cokernel inside `Br(K)` (§3.6);
- `Br(K) = 0` by Mathlib's `littleWedderburn`;
- JacobianChallenge Layer A's `Cl(X) ≅ Pic X`.

### Checks added

- 1.5 has a seventh Check: the `2.2.ad_f` curve has no rational point and its counts 0, 6 give `P_J`.
- 7.5 has two new Checks: `h_F = 1` with no degree-one place, and the negative control `y² + y = x⁵` over `𝔽₂`, where 3 degree-one places differ from `h_F = 5`.

## H04 (CBirkbeck) — answered

Confirmed at `2293bfb`, and still true after the repair at `3ef7d747`:

- the targeted build succeeds with exactly four `sorry` warnings (lines 38, 89, 115, 148);
- the gate line has `set_option=0`, `readme-ids-missing=0` and `depcheck=0`;
- the dependency check reports 0 problems.

The outputs are below.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `H¹(C_{K^sep}, μ_{ℓⁿ}) ≅ J[ℓⁿ](K^sep)`, `ℓ ≠ p`, `n ≥ 1` | `ℙ¹`; trace-2 `E/𝔽₅` with `ℓ = 3, n = 1`; `ℓ = p = 5` | `ℙ¹`: `Pic = ℤ` torsion-free, `(K^sep)ˣ/ℓⁿ = 0`, both sides 0. `E`: both `(ℤ/3)²`, rank `2g = 2`. `ℓ = p`: `J[5] ≅ ℤ/5`, étale `μ₅ = 1`, `H¹ = 0` | holds; `ℓ ≠ p` needed (existing sixth Check) | re-attributed to SchemeAndStackFoundations §§2.11, 3.6 |
| kernel `(K^sep)ˣ/ℓⁿ = 0` | `K = 𝔽₂, ℓ = 3`; `a ≠ 0` | `X³ − a` has derivative `3X² ≠ 0` at its roots, so it is separable with a root in `K^sep` | holds | none |
| `Pic(C_{K^sep}) = Pic_{C/K}(K^sep)` | `K^sep`; negative control: pointless conic over `ℝ` | cokernel in `Br(K^sep) = 0`; over `ℝ`, `Pic = 2ℤ` but `Pic_{X/ℝ}(ℝ) = ℤ`, cokernel `ℤ/2 = Br(ℝ)` | holds over separably closed and finite fields only | cited `picardSheafPoints` (§3.6) |
| Galois-equivariance | trace-2 `E/𝔽₅`, `ℓ = 3` | `tr(π ∣ J[3]) = 2`; twisted to `H¹(ℤ/3)`: `2 · 5⁻¹ = 2 · 2 = 4 ≡ 1`; on `Hom(J[3], ℤ/3)`: `tr π⁻¹ = 2/5 ≡ 1`; `1 ≠ 2` in `𝔽₃` | holds (fifth Check) | proof by naturality under `1 × Spec σ` written out |
| transitions `ζ ↦ ζ^ℓ ↔ [ℓ]` | `ℓ = 3`, `μ₉ → μ₃` | middle map `x ↦ x³` and right map identity make a map of sequences, since `(x³)³ = x⁹`; on `Pic` the induced map is `L ↦ L³`; wrong model: inclusion `μ₃ ⊂ μ₉` gives a direct system, not `TateModule`'s inverse system | holds | the map of sequences is now stated |
| geometric Frobenius on `H¹(ℚ_ℓ)` is `q π_J⁻¹` | `π = 1 + 2i`, `q = 5` | `5/(1 + 2i) = 1 − 2i`, trace 2, char. poly `T² − 2T + 5 = P_J`; count `1 − 2 + 5 = 4` | holds; agrees with DWP.1 §1.7 | §1.7 cited |
| DWP.1 §1.6 count without a rational point | `y² + (x³ + x² + 1)y = x⁶ + x⁵ + 1` over `𝔽₂` | `N₁ = 0`: at `x = 0`, `x = 1` and `u = 0` the equation is `y² + y + 1`, no root. `N₂ = 6`: at `x = ω`, `f/h² = ω` with trace 1; at `x = ω²`, `f/h² = ω²` with trace 1. So `a₁ = −3`, `S₂ = −1`, `a₂ = 5`, `S₃ = 3·(−1) − 5·3 + 3·6 = 0`, `N₃ = 9` | matches `2.2.ad_f` (`curve_counts 0, 6, 9`) | new 1.5 Check |
| 7.5 `A(K) ≅ Cl⁰(F)` with no rational point | the same curve | `#J(𝔽₂) = P(1) = 1 − 3 + 5 − 6 + 4 = 1 = L(1) = h_F`; `Br(𝔽₂) = 0` (a finite division algebra is a field) | holds | new 7.5 Check |
| removed genus-one bijection (negative control) | `y² + y = x⁵` over `𝔽₂`, genus 2 | `N₁ = 3` (`x = 0`: 2, `x = 1`: 0, ∞: 1); `N₂ = 5` (`x = 0, 1`: 2 each, `ω, ω²`: 0, ∞: 1); `a₁ = a₂ = 0`, `L = 1 + 4T⁴`, `h = 5 ≠ 3` | the Tau Ceti declaration needs genus 1 | citation removed; Check added |
| pointless principal polarization by descent | `2.2.ad_f` curve, `L = 𝔽₄` | `C(𝔽₄)` has 6 points; `Gal(𝔽₄/𝔽₂) = ℤ/2`; `φ_{t_a^*𝓛} = φ_𝓛` (independence of translation); an isomorphism after faithfully flat base change is an isomorphism | holds; agrees with the README's `has_principal_polarization = 1` for `2.2.ad_f` | clause added to the JacobianChallenge bullet |
| JacobianChallenge on main is pointed | its README at `eaf17b1` | line 44 standing hypothesis `x₀`; end goal `JacobianVariety X x₀`; Layer D Picard scheme without a point (line 257); Layer A `Cl(X) ≅ Pic X` | as stated | pointless Jacobian re-cited to §3.6 |
| SchemeAndStackFoundations §§2.9, 2.11, 3.6 on main | its README at `eaf17b1` | §2.11 `hilbert90`, `fppf_kummer_sequence`, étale exactness for `n` invertible, line 3668 ownership; §3.6 (line 4905 ff.) `jacobian`, `picardComponent_zero`, `jacobian_dim`, `picardSheafPoints`; `muEtale` exported with §2.9 | as stated | none |
| EtaleCohomologyFoundations §F.0.3 on main | `Λ(1) = Λ ⊗ μ_N`; its Check "arithmetic `q`-Frobenius acts on `μ_{ℓⁿ}` by `q`" | the fifth Check's `ζ ↦ ζ⁵` on `μ₃` agrees | consistent | none |
| DWP.1 §§1.6–1.7, IG.0.T1, FunctionFieldArithmetic §5.4 at their heads (`6045677`, `a5186ac`, `c5d655e`) | the text at each head | §1.6: `#C(𝔽_{q^m}) = 1 − Σ a_i^m + q^m`, `Z(C,t)`. §1.7: `H¹ ≅ (V_ℓJ)^∨`, char. poly `P_{π_J}`. IG.0.T1: finite-level `Hom(J[ℓⁿ], ℤ/ℓⁿ)` and curve trace. FFA §5.4: `L_F = P^rev_{π_J}` (DWP §1.6), `#J = h` | as now cited | DWP bullet rewritten |
| Mathlib citations | `littleWedderburn`; `Scheme.fpqcTopology` | `Mathlib/RingTheory/LittleWedderburn.lean:169`; `Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:76` (definition), `:88` (subcanonical), `:116` (qc surjective flat ⇒ `EffectiveEpi`) | exist at the pin | none |

## `Suggested.lean`

The file is unchanged. Mechanical signature check: a `#check @name` for each of the 15 declarations
was elaborated once through the targeted build:

- `waterhouse`, `IsOrder`, `IsFractionalIdeal`, `colon`, `multiplierRing`;
- `IsInvertible`, `WeakEquiv`, `weakEquiv_iff_one_mem`, `traceDual`, `IsGorenstein`;
- `isGorenstein_iff_forall_invertible`, `InvertibleIdeal`, `picSetoid`, `Pic`, `finite_pic`.

The file was then restored. Each elaborated type carries the binders the README states (8.2, 8.4, 8.6, Layer 4). In
particular, the three Layer 8 theorems carry `[Module.Finite ℚ E] [IsReduced E]` and the `IsOrder`
hypothesis explicitly. `colon`, `multiplierRing`, `IsInvertible` and `WeakEquiv` do not take
`[Algebra ℚ E]`, which they do not use. Nothing changed.

## Ownership, merge order and sources

- **Ownership against open pull requests** was checked with the open-heads index (459 heads and main).
- **Nothing moved between roadmaps.** No later roadmap is cited. SchemeAndStackFoundations and JacobianChallenge are on main; DWP, InverseGaloisAndArithmeticFundamentalGroups, AbelianSchemesAndArithmeticModuli and FunctionFieldArithmetic are earlier in the merge order.
- **Revision pull requests are not cited.** The EtaleCohomologyFoundations and JacobianChallenge revisions (#1891, #1892) revise roadmaps on main, so the README cites those roadmaps as they are on main.
- **Sources.** No literature source was added, and no text was found unreadable, so no needs-references file was written.

## Build

`lake build TauCetiRoadmap.AbelianVarietiesOverFiniteFields.Suggested` at `3ef7d747`:

```text
⚠ [18243/18244] Built TauCetiRoadmap.AbelianVarietiesOverFiniteFields.Suggested
warning: TauCetiRoadmap/AbelianVarietiesOverFiniteFields/Suggested.lean:38:8: declaration uses `sorry`
warning: TauCetiRoadmap/AbelianVarietiesOverFiniteFields/Suggested.lean:89:8: declaration uses `sorry`
warning: TauCetiRoadmap/AbelianVarietiesOverFiniteFields/Suggested.lean:115:8: declaration uses `sorry`
warning: TauCetiRoadmap/AbelianVarietiesOverFiniteFields/Suggested.lean:148:8: declaration uses `sorry`
Build completed successfully (18244 jobs).
```

## Gate

```text
gate AbelianVarietiesOverFiniteFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency direction (`gate --depcheck … --movable`):

```text
depcheck: 239 roadmaps, 2344 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

Commit: `3ef7d747 AbelianVarietiesOverFiniteFields: review repairs (Kummer comparison and pointless
Jacobians cited to SchemeAndStackFoundations §§2.11, 3.6)`. Not pushed.
