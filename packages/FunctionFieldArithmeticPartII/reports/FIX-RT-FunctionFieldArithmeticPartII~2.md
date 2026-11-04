# FIX-RT-FunctionFieldArithmeticPartII~2: red-team round 2 repaired

Reviews settled: `RT-FunctionFieldArithmeticPartII~2a` (F01–F08) and `RT-FunctionFieldArithmeticPartII~2b` (F01–F04). Every finding was verified against the cited sources, the pinned libraries and the sibling roadmaps before it was applied. Files changed: `packages/FunctionFieldArithmeticPartII/README.md` only. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged: no finding touched a Lean statement, a source entry or a supplier gap.

## RT-FunctionFieldArithmeticPartII~2a/F01 (P2) — applied

Verified: §3.180 took `g∈WithConv(AlgHom_A(H_A,B))` and said "Install only the bialgebra of §3.227 A locally", a forward use of the §3.227 bialgebra (the convolution monoid on algebra homomorphisms is Mathlib's `WithConv`, whose monoid structure needs a `Bialgebra` instance).

Old → new: §3.180 now defines `α_f(g,x)=lift(g,x)∘ρ_f` for an ordinary A-algebra homomorphism `g:H_A→B`; its API keeps the root formula, naturality `k∘α_f(g,x)=α_f(k∘g,k∘x)`, the coherent-family and universal-coaction bullets, and states only that the counit point `ι_B∘ε_A` fixes every chart point (by §3.174, which precedes). The product law was removed from §3.180; the unit and product laws remain §3.287 and §3.288, now stated on `1.ofConv` and `(g*h).ofConv`, with §3.227 added to their Needs and to §3.302 (the MulAction, `g•x=α_f(g.ofConv,x)`). The pattern was repaired at §3.209 (`g(h_i)`), §§3.234–3.237, §§3.320–3.321 (inverse laws now `α_f(g∘S,α_f(g,x))=x`) and in the standing paragraph of §§3.180, 3.209, 3.210 ("No bialgebra or convolution structure on H_A is used here"); the same paragraph after §3.227 says the convolution points are applied through `g.ofConv`. The reviewer's repair test (ζ₆ on the all-one point versus the counit value 1) is retained as §3.180's second Check.

## RT-FunctionFieldArithmeticPartII~2a/F02 (P1) — applied

Verified: `G_k=lim μ_n=D(ℚ/ℤ)`; a homomorphism `μ_(p^r)→G_k` corresponds to a homomorphism of character groups `ℚ/ℤ→ℤ/p^r`, which is zero because `ℚ/ℤ` is divisible. So "its band contains the infinitesimal μ_(p^r)" and "the nonreduced subgroup μ_p" were false.

Old → new: §3.421 now says each projection `G_k→μ_(p^r)` is a faithfully flat quotient corresponding to `ℤ/p^r⊂ℚ/ℤ`, not a subgroup inclusion, with `Hom(μ_(p^r),G_k)=0`, and that `G_k` is nonetheless nonreduced because `(e_[1/p]−1)^p=e_[1]−1=0` with `e_[1/p]−1≠0` in `k[ℚ/ℤ]`. The Check now computes `(e_[1/2]−1)²=0`, `e_[1/2]−1≠0`, the trivial `μ_2→G_k`, and the faithfully flat `G_k→μ_2`; the wrong model with a subgroup `μ_p` is named. No other occurrence of the subgroup claim exists (grep for "infinitesimal μ", "subgroup μ_p", "p^r").

## RT-FunctionFieldArithmeticPartII~2a/F03 (P1) — applied

Verified: the fixed-object two-fibre of `AJ_d` over a chart point is `V(π_*L)` minus its zero section (old §8.5 Check "If R is empty, … C_b=V(E) minus its zero section"); at `g=d=1` it is `G_m`, while `P^(d−g)=P⁰` is the fibre of the weight-one scalar quotient. Old §8.2's proof route assigned the projective fibre to the map to the stack.

Old → new: §8.2 was moved after the effective descent theorem and is now §8.12 (the sections formerly §§8.3–8.12 are §§8.2–8.11; §8.1 and §8.13 are unchanged). Its statement is unchanged. Its proof route now applies §8.11 with R empty: the fixed-object fibre is `V(π_*L)` minus the zero section (§8.4 with R empty), used only for full faithfulness along a smooth surjection with geometrically connected fibres; §§8.9–8.10 use its ordinary scalar quotient `P(π_*L)` with fibres `P^(d−g)` for the simple-connectivity step; §8.11 glues. The `g=d=1` instance (`G_m` versus `P⁰`) is stated in the section. Every internal `§8.x (title)` reference was renumbered and checked against the headings (0 mismatches), including `§§8.5–8.7` in §8.9 and `§§8.7 and 8.9` in the projective-space input. No other roadmap cites a Layer 8 section of this roadmap.

## RT-FunctionFieldArithmeticPartII~2a/F04 (P3) — applied

Verified: over `T=Spec C_A(0)` the tautological system has `β_n(t_n)=z_n`, target section 0 and `z_2≠0`, `z_2²=0`.

Old → new: the §3.384 Check "For every zero section, all evaluated z_n are zero" now reads "For the zero-section root system (every t_n=0), every evaluated z_n is zero", followed by a second bullet on the tautological system over `Spec C_A(0)` (f=0): target section zero, `z_2` nonzero for A nonzero with `z_2²=0` by §3.144, and the geometric-point model returning 0.

## RT-FunctionFieldArithmeticPartII~2a/F05 (P3) — applied

Verified: the identity endomorphism satisfies `h_1²=1`, `id∘id=id` and `id(0)=0`, so the three Checks did not separate inversion from the identity.

Old → new: §3.176 Checks are now: over ℤ, `S(h_2)=h_2⁵≠h_2` by the basis `1,…,h_2⁵` of `ℤ[T]/(T⁶−1)` injecting into `H_ℤ` (§3.166), which the identity fails; over 𝔽₂ the same inequality although −1=1; over ℤ, `S(3+2h_2)=3+2h_2⁵`, constant coefficient 3 kept, whereas augmentation-then-inclusion returns 5. Involutivity and the inverse laws stay in the API.

## RT-FunctionFieldArithmeticPartII~2a/F06 (P3) — applied

Verified in the cache: AOV08 line 454 is Proposition 2.7 (page marker shows printed p.1067); line 906 is Definition 3.1 (p.1077); line 910 Theorem 3.2; line 924 Corollary 3.3 (p.1078).

Old → new: the §2.16 locator reads "AOV08 line 454 — Proposition 2.7 and its proof, p.1067; line 910 — Theorem 3.2, p.1077; line 924 — Corollary 3.3 and its proof, pp.1078–1079". The worked example citing "AOV08 line 906, Definition 3.1 and Theorem 3.2" now gives line 910 for Theorem 3.2. The statement and the `finite-diagonalizable-coarse` gap are unchanged.

## RT-FunctionFieldArithmeticPartII~2a/F07, RT-FunctionFieldArithmeticPartII~2b/F01 (P3) — applied

Verified: DeligneWeightsAndPurity at its open head (read through the roadmap service) states the §8.24 stack clause in prose with no backticked names; `dmStack_etaleCohomology` occurs nowhere on main or at any open head.

Old → new: the supplier contract (line 101) and §7.4's Needs now consume "the stack clause of §8.24": the rational constructible étale coefficient category of a finite-type DM stack over a finite field with ℓ≠p, built by effective étale descent from scheme atlases, with its atlas-descent equivalence, atlas independence with composition coherence, pullback and Frobenius functoriality, and finite-dimensionality of proper rational cohomology. No new gap: the contract exists at the supplier.

## RT-FunctionFieldArithmeticPartII~2a/F08 (P3) — applied

Verified: the first two §1.8 Checks restated the recursive clauses `c_0=id` and `c_1=` right unit.

Old → new: Checks are now the three computed values: over Spec ℤ, `c_3(2⊗2⊗2)=8` (negated coordinate gives −8); over Spec ℤ[ε]/(ε²), `c_2((1+ε)⊗(1+ε))=1+2ε` (augmentation loses 2ε); over Spec ℤ/4, `c_2(2⊗2)=0` (identity on coefficients gives 2). `c_0` and `c_1` stay in the definition and API.

## RT-FunctionFieldArithmeticPartII~2b/F02 (P3) — applied

Verified: 91 Needs items on 32 lines were camel-case names split into words; a scan of all Needs lines found 113 non-conforming items (the extra ones were unbackticked "Mathlib X" duplicates and the split citation "EtaleCohomologyFoundations §§F.0.2; F.0.A1–F.0.A2 and F.3a").

Old → new: every item is now the backticked fully qualified name, checked at the pins by reading the declaration and by `#check` in a scratch elaboration (all resolved). Reconstructions that differ from the reviewer's: `AlgebraicGeometry.Scheme.zariskiPrecoverage_le_fppfPrecoverage` (namespace `AlgebraicGeometry.Scheme`, Sites/Fpqc.lean:35), `AlgebraicGeometry.Flat.flat_and_surjective_iff_faithfullyFlat_of_isAffine` (inside `namespace Flat`, Morphisms/Flat.lean:49–176), `Polynomial.Monic.free_adjoinRoot`/`finite_adjoinRoot` (AdjoinRoot.lean:752–756), `CategoryTheory.Idempotents.isIdempotentComplete_iff_idempotents_have_kernels`, `Representation.range_norm_eq_invariants` (Tau Ceti RepresentationTheory/Invariants.lean:103), `TauCeti.SheafOfModules.LocalTrivializations.ofIsInvertible`, `CategoryTheory.Sheaf.additiveUnitsFunctor` (Tau Ceti CategoryTheory/Sites/Units.lean:52, no `TauCeti` prefix), `TauCeti.AlgebraicGeometry.WeilDivisor.ofPoint`, `card_rootsOfUnity` (root namespace, RootsOfUnity/Basic.lean:252). Deleted as unresolvable at the pins: "equiv Sym add", "sections surjective" (§8.1 already listed), "H" and the bare "map" of §10.27. "AlgebraicCurves; Layer 12" → "AlgebraicCurves Layer 12" (3 places); the EtaleCohomologyFoundations split citation uses a comma (12 places). §7.5 was added to §7.12's Needs. A rerun of the scan finds 0 remaining items.

## RT-FunctionFieldArithmeticPartII~2b/F03 (P3) — applied

Verified: none of the thirteen hyphenated names is a heading; `§3.58` has no part (1); `AffineRing (1:A) n` and `MuHopf A n` are pseudo-Lean.

Old → new: the slugs were replaced by section citations with titles, checked against the headings: §1.20 and §1.209 (normalization arrows and the natural base-change isomorphism), §3.377, `AdjoinRoot.lift_of`, §3.143, §3.375, §5.5 with §5.9, §10.10 (twice), §10.22, §10.14, §10.11, and δ_N^0 of §10.27. "quotient-stack-algebraic" cites SchemeAndStackFoundations §1.20, where "the quotient stack of a smooth groupoid is algebraic" is stated (its line 2888 lies in §1.20, lines 2843–2950), not §1.19 as the reviewer suggested. "§3.58(1)" → "§3.58 at f=1" (28 places); "AffineRing (1:A) n" → "A[T]/(Tⁿ−1)" and "MuHopf A n" → "A[ℤ/n]" (15 places each); the §1.44 "AffineRing(u,n)" → "B[T]/(Tⁿ−u)".

## RT-FunctionFieldArithmeticPartII~2b/F04 (P3) — applied

Verified: FunctionFieldArithmetic §2.1 at the supplied head is "Divisor lattices" (its line 682); §10.4 here is the residue interpolation on the pinned `TauCeti.Place.exists_forall_residue_eq`; AlgebraicCurves Layer 5 (its line 645) states strong approximation.

Old → new: the §10.18 sentence "This exact approximation statement is request FunctionFieldArithmetic §2.1" → "The approximation input is §10.4 (nonzero residue interpolation), which prescribes nonzero residues at the finitely many branch places to arbitrary finite precision using the pinned weak approximation theorem; strong approximation is AlgebraicCurves Layer 5"; §10.4 and AlgebraicCurves Layer 5 were added to the Needs line.

## Checks

- `lake env lean packages/FunctionFieldArithmeticPartII/Suggested.lean` from the content checkout: exit 0; three `declaration uses sorry` warnings (lines 81, 88, 98), no errors. The only change to the file this round is its header (see "Worker repair" below).
- Worker repair: the worker's build warned that `TauCetiRoadmap/FunctionFieldArithmeticPartII/Suggested.lean` imports `Mathlib`, a package built for the module system, from a non-module file. Repaired by adopting the module-system header already used on main by `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean`: the file now begins `module` and imports Mathlib as `public import Mathlib`. Nothing else in the file changed; declarations, docstrings and the module docstring are as before. After the change `lake env lean` exits 0 with only the three `sorry` warnings, and `#check @name` for all six declarations (scratch copy) gives types identical to `signatures.md`.
- Scratch elaboration (`#check @name` for the six declarations and for every reconstructed pinned name of 2b/F02, importing the Tau Ceti modules whose object files exist): exit 0, no `unknown` identifier. The six elaborated types agree with `signatures.md` and with README §§1.7, 1.26, 1.190, 1.191, 2.3; no binder changed. Three Tau Ceti modules (`RootsOfUnity/Scheme`, `LineBundle/Functoriality`, `CategoryTheory/Sites/Units`) have no object file on this worker; their four names were verified by reading the declarations at the pin (Scheme.lean:194, Functoriality.lean:49 and 69, Units.lean:52 and 58).
- Dependency check (exact output):

```text
depcheck: 210 roadmaps, 1826 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line.
- Citation resolver on the README: no cross-roadmap citation and no Lean name found nowhere.
- Needs scan after the edits: 0 items that are not a section, a gap, a backticked name or a supplier section.
- Dependency check re-run after the header repair (exact output): `depcheck: 210 roadmaps, 1826 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Gate failures listed in the brief: none; the worker's one build warning (module-system import) is repaired as described above.

## Adversarial pass on the changed statements

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| §3.180 `α_f(g,x)` on ordinary algebra points | ℤ→ℂ, f=1, g(h_i)=exp(2πi/d_i), all-one x | u_1↦−1, u_2↦ζ₆; counit point gives 1,1; wrong counit h_1↦−1 gives −1≠1 | Checks kept and sharpened |
| §3.180 counit bullet | any B, x | ε_A(h_i)=1 so α_f(ι_B∘ε_A,x)(u_i)=1·x(u_i) | true without the bialgebra |
| §3.287/§3.288 with `.ofConv` | g*g on ζ₆ point | both sides send u_2 to ζ₆² | unchanged mathematics |
| §3.421 band | char p: Hom(μ_p,G_k); k[ℚ/ℤ] | Hom(ℚ/ℤ,ℤ/p)=0; (e_[1/2]−1)²=e_[1]−1=0, e_[1/2]−1≠0; G_k(k̄)=prime-to-p Ẑ(1) | quotient, not subgroup |
| §8.12 route | g=d=1, R=∅ | fibre H⁰(L)∖0=G_m; scalar quotient P⁰ | only P⁰ enters simple connectivity |
| §3.384 Check | zero-section system; tautological over Spec C_A(0) | all z_n=0; z_2≠0 (A≠0), z_2²=0 | both readings distinguished |
| §3.176 Checks | ℤ, 𝔽₂; 3+2h_2 | S(h_2)=h_2⁵≠h_2; S(3+2h_2)=3+2h_2⁵, augmentation gives 5 | identity and augmentation excluded |
| §1.8 Checks | ℤ: 2³; ℤ[ε]: (1+ε)²; ℤ/4: 2² | 8; 1+2ε; 0 | three wrong coordinates excluded |
| §10.18 approximation | branch places, finite precision | §10.4 prescribes nonzero residues; Place.exists_forall_residue_eq at the pin | input exists before §10.18 |

## For the maintainer

- Layer 8 was renumbered: former §8.2 is now §8.12 and former §§8.3–8.12 are §§8.2–8.11. No roadmap on main or at an open head cites a Layer 8 section of this roadmap (checked with the roadmap service).
- The five `dmStack_etaleCohomology*` names are no longer cited anywhere in this package; other consumers of DeligneWeightsAndPurity that still use them are not this package's to repair.
- Ownership against open pull requests beyond the roadmap service index of 2026-11-04 was not checked.
- The suspicious-text rule was not triggered: no fetched text asked for commands, credentials or file changes.
