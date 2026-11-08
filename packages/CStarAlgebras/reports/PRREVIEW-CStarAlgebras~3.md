# Review of CStarAlgebras (pull request #860 at 1acff0f)

**Verdict:** needs changes

Full review of the folder at this head (3361 lines changed since d09f240: the README was rewritten
in TauCetiRoadmap form, `Suggested.lean` was reduced to headline statements with a single
`import Mathlib`). Every finding of the previous review is repaired (listed under "Previous
findings"). The gate passes, the elaboration is clean, the dependency check reports no problem, and
nothing outside the folder changed. The findings below are all P3: one Check that attributes to
Blackadar a statement the cited item contradicts, two Checks whose witnesses are wrong, locators
missing from five targets, one reference missing, one docstring section label, one verbatim quote.

## R01 (P3) — §5.1 Check: `C*(F₂) ⊙ C*(F₂)` has two C*-norms, attributed to Blackadar II.9.4.6

**Location.** `TauCetiRoadmap/CStarAlgebras/README.md` line 1123: "`C*(F₂) ⊙ C*(F₂)`:
`‖·‖_min ≠ ‖·‖_max` (Blackadar II.9.4.6)"; line 1554: "Whether `C*(F_∞)` has WEP is Kirchberg's
QWEP problem (Pisier, Problem 12.9); no target here decides it".

**Claim.** The source states that min and max differ on `C*(F₂) ⊙ C*(F₂)`.

**Witness.** `blackadar` lines 8079–8089: II.9.4.6 asserts two norms on `C*_r(F₂) ⊙ C*_r(F₂)` (i)
and on `C*(F₂) ⊙ C*_r(F₂)` (ii), and in (iii) that the representation of `C*(F₂) ⊙ C*(F₂)` induced
by `(λ∘π, ρ∘π)` *is* continuous for the minimal norm. Whether `C*(F₂) ⊙ C*(F₂)` carries one C*-norm
is Kirchberg's problem: `pisier-gt` lines 1945–1946 (Problem 12.9, for `C*(F_N)`, `N > 1`) and lines
1917–1918 (`F_∞` may be replaced by `F₂`). So the Check asserts, with a locator that says otherwise,
the statement that line 1554 of the same README calls undecided here.

**Repair.** Replace the Check by `C*_r(F₂) ⊙ C*_r(F₂)`: `‖·‖_min ≠ ‖·‖_max` (Blackadar II.9.4.6(i);
Takesaki), or by `C*(F₂) ⊙ C*_r(F₂)` (II.9.4.6(ii)); keep the second clause about non-commuting
pairs. In §5.4/§5.1 Examples (line 1245 "the two-norm algebra `C*(F₂) ⊙ C*(F₂)`") make the same
change. Tested: II.9.4.6(i) is exactly the replaced statement, and §6.2's "`C*(F₂)` and `C*_r(F₂)`
are not nuclear (II.9.4.6)" stays correct (`blackadar` lines 8074–8078).

## R02 (P3) — §1.7 Check: the shifts `S^n` do not converge strongly to `0`

**Location.** README line 486: "the shifts `S^n` converge strongly to `0` but `(S^n)* = S*^n` does
not, so `S^n` is not strictly convergent."

**Witness.** With `S` the forward shift of §8.4 (`Sx(n+1) = x(n)`), `‖S^n x‖ = ‖x‖` for every
`x`, so `S^n x ↛ 0`; while `‖S*^n x‖² = Σ_{k ≥ n} |x_k|² → 0`, so `S*^n → 0` strongly. The roles
are swapped. The conclusion (no strict limit) is right: `S^n` has no strong limit at all, since
`⟪S^n x, y⟫ → 0` for all `x, y` while `‖S^n x‖ = ‖x‖`.

**Repair.** "the adjoint shifts `S*^n` converge strongly to `0` but `(S*^n)* = S^n` does not
(`‖S^n x‖ = ‖x‖`), so `S*^n` is not strictly convergent". Tested on `x = e₀`: `S*^n e₀ = 0` for
`n ≥ 1`, `S^n e₀ = e_n`, `‖e_n‖ = 1`.

## R03 (P3) — §1.3 Check: the proposed wrong-adapter witness is not continuous on `X`

**Location.** README lines 363–364: "a wrong adapter that forgot continuity at `ε` would admit the
bounded discontinuous function `t ↦ sign(t − 1/2)`."

**Witness.** `sign(t − 1/2)` is discontinuous at `t = 1/2 ∈ X = (0,1]`, so it lies in no space of
continuous functions on `X` whatever the condition at `ε`; it discriminates nothing. The function
the wrong adapter admits is one continuous and bounded on `(0,1]` without limit `0` at `0`: the
constant `1`, or `t ↦ sin(1/t)`.

**Repair.** "would admit the constant function `1` (or `t ↦ sin(1/t)`), which is bounded and
continuous on `(0,1]` but has no limit `0` at `ε`". Tested: `1 ∈ C_b((0,1]) ∖ C₀((0,1])`.

## R04 (P3) — Targets without a locator, and one supplier citation without a target name

**Location.** README §1.5 (lines 406–430, no source), §2.9 (lines 781–802, no source), §3.2 line
920 ("Smith's lemma: a map into `M_n` has `‖u‖_cb = ‖u_n‖`", no source), §9.3 (lines 1756–1782,
no source), §9.5 line 1811 (the definition and equivalent formulations of operator-space local
reflexivity, no source); line 1858: "using V4's comparison of bounded strong-star convergence"
without naming the V4 target.

**Witness.** Every other `### k.n` carries at least one locator; these five carry none, and the
rule is a locator at every claim. VonNeumannAlgebras at its open head (dee80881) has V4.Core,
V4.PositivePredual, V4.Normality and V4.0 (its lines 972–1280); the phrase "comparison of bounded
strong-star convergence across faithful normal realizations" occurs in none of them, so the
citation cannot be checked as written.

**Repair.** Add locators: §1.5 and §2.9 to Pedersen, *C*-algebras and their automorphism groups*
(approximate units in left ideals, §1.7; open projections and `M(A)` in `A**`, §§3.11–3.12) or to
Blackadar II.4.1 and III.5.2.11 for the parts they cover; §3.2 to R. R. Smith, *Completely bounded
maps between C*-algebras*, J. London Math. Soc. 27 (1983), Theorem 2.10, or Paulsen's *Completely
bounded maps and operator algebras* Proposition 8.11; §9.3 and the cone-embedding route to the
Dadarlat paper of R05; §9.5 to Effros–Haagerup, *Lifting problems and local reflexivity for
C*-algebras*, Duke Math. J. 52 (1985). At line 1858 name the V4 target (V4.Normality's normal
representations) or state the comparison as a §9.6 target with its route (a normal
*-isomorphism is a homeomorphism for the strong-star topology on bounded sets).

## R05 (P3) — §9.4: the cone-embedding theorem is cited to a Blackadar remark that does not state it, and its paper is not in the references

**Location.** README lines 1794–1795: "the route here is Dadarlat's cone embedding, Blackadar
V.4.2.12 and the remark citing [Dad00]"; References lines 1976–1977 list only M. Dadarlat, *On the
approximation of quasidiagonal C*-algebras*, J. Funct. Anal. 167 (1999).

**Witness.** `blackadar` lines 19419–19430: V.4.2.12 is a remark on quasidiagonality versus
nuclearity and cites [Dad00] for a simple unital quasidiagonal non-exact algebra, not for the cone
theorem; line 20379 identifies [Dad00] as Dadarlat, *Nonnuclear subalgebras of AF algebras*, Amer.
J. Math. 122 (2000), which is the paper proving that the cone of a separable exact RFD algebra
embeds in an AF algebra. The 1999 paper in the references is the external approximation theorem of
§9.2, a different result.

**Repair.** Add M. Dadarlat, *Nonnuclear subalgebras of AF algebras*, Amer. J. Math. 122 (2000),
581–597, doi:10.1353/ajm.2000.0019 to the references (uncertified if paywalled) and cite it in
§9.1 ("cones over RFD algebras are RFD"), §9.3 and §9.4 with its theorem number; drop "Blackadar
V.4.2.12 and the remark citing [Dad00]" or keep it only as "cf.".

## R06 (P3) — Docstring section label: `exists_quasicentral_approximateUnit` is stated by §1.4, not §1.5

**Location.** `TauCetiRoadmap/CStarAlgebras/Suggested.lean` line 67: "§1.5 (Arveson): every closed
two-sided ideal has a positive contractive approximate unit that is quasicentral in `A`."

**Witness.** README line 392 (§1.4): "`Suggested.lean` states `exists_quasicentral_approximateUnit`";
§1.5 is "Approximate identities in algebraic left ideals" and names no Lean declaration.

**Repair.** Change "§1.5" to "§1.4" in the docstring.

## R07 (P3) — A verbatim quotation from the source

**Location.** README line 1417: `II.9.6.6 end: "not every exact C*-algebra is nuclear"`.

**Witness.** `blackadar` line 8198 contains these six words verbatim; statements are in the
author's own words, with a locator.

**Repair.** "(Blackadar II.9.6.6, end: exactness is strictly weaker than nuclearity)".

## Previous findings

Every finding of the review at d09f240 is repaired at this head:

- R01 (HilbertModules cycle) — repaired: lines 72–76 "HilbertModules owns … it consumes Layers 1,
  2 and 7–9 and supplies nothing here. The matrix-field computations of §2.10 are self-contained";
  no `*Needs:*` line names HilbertModules (grep: lines 72, 86, 1916 only, all as consumer).
- R02 (OperatorTheory umbrella) — repaired: lines 77–82 cite `OperatorTheory/PolarDecomposition`
  and `OperatorTheory/SelfAdjointSpectralTheory`; "Nothing is taken from the OperatorTheory
  umbrella itself or from its ToeplitzOperators roadmap".
- R03 (V13b.SpatialNorm owner) — repaired: lines 47–50 and §5.1 lines 1104–1108 consume
  `V13b.SpatialNorm` for the spatial norm, representation independence, slice maps and inclusion
  functoriality; §5.1 constructs only the maximal norm and the comparison.
- R04 (sorry'd data `multiplicativeDomain`) — repaired: no `def` with a chosen witness remains;
  `multiplicativeDomain_isClosedStarSubalgebra` (line 173) is an existence theorem.
- R05 (headlines absent) — repaired: `stinespring` (191), `kadison_transitivity` (110),
  `voiculescu_weyl_von_neumann` (326) stated; docstring lines 25–34 name the unstatable headlines
  with the missing carriers.
- R06 (MatrixOrder section) — repaired: the section, its four definitions and the instance override
  are gone; `compression_le_iff_commute` (87) stands outside any override.
- R07 (imports) — repaired: line 5 `import Mathlib` only.
- R08 (blob links), R09 (pull-request numbers, "QF2", process sentences) — repaired: gate `blob=0`,
  `prnum=0`; grep for "QF2", "github.com", "PR #", "archive", "Rieffel" finds nothing.
- R10 (README shape) — repaired: Scope and ownership, Conventions, Exact supplier contracts, How to
  read the build, nine `## Layer k` with 50 `### k.n` subsections, each with `**Checks.**` (3–4
  bullets) and a `*Needs:*` line (50 of 50), `### Examples` and `### Dependencies` per layer.
- R11 (padding) — repaired: `norm_leftMultiplication`, `norm_rightMultiplication`, `IsHereditary`,
  `isClosed_multiplicativeDomain`, `mem_multiplicativeDomain` are gone.
- R12 (C2.3 hypothesis) — repaired: lines 613–615 "If `π(A)` contains a nonzero compact operator
  and `ρ` is irreducible with `ker ρ = ker π`, prove that `ρ` and `π` are unitarily equivalent".
- R13 (mirrors, Rieffel notes) — repaired: Arveson and Haagerup cited by DOI (lines 1948, 1966);
  the Rieffel "main/archive" locators are gone.

## Verified sound

**Gate at 1acff0f.** The worker's gate: every check 0, `build=0`, OK. `lake env lean
TauCetiRoadmap/CStarAlgebras/Suggested.lean` from the worktree: exit 0, nineteen "declaration uses
`sorry`" warnings (lines 53, 60, 69, 78, 87, 110, 117, 139, 152, 159, 165, 173, 191, 209, 231, 261,
293, 326, 347), nothing else. `git diff --stat origin/main...HEAD` outside the folder: empty. The
folder holds `README.md`, `Suggested.lean`, `metadata.toml` only.

**Dependency check** (run as the brief gives it, `--movable`):

```
depcheck: 235 roadmaps, 2067 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The merge-order candidate lists CStarAlgebras at line 6 after
VonNeumannAlgebras (line 5); HilbertModules (line 12) is now below it, consistent with the README's
one-way supply.

**Suppliers resolved at today's heads.** VonNeumannAlgebras, open head dee80881 (pull request
#889; the second open VonNeumannAlgebras folder, #1041 at f1535717, has no V12.J/V13 and is not
the one cited): V0.SeparableFaithful line 321 (separable faithful nondegenerate representation,
`A ≠ 0` and zero branches); V12.J.Maps 3477, V12.J.Frame 3511, V12.J.Scalar 3545, V12.J.Dye 3571;
V13a line 3690 (CP foundations, operator systems, Arveson extension, Tomiyama 3700); V13b.SpatialNorm
line 3744 (spatial norm, C*-property, `‖a⊗b‖ = ‖a‖‖b‖`, representation independence by Takesaki
IV.4.9, slice maps 3760); V13b lines 3826–3836 (injectivity iff semidiscreteness for arbitrary von
Neumann algebras, commuting-representation minimal-norm criterion) and 3962–3964
(commutant-injectivity via V11's standard form); V1 Kaplansky density in strong-star form line
477–478; V2 slice maps 673; V4 countable sum of vector functionals 1134; V5 halving 1348, center-valued
trace 1371, Dixmier averaging 3889. Its consumer statement (lines 64–72, 4208–4211) names
CStarAlgebras as consuming V0–V4, V12.J, V13a, V13b.SpatialNorm and V13b and takes nothing from
it: no cycle. BanachAlgebras on main (a0ad405): A1 line 75, A2 161, A3 407, A4 697, A6 801; its two
mentions of CStarAlgebras (lines 126, 856) are ownership deferrals, not consumption; the open
pull request #1648 revises it in place, so main is the citation target. BanachSpaceTheory on main:
B1 line 41, B2 74, B4 167, B7 410; no mention of CStarAlgebras. OperatorTheory/PolarDecomposition
on main: Part A modulus 115, Part B polar decomposition and partial isometries 292, Part C singular
values 445; OperatorTheory/SelfAdjointSpectralTheory on main: Part B Borel functional calculus and
projection-valued measures 252; neither cites CStarAlgebras.

**Ownership against open pull requests** (the sibling checkouts the brief lists, searched by
object with `roadmaps grep`): Stinespring, Kadison transitivity, quasidiagonality, Choi–Effros,
Voiculescu's theorems, multiplier algebras, the Pedersen ideal, the Haagerup tensor product,
Dauns–Hofmann, Haagerup's Grothendieck inequality, Wittstock, Ruan, open projections and the
maximal tensor norm. Every other roadmap that mentions them cites CStarAlgebras as owner:
CStarClassification #863 (lines 40–44, 958, 1007), FactorRigidity #876 (88, 471), QuantumFoundations
#1771 (24, 53), OperatorKTheory #866 (1182), NoncompactQuantumSymmetry #1015 (97, 3905),
OperatorAlgebraDynamics #1137 (445, 629), ToeplitzOperators on main (24), HilbertModules #861
(203–206 identifies `L_A(A)` with the double-centralizer `M(A)`, consuming it), CategoricalOperatorAlgebras
#888 (88, 154; its "internal Stinespring" at 610 is the categorical object and consumes C1–C5),
NoncommutativeIntegration #864 (1468 cites Haagerup 1985 as a reference only). No second owner
found. `maximal tensor`/`⊗max` occurs in no other roadmap.

**Pinned Mathlib declarations opened** (under `Mathlib/`): `CStarAlgebra.approximateUnit`
(Analysis/CStarAlgebra/ApproximateUnit.lean:214), `Filter.IsIncreasingApproximateUnit` (same file,
line 20, used in PositiveLinearFunctional.lean:48), `DoubleCentralizer` and `𝓜(𝕜, A)`
(Analysis/CStarAlgebra/Multiplier.lean:67, 74), `PositiveContinuousLinearMap` with `→P[R]`
(Topology/Algebra/Module/ContinuousLinearMap/Positive.lean:31, 37), `CompletelyPositiveMap`
(Analysis/CStarAlgebra/CompletelyPositiveMap.lean:50), `CStarMatrix.ofMatrix` (CStarMatrix.lean:54),
`CStarMatrix.map` (69), the square-matrix `PartialOrder` (803), `Unitization.instCStarRing`
(Analysis/CStarAlgebra/Unitization.lean:131), `CStarRing.instRegularNormedAlgebra` (same:60),
`opNorm_mul_flip_apply` (same:34), `Unitization.norm_splitMul_snd_sq` (same:88; no nonunital
norm identity exists at the pin, so §1.2's two statements are not library facts),
`Unitization.starLift` (Algebra/Algebra/Unitization.lean:804), `Unitization.fstHom` (661),
`Unitization.inrNonUnitalAlgHom` (676), `TwoSidedIdeal.comap` (RingTheory/TwoSidedIdeal/Operations.lean:122),
`Module.annihilator` `IsTwoSided` instance (RingTheory/Ideal/Maps.lean:877), `gelfandStarTransform`
(Analysis/CStarAlgebra/GelfandDuality.lean:189), `gelfandTransform_isometry` (141),
`gelfandTransform_bijective` (156), `CFC.sqrt_le_sqrt`
(Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/Order.lean:89, hypothesis `a ≤ b`),
`ContinuousLinearMap.prodMap` (Topology/Algebra/Module/ContinuousLinearMap/PiProd.lean:184),
`WithLp.prodContinuousLinearEquiv` (Analysis/Normed/Lp/ProdLp.lean:556), `IsStarProjection`
(Algebra/Star/StarProjection.lean:26), `Circle` (Analysis/Complex/Circle.lean:53), `lp B ∞`
`NonUnitalNormedRing` (Analysis/Normed/Lp/lpSpace.lean:860–864), `C₀(α, β)` `CStarRing`
(Topology/ContinuousMap/ZeroAtInfty.lean:573), `NonUnitalCStarAlgebra (α →ᵇ A)`
(Analysis/CStarAlgebra/ContinuousMap.lean:27). Absent at the pin, as the docstring says: no C*-tensor
product (no `TensorProduct` under Analysis/CStarAlgebra), no C*-quotient by a closed ideal, no
operator-space or completely bounded carrier, no quasidiagonality, no nuclearity.
`Representation.IsIrreducible` (RepresentationTheory/Irreducible.lean:29) is the categorical notion
for group representations, a different object from the file's `IsIrreducible` on star
representations with closed invariant subspaces. No `ContinuousLinearEquiv.conj` for linear
isometry equivalences exists at the pin, so `conjugate` duplicates nothing.

**Signature check.** The worker's `signatures.md` lists the elaborated types of all 26
declarations; each was compared with its README statement (§1.2, §1.4, §1.3, §1.1, §2.2, §3.2,
§4.1, §4.2, §6.3, §6.1/§7.2, §8.1, §8.3, §8.2, §9.1). The two flagged leads, `directSumOperator` and
`conjugate` without `[CompleteSpace H]`/`[CompleteSpace K]`, are `def`s whose types mention only
`prodMap` and `≃ₗᵢ`, so the dropped binder is not needed; the theorem that uses them
(`voiculescu_weyl_von_neumann`) carries `CompleteSpace` and the three separability instances
explicitly. Changed by the check: nothing.

**One-tactic probe.** A scratch copy with every `sorry` replaced by
`first | rfl | simp | infer_instance | exact?`: all nineteen theorems fail (sixteen "`exact?`
could not close the goal", three "unsolved goals" after `simp`). No declaration is padding by this
test; by reading, none restates a definition, mirrors a Check or computes a value.

**Seeded sample, at the locators.** 1.4: `blackadar` 3603–3614 (II.4.3.1–II.4.3.2, quasicentral
approximate units in the convex hull), 3562–3571 (II.4.2.1, `hAh` dense and `f_ε(h)` approximate
unit), 3576–3579 (II.4.2.3, `φ(h) > 0` for every state), 3580–3588 (II.4.2.4, strictly positive iff
countable approximate unit; separable ⇒ σ-unital). 1.5: no locator (R04); checked by computation
below. 2.2: 4418–4423 (II.6.1.8 irreducible iff scalar commutant), 4455–4476 (II.6.1.12–13 Kadison
with `‖a‖ < ‖T‖ + ε`, self-adjoint and positive variants, and the remark that `‖a‖ ≤ ‖T‖` is
obtainable by a functional-calculus argument, as the README's route does), 4686–4708 (II.6.4.8
pure iff GNS irreducible; II.6.4.9 norm detection). 2.3: 4402–4409 (II.6.1.6 restriction to ideals),
4424–4425 (restriction of an irreducible representation to an ideal is zero or irreducible). 2.8:
13650–13660 (III.5.2.5–7, `M = ω(A)′′`, `M_* ≅ A*`, `M ≅ A**`), 13661–13665 (Arens products),
13668–13675 (III.5.2.9 normal extension), 13687–13694 (III.5.2.11 `A** ≅ J** ⊕ (A/J)**`). 2.9: no
locator (R04); checked by computation. 3.1: Ruan 1988 uncertified; `pisier-gt` 2114–2119 (Theorem
13.6 dual and quotient operator-space structures); `blackadar` 5646–5664 (II.6.9.21–22 matrix
ordered spaces and duals; the Choi–Effros realization is the [CE77a] they reference). 3.2: no
locator for Smith's lemma (R04); `blackadar` 5670–5672 (II.6.9.23 cb norm). 5.2: `blackadar`
8295–8306 (II.9.7.2–3 tensoring CP contractions), 8055–8059 (II.9.4.4 `C₀(X) ⊗ B = C₀(X, B)`,
`C₀(X) ⊗ C₀(Y) = C₀(X × Y)`). 5.3: `pisier-gt` 2317–2324 (Theorem 14.1, Haagerup-norm duality
with states), Blecher–Paulsen and Pisier LNM uncertified. 5.5: `blackadar` 4201–4213 (II.5.5.10
cone and suspension, II.5.5.11 contraction `φ_{1−t}(f)(s) = f(s − t)` for `t < s`, `SC ≅ C₀(ℝ)` not
contractible). 7.1: 8180–8207 (II.9.6.6 exactness, `C*(F₂)` and `L(H)` not exact), 16320–16322
(IV.3.4.2 kernel formulation), 16329–16330 (IV.3.4.3 subalgebras), 16343–16346 (IV.3.4.5 injective
inductive limits; the non-injective case needs IV.3.4.20), 16428–16442 (IV.3.4.16, IV.3.4.18
nuclear embeddability iff exact), 16492–16493 (IV.3.4.21 semisplit extensions), 15992–15996
(IV.3.2.10 approximately semisplit for nuclear quotient, no separability). 8.1: 19264–19268
(V.4.1.4), 19272–19283 (V.4.1.5 (i)–(iv) for separable `H` and `S`), 19285–19296 (V.4.1.6 general
definition by (ii)–(iv)), 19307–19315 (V.4.1.9–10), 19318–19319 (V.4.1.11 quasidiagonal isometry is
unitary), 19327–19330 (V.4.2.1). 8.2: 7571–7577 (II.8.4.29, two faithful nondegenerate
representations with `π(A) ∩ K = ρ(A) ∩ K = 0`, unitary equivalence mod `K` with the `ε`-bound on a
finite set; the absorbing form is derived by applying it to `π` and `π ⊕ ρ` on `H ≅ H ⊕ K`, both
faithful and essential), 19349–19352 (V.4.2.3). 9.2: 7249–7252 (II.8.3.23, `δ` depends on `D` and
`ε` only, "whenever `A` is a C*-algebra"), Dadarlat 1999 uncertified. Also opened for the
headlines: 5461 (II.6.9.7 Stinespring), 5555 (II.6.9.14 Kadison–Schwarz), 15960–15963 (IV.3.2.4
Choi–Effros), 19410–19414 (V.4.2.10–11 homotopy domination, cones), 19463–19468 (V.4.2.14, finite-set
form with finite-dimensional targets), 3634–3638 (II.5.1.1(ii) heredity); `pisier-gt` 1215–1217
(Theorem 7.1), 1872–1874 (12.3, unital), 1898 (12.4), 1904 (12.5), 1921–1926 (Definition 12.6 and the
weak-expectation remark), 1928 (12.7), 1931–1934 (Remark 12.8), 2064–2067 (13.3), 2210–2216
(13.10); `ozawa2004` 125–127 (Theorem 2.2), 307–309 (3.3), 351–353 (3.6), 364 (3.8), 477–478
(Proposition 3.13), 487 (3.14), 552–555 (Corollary 3.17 (i)–(iii)), 1128 (page 27: exact algebras
are locally reflexive, locally reflexive with WEP are nuclear); `stinespring1955` 43–49 (Theorem 1,
unital), 162–163 (Theorem 4); `phillips1940` 363–364 (Lemma 3.3). Every other Blackadar item number
cited in the README (II.5.1.2–3, II.5.2.4–5, II.5.3.2/5/7, II.6.3.1–2, II.6.5.1–7, II.6.5.10–15,
II.6.9.4–5, II.7.3.1, II.7.3.12, II.8.1, II.8.2.5, II.8.3.1–2, II.9.2.1–6, II.9.5.1–2, II.9.6.1/3,
IV.3.1.1–14, IV.3.2.3/5/9/13/16–17, IV.3.3.2/10/12–15, IV.3.4.4/6–13/19–20, V.4.2.4/6/8/11–12) was
located in the text and its heading matches the cited topic.

**Adversarial table** (values computed on each side; rows marked (r1) carry the previous reports'
values for statements the rewrite left mathematically unchanged, re-read at this head).

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| §1.4 quasicentral unit `exists_quasicentral_approximateUnit` | `I = 0`; `A = K(ℓ²)`, `P_n` vs shift `S ∈ B(ℓ²)` | `l = pure 0`: all five clauses hold; `(P_nS − SP_n)e_{n−1} = −e_n`, norm `1` for every `n`, so `P_n` is not quasicentral for `B(ℓ²)` though it is for `K(ℓ²)` | holds; Check correct | none |
| §1.4 strictly positive ⇔ countable approximate unit | `h = 0`; `C₀(X)`, `X` uncountable discrete; `C₀(ℝ)` | `closure(0·A·0) = 0 = A` only for `A = 0`; a countable family of `C₀` functions is supported on a countable set; `e^{−t²} > 0` everywhere | holds | none |
| §1.5 `e_{F,δ} ∈ L`, `‖x − xe‖² ≤ δ/4` | `C[0,1]`, `L = x·C[0,1]`, `F = {x}`; `L = 0` | `e = x²/(δ + x²) = x·(x/(δ+x²)) ∈ L`; `sup_t (δt/(δ+t²))² = δ/4` at `t = √δ`; `f(t) = δ²t/(δ+t)²`, `f′ = 0` at `t = δ`, `f(δ) = δ/4`; `L = 0`: `F = ∅`, `e = 0` | holds | locator (R04) |
| §1.2 `scalar_norm_le_unitizationLeftAction` | `A = C₀((0,1])`, `λ = 1`, `a = −x`; `A = C[0,1]` unital, `a = −1`; `A = 0` | `‖id − L_x‖ = sup_{(0,1]} |1 − t| = 1 = |λ|`; unital: `id − L_1 = 0`, `0 < 1`, so `hA` is needed; `A = 0`: `e = 0` is a unit, `hA` false | holds | none |
| §1.2 route (Neumann series) | `‖id + L_b‖ < 1`, `b = a/λ` | `L_{−b}` invertible; `e := L_{−b}⁻¹(−b)` has `(−b)(ex) = (−b)x` ⇒ `ex = x`; stars give a right unit; `e = ee* = e*` | holds | none |
| §1.2 `unitization_norm_eq_leftAction` | `x = (c, 0)`, `x = (0, a)` | `Unitization.norm_def`: `max(|c|, ‖c·id + L_a‖)`; the first theorem removes the max; `(0,a)`: `‖L_a‖ = ‖a‖` (`CStarRing.instRegularNormedAlgebra`) | holds | none |
| §1.3 nonunital Gelfand adapter Check | `A = C₀((0,1])`; candidate wrong witnesses | `K = [0,1]`, `ε = 0`, `X = (0,1]`; `sign(t − ½) ∉ C(X)`; `1 ∈ C_b(X) ∖ C₀(X)` | adapter holds; witness wrong | R03 |
| §1.3 `Ann(I)` facts | `M₂`, `I = 0`; `ℂ ⊕ ℂ`, `I = ℂ ⊕ 0`; `K(ℓ²)`, `I = A` | `Ann(0) = A`, `Ann(A) = 0`; `Ann = 0 ⊕ ℂ ≠ 0`; `aa* = 0 ⇒ a = 0` so `Ann(A) = 0` | holds | none |
| §1.3 heredity `closed_ideal_isHereditary` | `I = A`; `I = 0`; diagonal `B ⊆ M₂` | trivial; `0 ≤ a ≤ 0 ⇒ a = 0`; `q ≤ 1 ∈ B`, `q ∉ B` so `B` not hereditary; `closure(qM₂q) = ℂq` | holds | none |
| §1.1 `compression_le_iff_commute` | `D = ℂ`; `p = e₁₁`, `T = q`; commuting diagonal `p, T` | both sides true; `pTp = ½e₁₁`, `T − pTp = [[0,½],[½,½]]`, det `−¼`, both sides false; `(1−p)T(1−p) ≥ 0`, both true; forward: `X = T − pTp ≥ 0`, `pXp = 0 ⇒ X^{1/2}p = 0 ⇒ Xp = 0 ⇒ Tp = pTp = pT` | holds | none |
| §1.1 regions | `(½,3)`, `(5/8,5)`, `(1,1)` | `b − a` det `st − 1`; `b − q = [[s−½,−½],[−½,t−½]]`; `(½,3)`: `st = 3/2`, `(0)(5/2) = 0 < ¼`; `(5/8,5)`: `9/16 ≥ ¼`, `b² − q` entry `25/64 − ½ < 0` | holds | none |
| §1.7 strict topology Checks | `tⁿ`, `sin(nt)` on `C₀((0,1])`; `P_n`, `S^n`, `S*^n` on `K(ℓ²)` | `‖tⁿg‖ → 0` for `g ∈ C₀((0,1])`; `sin(nt)` has no uniform limit on `[½,1]`; `‖S^n x‖ = ‖x‖` (no strong limit); `‖S*^n x‖² = Σ_{k≥n}|x_k|² → 0` | first two hold; third has `S`, `S*` swapped | R02 |
| §1.8 `h ↔ φ` | `X = ∅`; `Y = ∅`, `X ≠ ∅`; `h ≡ 0` on `ℝ`; inclusion `(0,1) ⊆ [0,1]` | `C₀(∅) = 0`, zero map nondegenerate, empty map proper; zero map degenerate, no map `X → ∅`; `f ↦ f(0)·1` nondegenerate, image `⊄ C₀`, `h⁻¹{0} = ℝ` not compact; `1|_{(0,1)} ∉ C₀` | holds | none |
| §2.1 extensions | `ℂ·1 ⊆ M₂`; `C(𝕋) ⊆ B(L²(𝕋))`; `δ₀` on `C[0,1] ⊆ M₂(C[0,1])` | trace not pure, vector states pure; Banach limit along `zⁿ` restricts to `∫f`, vanishes on `K`, so non-normal; `⟪ξ, f(0)ξ⟫` pure, `tr f(0)/2` not | holds | none |
| §2.2 irreducible ⇔ scalar commutant (nonzero nondegenerate) | `M₂` on `ℂ²`; `a ↦ a ⊕ a`; `ℂ ⊕ ℂ` diagonal; `H = 0` | commutant `ℂ`; invariant diagonal, commutant `M₂`; commutant diagonal algebra; `B(0) = 0 = ℂ·1`, `IsIrreducible` fails by the nonzero clause | holds | none |
| §2.2 `kadison_transitivity` exact bound | `K(ℓ²)`, `E = span e₀`, `T = 2S`; `E = ⊥`; `T = 0` | `a = 2e₁e₀*`, `‖a‖ = 2 = ‖T‖`, `π(a)e₀ = 2e₁`; `a = 0` | holds | none |
| §2.2 self-adjoint route | `E′ = E + T(E)`, `T₁ = PTP` | `T₁` self-adjoint, `T₁ξ = Tξ` on `E`, `‖T₁‖ ≤ ‖T‖`; `E′` reduces `π(a₁)`, clipping to `[−‖T₁‖,‖T₁‖]` fixes `π(a₁)|_{E′}`; `M₂(A)` on `H ⊕ H` has commutant `ℂ`, block `[[0,T],[T*,0]]` has norm `‖T‖`, corner `(1,2)` norm `≤` block | holds | none |
| §2.2 self-adjoint clause needs `T = T*` | `T = S`, `E = span(e₀,e₁)` | `⟪e₀, ae₁⟫ = ⟪e₀, e₂⟫ = 0` but `⟪ae₀, e₁⟫ = 1` | no self-adjoint interpolant | none |
| §2.3 `ρ ≅ π` from equal kernels | CAR algebra; `K(ℓ²)` with `a ↦ a ⊕ a`; `C(𝕋)` on `L²(𝕋)` | CAR: simple, all kernels `0`, inequivalent irreducibles (hypothesis necessary); amplification not irreducible; `M_f` compact only for `f = 0` | holds with the compact hypothesis | none |
| §2.3 simple ∞-dim unital | `π(A) ∩ K ≠ 0` | `K(H) = π(A) ≅ A` unital ⇒ `dim H < ∞` ⇒ `A` finite-dimensional | holds | none |
| §2.4 pure states of `K(H)` | `H = ℂ²`; `H = 0`; `ω_{ξ_n} → ω_ξ` | Bloch sphere, `tr/2` not pure; no states, no rays; test on `ξξ*`: `|⟪ξ_n,ξ⟫|² → 1` | holds | none |
| §2.4–2.5 `Prim(K(ℓ²)⁺)` | hulls | `hull(0) = {0, K}`, `hull(K) = {K}`, `hull(A) = ∅`: `{0}` open and dense, `{K}` closed; states with `ω(e₀e₀*) > ½` map onto `{0}` | holds | none |
| §2.5 Baire | `A = 0`; `A = C₀(X)` | empty spaces, vacuously Baire; quotient map `= id_X` | holds; general case not claimed, matching II.6.5.14 | none |
| §2.6 `Ann(I) = ⨅_{U_I} P`, `hull(Ann I) = closure(U_I)`, `U_{Ann I} = int(hull I)` | `I = 0`, `I = A`, `A = 0`; `ℂ ⊕ ℂ`, `I = ℂ ⊕ 0`; `K⁺`, `I = K` | `U_0 = ∅`, meet `= A`; `U_A = Prim`, `Ann = 0`; two points: `U_I = {0⊕ℂ}`, `Ann(I) = 0 ⊕ ℂ`, `hull = {0⊕ℂ}`, `U_{Ann I} = {ℂ⊕0} = int(hull I)`; `U_K = {0}` dense, `Ann = 0`, `int{K} = ∅ = U_0` | holds | none |
| §2.7 norm function | `K⁺`, `a = e₀e₀*` | `‖a + 0‖ = 1`, `‖a + K‖ = 0`; `{‖a+P‖ > c}` = `{0}` open for `c < 1`; `{‖a+P‖ < ½} = {K}` not open | lsc, not continuous | none |
| §2.8 biduals | `c₀`; `K(ℓ²)`; `C[0,1]`, `I = ker δ₀` | `ℓ^∞`/`ℓ¹`; `B(ℓ²)`/`S₁`; `A** = I** ⊕ ℂ`, `ℂ = (A/I)**` | holds | none |
| §2.9 open projections | `K(ℓ²)`; `C[0,1]`, `a = x`; `C₀(X)` | `pP_np ↑ p` strongly, so every projection open; central: `0, 1`; support of `x` = `χ_{(0,1]}` = support of `{f : f(0) = 0}`, `x` not strictly positive; `χ_U` for open `U` | holds | locator (R04) |
| (r1) §2.10 matrix fields | `K = ∅, {0}, [0,1]`; diagonal `K = {0}`, `{0} ∪ [½,1]`; `S = {1/n}`, `S = {½}` | `I_∅ = A`, `I_{[0,1]} = 0`; two extra ideals `0^±` when `0` isolated, none for `[0,½]`; hull of `I_{S ∪ {0}}` is `S ∪ {0⁺,0⁻}`, hull of `I_{{½}}` is `{½}`; `{0⁺} ∪ (0,ε)` open with complement `hull{f : f|_{[ε,1]} = 0, f(0) ∈ ℂe₁₁}` | holds | none |
| (r1) §2.10 centers | four `D` | `C[0,1]·I₂` for full, diagonal, scalar; corner: `h(0) ≠ 0` forces `h(0)I₂ ∉ ℂe₁₁`, so `C₀((0,1])` | holds | none |
| §3.1 Ruan axioms | entrywise sup norm, `x = J_n`, `α = (1,…,1)/√n`; level `0` | `αxβ = n > 1 = ‖α‖‖x‖‖β‖`; `max(‖x‖, 0) = ‖x‖` | non-example and convention hold | none |
| §3.2 cb norm, `IsCompletelyBounded` | transpose on `M_n`; `u : E → ℂ`; `CB(ℂ,F)` | flip unitary `↦ Σ E_ij ⊗ E_ij = nP`, cb norm `n`, norm `1`; Smith `n = 1`; `‖u‖_cb = ‖u(1)‖` by the Ruan axioms | holds | locator (R04) |
| §3.3 `R_n → C_n` | `[e_i*]_i ∈ M_{n,1}(R_n)` | identity matrix, norm `1`; image column of `n` unit entries, norm `√n` | cb norm `≥ √n` | none |
| §4.1 `completelyPositive_matrix_bound`, `schwarz`, `multiplicativeDomain_iff` | `n = 0`; `φ = id`; compression `a ↦ pap`; `tr/n`; transpose on `M₂`, `a = E₁₂`; diagonal expectation, `a = E₁₂` | `0 ≤ 0`; `‖x‖ ≤ ‖1‖‖x‖`; `φ(a*a) − φ(a)*φ(a) = ((1−p)ap)*((1−p)ap)`, both equalities ⇔ `ap = pa`; equality in Cauchy–Schwarz ⇔ scalar; `φ(a)*φ(a) = E₁₁ ≰ E₂₂ = φ(a*a)` (transpose is not CP, so no contradiction); `E(a*a) = E₂₂ ≠ 0 = E(a)*E(a)` and `E(ab) ≠ E(a)E(b)` for `b = E₂₁`, both sides false | holds | none |
| §4.1 Stinespring route to the domain | `V` isometry | `φ(a*a) − φ(a)*φ(a) = V*π(a)*(1 − VV*)π(a)V`; vanishing ⇒ `π(a)V = VV*π(a)V` ⇒ `φ(ba) = φ(b)φ(a)` | holds | none |
| §4.2 `stinespring` | `φ` a state; `φ = id_{B(H)}`; `H = 0`; `D = 0` | GNS triple, `‖V‖² = ω(1)`; `(H, id, 1)` minimal, `(H⊕H, id⊕id, ξ ↦ (ξ,0))` not; `K = 0`, `V = 0`, `0 = ‖φ 1‖`; `φ(1) = 0 ⇒ V = 0`, `K = 0` | holds | none |
| §4.2 `cp_radonNikodym` | `ψ = φ`; `ψ = 0`; `φ = id_{B(H)}` | `T = 1`; `T = 0`, unique since `⟪π(a)Vξ, Tπ(b)Vη⟫ = ⟪ξ, ψ(a*b)η⟫` on a dense span; `π(A)′ = ℂ`, `[0,φ] = {t·id}` | holds | none |
| §4.3 Choi | transpose; identity; `tr(·)1/n` | flip with eigenvalue `−1`; `Σ E_ij ⊗ E_ij = nP`, rank `1`; `(1/n)1 ⊗ 1`, rank `n²`, Kraus `E_ij/√n`: `(1/n)Σ_{ij} E_ji a E_ij = (1/n)Σ_{ij} a_ii E_jj = tr(a)1/n` | holds | none |
| §4.4 similarity Check | `S = diag(1,2)`, `a = E₁₂` | `S⁻¹E₁₂S = 2E₁₂`, so `‖ρ_S‖ ≥ 2 = ‖S‖‖S⁻¹‖ ≥ ‖ρ_S‖_cb` | holds | none |
| §5.1 Checks | `M_n ⊙ A`; `C(X) ⊙ C(Y)`; `C*(F₂) ⊙ C*(F₂)` | unique norm (II.9.4.2); `f ⊗ g ↦ ‖f‖‖g‖`; II.9.4.6(iii): the `(λ∘π, ρ∘π)` representation of `C*(F₂) ⊙ C*(F₂)` is min-continuous; two norms only for (i) `C*_r(F₂) ⊙ C*_r(F₂)` and (ii) `C*(F₂) ⊙ C*_r(F₂)` | third Check unsupported and contradicts line 1554 | R01 |
| §5.2 `‖φ ⊗ ψ‖ = ‖φ‖‖ψ‖` | states; `δ_x − δ_y`; `ψ = 0` | `1 = 1·1`; `‖φ‖ = 2`, `φ ⊗ φ` has norm `4` at the `(1,−1,−1,1)` function; `‖φ‖·0 = 0` | holds | none |
| §5.3 three norms | `z = Σ e_i ⊗ e_i* ∈ C_n ⊗ R_n`; `z′ ∈ R_n ⊗ C_n`; `E = ℂ` | `‖z‖_h = ‖1_{M_n}‖ = 1 = ‖z‖_min`, `‖z‖_∧ = tr 1 = n`; `‖z′‖_h = n`, `z′z′* = Σ_i E₁₁ ⊗ E_ii = E₁₁ ⊗ 1`, `‖z′‖_min = 1`; all products return `F` | holds, not symmetric | none |
| §5.4 Checks | `∏M_n/⊕M_n`; CAR; `C*(F_∞)` | `(1_n)` unit, `(a_n/n)` quotient norm `0`; simple (II.8.2.5); countably generated | holds | none |
| §5.5 cones and mapping cones | `φ_t`; `C_{id}`, `C_0`; section | `φ_1 = 0`, `φ_0 = id`, `φ_t(f)(s) → 0` as `s → t⁺`; `C_id ≅ C₀((0,1],A)`, `C_0 = A ⊕ SB`; `(a,tφ(a))² = (a², t²φ(a²)) ≠ (a², tφ(a²))` | holds | none |
| §6.1 `IsNuclearContraction` | `n = 0`; `B(ℓ²)`; `⊕M_{n_i}` | zero map through `M_0`; not nuclear (IV.3.4.4), compressions are; exact factorization through `M_N` | holds | none |
| §6.3 `haagerup_grothendieck` | `u(a,b) = ω(ab)`; `u = 0`; zero algebra | `|ω(ab)| ≤ ω(aa*)^{1/2}ω(b*b)^{1/2}`, `‖u‖ = 1`, `f₂ = g₁ = ω`; any states; no `f` with `f(1) = 1`, excluded by `Nontrivial` | holds | none |
| §6.3 normal diagonals | `ℂ`; `M_n`; `M = 0` | `N = 1`; `(1/n)Σ_{ij} ω(E_ijE_ji) = (1/n)·n·Σ_i ω(E_ii) = ω(1)`; zero | holds | none |
| §7.2 `choi_effros_lifting` and Phillips | `ℓ^∞/c₀`; `n = 1`; `μ_n = δ_n`; `μ_n(E) = (P1_E)_n` | `ψ∘q` idempotent with kernel `c₀`, `1 − ψ∘q` a projection onto `c₀`, contradiction (separability needed, not nuclearity); `λ ↦ λb` lifts by positive contractive lifts; `δ_n(ℕ) = 1` fails the hypothesis; `P1_E ∈ c₀` ⇒ `μ_n(E) → 0`, `μ_n({k}) = δ_{nk}`, `Σ_k = 1 ↛ 0` | holds | none |
| §7.3–7.4 WEP/LLP Checks | `B(ℓ²)`; nuclear `A`; `C*(F_∞)` | WEP by identity, not LLP (Remark 12.8 and Corollary 3.17(i)); min = max in both roles; LP (Theorem 3.8); QWEP status is Problem 12.9 | holds; consistency with §5.1 | R01 |
| §8.1 `IsQuasidiagonalSet` | compact sets; `S`; `S ⊕ S*`; `H = 0`; `∅`, `{0}` | `P_n` almost commutes with compacts; quasidiagonal isometry is unitary, `S*S = 1 ≠ SS*`; `S ⊕ S* = W − e₀e_{−1}*`, rank one from the bilateral shift; `P = 0`; definition without the vector clause is satisfied by `P = 0` | holds | none |
| §8.2 `voiculescu_weyl_von_neumann` | `A = ℂ`; `K(ℓ²)⁺` with `π = ρ`; `H = 0` | difference `0` for any unitary; `e₀e₀*` of rank `1` vs rank `2`, distance `≥ 1`, so essential hypothesis needed; `H = 0 ⇒ π(1) = 0 ⇒ D = 0 ⇒ K = 0`, `U` trivial | holds | none |
| §8.3 `isQuasidiagonal_iff_exists_matrix_maps` | `C(𝕋)` roots of unity; compressions `P_nM_fP_n`; `A = 0`; Toeplitz | star homomorphisms, `max_k|f(ζ_k)| → ‖f‖`; `S_nS_n* − 1 = −e₀e₀*`, norm `1` for all `n`; `k_n = 0`, zero maps, `φ n 1 = 1` in `M_0`; non-unitary isometry ⇒ not finite ⇒ not qd | holds | none |
| §8.4 Toeplitz | `S` | `S*S = 1`, `SS* = 1 − e₀e₀*`, `[S*,S] = e₀e₀*`; `Se_n = e_{n+1}` matches `z·zⁿ` | holds | none |
| §9.1 `isQuasidiagonal_of_homotopy` | `B = 0`; `CA`; cone over `K(ℓ²)` | `β∘α = 0 ≃ id` ⇒ contractible ⇒ qd; `CA` qd (V.4.2.11); quotients `C₀(closed) ⊗ K` have no finite-dimensional representations ⇒ not RFD | holds | none |
| §9.2 matrix-unit stability | one `1×1` block; `‖p − q‖ < 1`; `p = e₁₁`, `q = e₂₂` | cutoff of `Re e` at `½`, `δ(ε)` uniform; `‖u − 1‖ ≤ √2‖p − q‖`; any `u` with `ue₁₁u* = e₂₂` has `‖(u − 1)e₁‖ = √2`, so no unitary near `1` | holds | none |
| §9.3 admissibility | `A = ℂ`; `σ ⊕ τ`; unitized cone of `ℂ` | both representations of `ℂ` on infinite-dimensional separable spaces; `(σ⊕τ)^{(∞)} = σ^{(∞)} ⊕ τ^{(∞)}` absorbed by §8.2; `C[0,1]`, `f((1−t)T₀ + tT₁)` | holds | locator (R04) |
| §9.4 subquotient route | `C*(F₂)`; `A = ℂ`; section | not exact, so not a subquotient of AF; `C₀((0,1]) ⊆ C[0,1] ⊆ C(Cantor)`; non-multiplicative CP section | holds | locator (R05) |
| §9.6 `D_I(B)` | `B = K(ℓ²)`, `T_n = e₀e_n*`; `B = ℂ`; `B = 0` | `T_nξ = ξ_ne₀ → 0`, `T_n*e₀ = e_n` no limit, so bounded strongly convergent families are not star-closed; `D_I(ℂ)/ker q ≅ ℂ`; zero | holds | none |
| §9.7 quotients | Calkin algebra; `A → A/J → A/J → ⋯`; `C(X) → C(K)` | contains `C*(F₂)`, not exact, direction consistent; limit `A/J`; Dugundji extension gives local splittings | holds | none |

## Not verifiable

- Ruan 1988 Theorem 3.1, Blecher–Paulsen 1991 (including the attribution to it of "the identity
  `MIN(E) → MAX(E)` is not completely bounded for infinite-dimensional `E`", §3.3 line 955, which
  may be Paulsen's 1992 paper), Wittstock 1981, Paulsen 1984, Arveson 1969 Theorem 1.4.2, Haagerup
  1985 Theorem 1.1 (its statement was checked through `pisier-gt` Theorem 7.1 instead), Haagerup
  1983 §§2–3, Choi 1975 Theorem 2, Kirchberg 1993, Dadarlat 1999, Runde Chapter 6, Takesaki I
  Chapter III §2, Pisier LNM 1618 Chapter 5, Connes 1978, Lance 1973, Effros–Lance 1977: settled
  as uncertified in the manifest; cited by locator, texts not read.
- Blackadar: read from the author's own corrected copy (bruceblackadar.com, the cached text), so
  every Blackadar locator above is verified against that copy; item numbers, not pages, are cited.

## Source issues

- none
