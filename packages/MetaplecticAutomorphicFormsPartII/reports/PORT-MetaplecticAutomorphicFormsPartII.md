# PORT-MetaplecticAutomorphicFormsPartII

- **Branch:** `roadmap/metaplectic-automorphic-forms-part-ii`, from `42813dd`.
- **Head commit:** `32356e5aa3890ce0e79ce97d6c318c515e2212c0`, "MetaplecticAutomorphicFormsPartII: roadmap (README, Suggested.lean, metadata)".
- **Files:** `TauCetiRoadmap/MetaplecticAutomorphicFormsPartII/README.md` (549 lines), `TauCetiRoadmap/MetaplecticAutomorphicFormsPartII/Suggested.lean` (419 lines), `TauCetiRoadmap/MetaplecticAutomorphicFormsPartII/metadata.toml` (`topic = "math.RT"`). Nothing outside the folder changed.

## Build

`lake build TauCetiRoadmap.MetaplecticAutomorphicFormsPartII.Suggested` on the committed file:

```text
Build completed successfully (18272 jobs).
```

7 warnings, all `declaration uses 'sorry'` (Suggested.lean lines 156, 185, 235, 271, 334, 369, 399), one per headline theorem. There are no errors and no other warnings.

## Gate

```text
gate MetaplecticAutomorphicFormsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check (`gate --depcheck … --movable`), exact output:

```text
depcheck: 213 roadmaps, 1923 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Draft pull request body

This roadmap builds the representation theory of finite Heisenberg groups and finite symplectic groups in odd characteristic, which the constructions of tame and classical-group supercuspidal types take as their finite input. On the half-form Heisenberg group of a nondegenerate alternating space over a finite field (MetaplecticAutomorphicForms Layer 0, with Tau Ceti's factor-set extensions), it constructs the Schrödinger model and its character, proves the finite Stone–von Neumann theorem and its fully ramified generalization to any finite group with a nondegenerate commutator pairing, and builds intertwiners between polarized models. It then normalizes the projective Weil action of `Sp(V)` by the parity-determinant identity `det W(g) = (det W(g)|S⁺)²`, which gives a unique genuine Weil representation even for `Sp₂(𝔽₃)`, where perfectness fails, and computes it on generators. From there it assembles the Weil–Heisenberg representation of `H(V) ⋊ Sp(V)` and its transport along equivariant special isomorphisms. Its end theorems are the corrected Gérardin parabolic induction formula, with the quadratic character of the determinant on the isotropic subspace placed in the inducing representation; the isotropic-invariants theorem for fully ramified characters; the quadratic determinant character on Lagrangian fixed lines; and tensor compatibility of normalized Weil representations along orthogonal sums. The general theorems are stated in `Suggested.lean` against the pinned Mathlib and Tau Ceti: Stone–von Neumann, fully ramified uniqueness, existence and uniqueness of the normalized Weil representation, Gérardin induction, isotropic invariants, the fixed line and the tensor law.

## Dependencies that are still pull requests

- **MetaplecticAutomorphicForms**: supplier. Layer 0, §§0.1–0.10 and §0.9a (bilinear Heisenberg extension, half-form commutator and centre, isometry action, polarized cocycles, Lagrangian complements and transitivity). Every cited section and declaration name was checked at its head.
- **MordellLawrenceVenkatesh**: supplier. Layer LV.3, §3.1 (dimension criterion for Lagrangians); its §3.2 is consumed from the pin as Tau Ceti's `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J_inl_eq`. Checked at its head.
- **SmoothRepresentationsOfLocalGroups**: named only in Scope and ownership, as the owner of the `GL_n` Bushnell–Kutzko types in §SR.5.2 (heading "SR.5.2 Integral blocks, Whittaker projectives and families", which contains the distinguished cuspidal types). Nothing here is consumed from it. It is earlier in the merge order, so the citation is not upward.

All three are earlier than this roadmap in the merge order. InductionRestriction, CharacterTheory and ReductiveGroupsPartII are on main.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already had the required form: seven headline theorems; eight definitions with real bodies, each needed to state a headline; no sorry'd data; no padding; no `set_option`; one module docstring; `/-! ## Layer k -/` sections in README order. It also had a single `public import Mathlib` plus the three Tau Ceti modules it uses: `TauCeti.Algebra.GroupAction.Trivial`, `TauCeti.GroupTheory.GroupExtension.Of.FactorSet` and `TauCeti.LinearAlgebra.BilinearForm.Isometry`, all present at the pin. Every README statement is still in place. No headline statable at the pins is missing. Existence of an irreducible representation with a prescribed invariant central character is the invariant case of Clifford theory (InductionRestriction Layer 5), as the docstring says, and is not a headline.

## Supplier replacements and duplication removals

1. **`heisenbergFactorSet` restated a pinned construction (Lean and README §1.1).** The package defined the factor set `(v, w) ↦ ω(v, w)/2` with its own cocycle proof. Tau Ceti has `TauCeti.FactorSet.ofBimultiplicative` (`TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean:554`): the factor set `β g h` of a bimultiplicative `β : G →* G →* M` for a trivial action.
   - `heisenbergFactorSet ω` is now `TauCeti.FactorSet.ofBimultiplicative` of `v ↦ w ↦ ofAdd (ω v w / 2)`, and the hand-written cocycle proof is gone.
   - The pinned definition's body is not exported under the module system, so `heisenbergAction`'s `map_mul'` now uses `TauCeti.FactorSet.ofBimultiplicative_apply` (line 559) instead of a definitional `show`.
   - README §1.1, its *Needs* line, the Tau Ceti supplier contract and Scope now cite the pinned declaration.
   - The elaborated type of every declaration is unchanged.
2. **`polarizationForm` and Tau Ceti's real cotangent form.** `TauCeti.cotangentSymplecticForm` (`TauCeti/Geometry/Symplectic/Cotangent/Basic.lean:80`) has the same formula and sign, `β(v) − α(w)`, but only on real vector spaces, and its underlying bilinear form is private. `polarizationForm` stays, since this roadmap needs finite fields. Scope says in one clause how the two differ.
3. **Owners named in Scope** (no target deleted, none duplicated):
   - Moy–Prasad filtrations and Yu's mixed-depth groups are ReductiveGroupsPartII §RG2.3.6 on main.
   - The `GL_n` Bushnell–Kutzko types, with their Heisenberg representation of `J¹(β, 𝔄)`, are SmoothRepresentationsOfLocalGroups §SR.5.2. That Heisenberg representation is an instance of §1.4, which is the general finite-group theorem.
4. **CharacterTheory** is now cited by section (§0.2, the character pairing and orthonormality) instead of "CharacterTheory's orthogonality".

**Duplication sweep.** I ran `roadmaps grep` over main and the 440 indexed open heads for these objects:
- fully ramified, totally ramified or nondegenerate commutator pairings, and extraspecial groups;
- Stone–von Neumann, finite Weil, `Weil representation of Sp`, Schrödinger models, Egorov covariance and the parity determinant;
- Gérardin, special isomorphisms, finite Heisenberg `p`-groups, Moy–Prasad filtrations, Fintzen, Yu and Bushnell–Kutzko.

I read every hit that could be a second owner. None owns this finite-field theory:
- **MetaplecticAutomorphicForms §4.7** is the `Mp₂(ℤ)` discriminant-module representation (already distinguished in Scope).
- **Stone–von Neumann** hits in QuantumFoundations, RelativisticQuantumFieldTheory, ModularityAndLanglandsExtensions, OperatorAlgebraDynamics and ExceptionalThetaCorrespondencesForG2 are real or local.
- **"Finite Weil"** hits elsewhere are Weil divisors, Weil groups or the discriminant module.
- **AbelianSchemesAndArithmeticModuli** (theta groups) treats group schemes, with no representation theory.
- **TemperleyLiebOperatorAlgebras** uses a specific Heisenberg group of order `3^(N+1)` for its clock–shift models.
- **OddOrderTheorem** proves an extraspecial fixed-point theorem and comes later in the merge order.
- **InductionRestrictionPartII** has tables of order-27 examples.

The board packages were not searched beyond the three listed in the board index; none of them is related.

Ownership against open pull requests was checked for the roadmaps whose heads the tool indexes: the 205 sibling checkouts and the 440 indexed heads. No `Suggested.lean` declaration uses the fully qualified name of a declaration in another readable roadmap; `roadmaps grep` finds none of the 15 names elsewhere.

## Signature check

I appended `#check @name` for all 15 declarations, and for 58 Mathlib and Tau Ceti names the README cites, to the module, with temporary imports of five already-built Tau Ceti modules. I elaborated it once with the permitted `lake build`, then removed the block and the imports. All 58 library names resolved at the pins. `TauCeti.FactorSet.ofBimultiplicative_apply` is used by the committed proof of `heisenbergAction`, which elaborates. Two cited Tau Ceti modules have no object file at the pin, so their declarations were checked by reading the pinned sources instead:
- `TauCeti.IsProjectiveRep` (`RepresentationTheory/ProjectiveRepresentation/Basic.lean:97`) and `TauCeti.IsProjectiveRep.rescale` (line 133), whose factor-set convention `ρ(g)ρ(h) = α(g, h)ρ(gh)` and coboundary `c(g)c(h)c(gh)⁻¹` match §2.1;
- `TauCeti.GLSymplecticFin.eq_top_of_root_subgroups` (`LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/TorusGeneration.lean:145`).

I compared the 15 elaborated types, whitespace-normalized, with the worker's `signatures.md`: all 15 are identical. No section binder was lost. Each type matches its README statement:
- the finite field, `ringChar k ≠ 2` and `ψ ≠ 1` are explicit in all five Weil and Heisenberg theorems;
- `FiniteDimensional` is explicit on `X`, `V` and `X₀`;
- normality, `hcomm`, `hinv`, `hnd` and `[Finite J]` are explicit in both fully ramified theorems;
- `hP`, `hr`, `hrI`, `hrω`, `hp₂`, `hΩ` and `hσ` are explicit in the Gérardin theorem.

## Fixes made in the upstream-reviewer reread

1. **`J` meant three different things.** It named the isotropic complement (§0.1, §3.1, §3.2, Layer 0 Examples), the symplectic matrix `J = (0, I; −I, 0)` (§0.2, Layer 2) and the finite group of §1.4. The §3.2 proof route used the first two in one paragraph ("`J = Y × {0}`" and "`J₀` the element `J` of §0.2"). The complement is now `I′` throughout. `J` keeps the matrix meaning, and §1.4/§3.4 keep `J` for the group, in their own sections.
2. **Conventions cited sources by text-file line numbers** ("F21 line 1320", "FS25 line 395"). These are now page locators: F21, proof of Lemma 7.10, p. 33; FS25, Example 3.1.6, p. 11.
3. **References, F21 entry:** a sentence began in lower case ("…are used. the tensor description…"). It now reads "Cited: the tensor description…".
4. **Scope** now names the owners of the p-adic material (ReductiveGroupsPartII §RG2.3.6, SmoothRepresentationsOfLocalGroups §SR.5.2) instead of "the roadmaps that construct types". It also names the two pinned near-duplicates in item 2 of the previous section.

## Adversarial mathematics pass

Values come from hand computation, plus a pure-Python matrix check for the rows marked (num), with maximum error at most 7·10⁻¹⁶. ζ = exp(2πi/3).

| Statement | Instances tried | Values computed (both sides) | Result / change |
|---|---|---|---|
| `polarizationForm` sign | `X = k`, `((1,0),(0,1))`, `((0,1),(1,0))`; `X = 0` | `1` and `−1`; the convention `y(x′) − y′(x)` gives `−1`, `1`. Zero form on the zero space is nondegenerate. `TauCeti.cotangentSymplecticForm` over ℝ at `((1,0),(0,1))`: `β(v) − α(w) = 1` | Same sign as the real Tau Ceti form; Scope note added |
| §0.2 `J`, `m(A)`, `u(C)` in `Sp` | general symbolic; `J(1,0)` | `ω(J(x,y), J(x′,y′)) = x·y′ − x′·y = ω`; `m(A)`: `y′ᵀA⁻¹Ax − …` = ω; `u(C)`: `x′ᵀCx − xᵀCx′ = 0` needs `C` symmetric. `J(1,0) = (0,−1)`, `Matrix.J(1,0) = (0,1)` | Sound |
| §0.1 adapted coordinates (with `I′`) | `I = 0`; plane; line in two planes; `𝔽₃⁴` with `I′ = ⟨f₁+e₂, f₂⟩`; `𝔽₂` plane | `dim V = 0+dim V`; `2 = 2·1+0`; `4 = 2·1+2` (not 3); `ω(f₁+e₂, f₂) = 0+1 = 1` (not isotropic) while `ω(eᵢ, f₁+e₂) = δᵢ₁`; `𝔽₂`: `ω((1,0),(0,1)) = 1`, no division | Sound; rename only |
| `heisenbergFactorSet` via `ofBimultiplicative` | `𝔽₃²`, `(e₁, e₂)` and `(e₂, e₁)`; `V = 0`; char 2 | `ofBimultiplicative_apply`: `β e₁ e₂ = ofAdd(1·2) = 2`, `β e₂ e₁ = ofAdd(−2) = 1`; products `(2,(1,1))`, `(1,(1,1))`, commutator `1 = ω(e₁,e₂)`. `V = 0`: group `k`. Char 2: `1/2 = 0`, commutator `0 ≠ 1` | Same values as the old body; elaborated type unchanged |
| `heisenbergAction` direction | `J` on `(2,(1,1))`; non-isometry `diag(2,1)`; `J u(1)` vs `g⁻¹` convention | `(2,(1,−1))` both ways; `(2,(2,1))` vs `(1,(2,1))`; `J u(1)(1,0) = (1,−1)` both ways, `g⁻¹` convention `(0,1)` vs `(1,1)` | Sound; proof now via `ofBimultiplicative_apply`, builds |
| `TauCeti.HeisenbergGroup` comparison | `(0,1,0)(0,0,1)`; general | `(1/2,1,1) ↦ (1,1,1) = (1,0,0)(0,1,0)`; general third coordinate `t+s+xy′+xy/2+x′y′/2` on both sides | Sound |
| `schrodingerOp` law and sign | general; `q = 3`, `T = π(0,1,0)`, `M = π(0,0,1)` (num) | Both exponents `t+s+y(z)+y′(z)+y′(x)+y(x)/2+y′(x′)/2`; `TM = π(2,1,1)` (error 0); `TM = ζMT` (7·10⁻¹⁶), `MT − ζTM` = 1.73 | Sound |
| §1.2 induced model | right translation at `(0,z,0)` | `(t+y(z)/2, (z+x, y)) = (t+y(z)+y(x)/2, (0,y))·(0,(z+x,0))`, giving `ψ(t+y(z)+y(x)/2)f(z+x)` | Matches the right-coset convention of `TauCeti.Rep.indSubtypeEquivPi_ρ_apply` |
| `finite_stoneVonNeumann` | `q = 3, n = 1`; `n = 0`; `ψ = 1`; `𝔽₉` | `d² = 9 = Nat.card V`, norm `27⁻¹·3·9 = 1`; `n = 0`: `1 = 1`; `ψ = 1`: 9 inequivalent characters; `𝔽₉`: `Σψ(z) = 3(1+ζ+ζ²) = 0` | Sound; `hψ` needed |
| `fullyRamified_unique` | `Q₈`, `H = {±1}`; `H = J`; `C₃`, `H = 1`; central product `Heis(p³) ∘ C_{p²}` | `[i,j] = −1`, `θ = −1`, `d² = 4 = 8/2`; `1 = 1`; abelian: `d² = 1 ≠ 3`, 3 extensions; `d² = p² = p⁴/p²`. `θ([x,g]) = θ([g,x])⁻¹ ≠ 1` gives vanishing off `H` | Sound |
| §1.5 `T_{BA}` | `A = B` line in `𝔽₃²`; distinct lines; `V = 0` | `T_{AA} = 3`, `T_{AA}² = 9 = 3·3`; distinct: `3·1 = 3` (`|A|²` would give 9); `V = 0`: `1` | Sound |
| §2.1 factor sets | `μ(J) = 2F`; rescale `μ(u(1))` by `ζ`; parity | `c(J,J) = 4 = a(J)²/a(−1)`; `c(g,g)·ζ²`; `tr R = 1` (q=3) so `μRμ⁻¹ = R`, not `−R` | Sound; convention matches `IsProjectiveRep` |
| `evenPart`, `IsNormalizedWeil`, `existsUnique_isNormalizedWeil` | `q = 3, 5`; `n = 0`; order-3 twist; inverted ratio | `N − 2N⁺ = −1` for `(3,2)`, `(5,3)`; `κ(aμ) = a⁻¹κ(μ)`; `n = 0`: `1 = 1²`; twist: `λ³ = 1` vs `λ⁴ = λ`; inverted: factor `a²` | Uniqueness holds with no perfectness; `Sp₂(𝔽₃)` included |
| §2.3 generators (num) | `q = 3, 5`: `F_ψ`, `u(1)`, `m(a)` for every `a` | `det F = −i` (q=3), `−1` (q=5); `F² = R`; `FTF⁻¹ = π(0,0,−1)`; `W(u(1)) = diag(1,ζ,ζ)`, `det = ζ² = (det|S⁺)²`; `κ(m(a))` = `(1,−1)` for `𝔽₃` and `(1,−1,−1,1)` for `𝔽₅`, equal to `χ(a)` | Sound; `J` sign forced by covariance |
| §2.4 `Ω` | `(h,1)(1,J)`, `h = (0,e)` | `π(h)W(J)` vs reversed `W(J)π(h) = π(h)W(J)` only if `J⁻¹e = e`; `J⁻¹e = f` | Normal-first order needed |
| §2.5 transport | `w = (0,1)`, `(1,0)` with `K = ⟨u(1)⟩` | `u(1)(0,1) = (0,1)` fixed; for `w = (1,0)` central coordinates `1` vs `0` | Fixed-vector hypothesis needed |
| §3.1 mixed model (with `I′`) | line in `𝔽₃⁴`; `I` Lagrangian; `I = 0` | phase `ψ(ω(j,i))`; `j ≠ 0` gives sum `1+ζ+ζ² = 0`; invariant dimensions `3`, `1`, `qⁿ`; `|I′|·3 = 9` | Sound |
| §3.2 parabolic fixed space | `q = 5`, `m(2)`, `I` = y-axis or x-axis; `J₀u(C)J₀⁻¹` | y-axis: `det(m(2)|_I) = 3`, `χ₅(3) = −1 = χ₅(2)`; x-axis `χ₅(2) = −1`; `J u(C) J⁻¹ = (1, −C; 0, 1)`, so upper shear `B` is `J u(−B) J⁻¹` | Sound; twist needed |
| `parabolicSubgroup` | `P` stabilizing `I`; `I` = x-axis, `P = ⟨J⟩` | `((t,v),g) = inl(t,v)·inr(g)`, closure uses `g I^⊥ = I^⊥`; `⟨J⟩` gives `(0,(0,−1))`, so all of `H(V)` | Description needs `P` to stabilize `I` (Check present) |
| `weilHeisenberg_parabolic_induction` | `q = 5`, `I = {0}×X*`, `P = {m(a)}`; `I = 0`; line in `𝔽₃⁴` | `σ(m(2)) = χ₅(3) = −1 = W(m(2))` on `δ₀`; untwisted Hom `= 0`. `σ` respects products: `ω₀(rv, r(gv′)) = ω(v, gv′)` on `I^⊥`. Dimensions `q^{dim I}·q^{n−dim I} = qⁿ`; `3·3 = 9` | Sound; `hΩ`, `hσ` determine `Ω`, `σ`, which exist |
| `fullyRamified_isotropicInvariants` | `U = 1`; `U ≤ ker θ`; `U = H`, `θ ≠ 1`; Heisenberg line in `𝔽₃⁴`; `𝔽_p` plane | `d²|H| = |J|`; same; excluded by `hU` (`0·|H| ≠ |J|`); `3²·9 = 81`; `1·p² = p²`. General `(d/b)²·|H|b = |H||A|/b = |Q|` | Sound; `H ≤ Q` by invariance |
| `isNormalizedWeil_lagrangian_fixed` (num) | `q = 3, 5`, `L = {0}×X*`, `m(a)`; `𝔽₉`, `g = −1`; `X = 0` | eigenvalue `κ(m(a))` = `χ(det(m(a)|_L))` with `det = a⁻¹`: q=5 `(1,−1,−1,1)` vs dets `(1,3,2,4)`; `𝔽₉`: `−1 = i²`, `+δ₀`; `X = 0`: `1` | `IsSquare` form correct; `det ≠ 0` |
| `isNormalizedWeil_pi_tensor` (num) | two `𝔽₃` planes, `J ⊕ J`; empty family | `κ = (det F)⁶ = −1`; left `−1/3`, right `(−i/√3)² = −1/3`, max error 5·10⁻¹⁶; `κ = 1` gives `+1/3`; empty: both sides `1` | Sound |
| Conventions `χ` via `IsSquare` | `𝔽₅`, `a = 2` | `quadraticChar_one_iff_isSquare` (needs `a ≠ 0`), `χ₅(2) = −1`, squares `{1, 4}` | Sound |

## Unresolved, and notes for the maintainer

- **A false claim about this roadmap in another one.** SmoothRepresentationsOfLocalGroupsPartII, an open pull request, says at `TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md` line 1891: "MetaplecticAutomorphicFormsPartII uses relative isolation and the isolated-summand theorem for local-global comparisons". This roadmap uses neither and does not cite that roadmap. The sentence should be corrected there; nothing here depends on it.
- **MetaplecticAutomorphicForms §0.1 duplicates the pin.** Its `bilinearFactorSet` restates Tau Ceti's `TauCeti.FactorSet.ofBimultiplicative`. That roadmap should cite the pinned declaration; this roadmap now does.
- **Sources.** Gerardin77 is paywalled and cited only through the correction in F21, footnote 3. The OCR of N02 is damaged at some exponents around Theorem 4.3; the determinant computations were checked independently (table above). Both were known to the accepted review.
- **Other names.** `roadmaps grep` finds no other roadmap citing any of the 15 declaration names.
- **Untrusted text.** Nothing read in the package, the reports, the other roadmaps or the tool output tried to direct the work.


Pull request: #2261 (roadmap/metaplectic-automorphic-forms-part-ii at 32356e5)
