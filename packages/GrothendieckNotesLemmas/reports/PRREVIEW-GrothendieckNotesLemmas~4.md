# Review of GrothendieckNotesLemmas (pull request #1431 at 30d3e77)

**Verdict:** accepted

No P1 or P2 finding. The gate passes on every check, the dependency check reports no edge and no
problem, `Suggested.lean` elaborates with `sorry` as its only warning, no declaration closes under
the one-tactic probe, and every statement survived the adversarial pass below. Four P3 notes.

## R01 (P3) — Nineteen targets carry no source locator

**Location.** `TauCetiRoadmap/GrothendieckNotesLemmas/README.md`, targets 1.3, 1.4, 1.5, 1.6, 1.7,
2.3, 2.4, 2.6, 2.8, 2.9, 2.10, 3.1, 3.2, 4.1, 4.2, 5.1, 5.2, 5.3, 5.6.

**Claim.** Every theorem carries a locator; a standard fact may cite a standard textbook. These
nineteen targets name only Mathlib declarations in their `*Needs:*` lines and give no source for
the statement itself (1.1, 1.2, 2.1, 2.2, 2.5, 2.7, 5.4 and 5.5 do).

**Witness.** Target 4.2 reads "Prove `NoetherianSpace.isOpen_of_stableUnderGeneralization`: in a
Noetherian quasi-sober space … Route: Noetherian induction …" and cites nothing; the same shape at
2.3, 2.9, 2.10, 5.2.

**Repair.** Add one locator per target. Candidates that the reviewer checked or that are standard:
2.3 and 2.10 are in the Stacks Project algebra chapter (the lemma that finite modules over a
Noetherian ring are finitely presented, and the lemma on associated primes of `M ⁄ 𝔭M` for `M`
flat over `R → S`; cite them by tag); 4.2 is EGA IV₁ §1.10 (the openness criterion for sets stable
under generalisation in a Noetherian space); 2.9 is Lam, *Lectures on modules and rings*, §3
(injective modules over principal ideal domains); 5.2 and 5.3 any standard linear-algebra text
(Cauchy–Binet; Lagrange's identity). Where the statement is the author's own generalisation (4.1
with `R1Space`, 5.1, 5.5 over a ring), say so and cite the classical case (Engelking, *General
topology*, §3.4 for the exponential law; Avron–Seiler–Simon for 5.5 is already there).

## R02 (P3) — Process narrative in Downstream consumers

**Location.** `README.md` lines 666–667: "No roadmap on main names this one (`git grep -w
GrothendieckNotesLemmas` on main and on the heads of the open roadmap pull requests)."

**Claim.** The README is timeless; a description of a search the author ran is process narrative.

**Witness.** The sentence names a tool invocation and "the heads of the open roadmap pull
requests", which a reader a year from now cannot re-run.

**Repair.** Delete the parenthesis and the sentence; keep "PCurvature (Layers 1.1 and 1.4)
consumes 3.2: …". (PCurvature's README, §Suppliers table row "Commutator of a derivation with
multiplication; conjugation by a unit", cites GrothendieckNotesLemmas §3.2 with exactly these two
names; the citation resolves.)

## R03 (P3) — Route of 1.1 names a lemma that does not apply

**Location.** `README.md` lines 132–135: "the forward direction is `Nat.Prime.dvd_choose_pow`
applied to the base-`p` digits".

**Claim.** `Nat.Prime.dvd_choose_pow` (Mathlib `Data/Nat/Multiplicity.lean` line 253) states
`p ∣ (p ^ n).choose k` for `k ≠ 0`, `k ≠ p ^ n`: it is about the binomial coefficients of a prime
power, not of a multiple `n` of `p ^ e`.

**Witness.** `n = 6`, `p = 2`, `e = 1`, `k = 1`: the target needs `2 ∣ 6.choose 1 = 6`; no
instance of `(2 ^ m).choose k` is involved.

**Repair.** Both directions are Lucas's theorem: for `0 < k < p ^ e` some base-`p` digit `k_i`
with `i < e` is nonzero while the digit `n_i` is `0` when `p ^ e ∣ n`, so the factor
`n_i.choose k_i = 0` kills the product (Mathlib `Choose.choose_modEq_prod_range_choose`). Replace
the lemma name, or cite Kummer's theorem on `v_p (n.choose k)`.

## R04 (P3) — Supplier-name nits and an unused import

**Location.** `README.md` lines 93 and 420 (`quotTensorEquivQuotSMul`), line 401 (`Module.Baer.of_divisible`);
`Suggested.lean` line 4.

**Claim and witness.** (a) The Mathlib declaration is `TensorProduct.quotTensorEquivQuotSMul`
(`LinearAlgebra/TensorProduct/Quotient.lean` line 153); the README writes it without its
namespace. (b) `Module.Baer.of_divisible` lives in `Algebra/Category/Grp/Injective.lean` line 35
and asks `[DivisibleBy A ℤ]`, as the README says; no change needed there. (c) `Suggested.lean`
imports `TauCeti.RingTheory.Flat.Pi`, but no statement in the file uses `Module.Flat.pi` (the
instance is only a route for one direction of `Module.Flat.pi_iff`); the import rule asks for the
modules actually used.

**Repair.** Write `TensorProduct.quotTensorEquivQuotSMul`; drop the Tau Ceti import line (the file
elaborates without it, every carrier being Mathlib's) or keep it if a later edit states something
with the instance.

## Verified sound

**Gate and build.** The worker's gate at 30d3e77 passes every check (`depcheck=0`, `build=0`,
`sorry-data=0`, `set_option=0`, `stray-files=0`, `outside-folder=0`). `git diff --stat
origin/main...HEAD` outside the roadmap folder is empty. `lake env lean` on `Suggested.lean` from
the pull-request worktree: 38 `declaration uses sorry` warnings, nothing else (6 s, oleans
present). The dependency check with `--movable` on the candidate merge order: `depcheck: 205
roadmaps, 1652 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line (the roadmap is listed at
position 374 and consumes no roadmap).

**Pins.** Mathlib `f6090c70`, Tau Ceti `358314d4` (the worktree's `lake-manifest.json`; the
packages directory's checkouts agree).

**Signatures.** The worker's `#check @name` listing of all 39 declarations was compared with the
README statement of each target; none lost a section binder, and every hypothesis the README
states (`[Fact p.Prime] [CharP R p]`, `[Finite ι]`, `[Module.FinitePresentation R M]`,
`[IsNoetherianRing A] [Small.{v} A]`, `[IsDomain R] [IsPrincipalIdealRing R] [Small.{v} R]`,
`[p.IsPrime]`, `[Module.Flat A F]`, `[IsScalarTower A B F]`, `[R1Space X]`,
`[LocallyCompactSpace Y]`, `[NoetherianSpace α] [QuasiSober α]`, `[Finite M]`, `[Fintype ι]
[LinearOrder ι]`, `IsIdempotentElem`) is in the Lean type.

**One-tactic probe.** A copy of the file with every `sorry` replaced by `first | rfl | simp |
infer_instance | ring | exact?` was elaborated from the worktree (1 min 46 s): all 38 theorems
fail (37 with "unsolved goals" or "`exact?` could not close the goal", 2.10
`comap_eq_of_flat` by heartbeat timeout inside `exact?`). Nothing is padding; the only `def`
(`Polynomial.intValued`) has a real body on `Subalgebra ℤ ℚ[X]`.

**Library declarations opened at the pin** (file, line):
`Choose.choose_modEq_choose_mod_mul_choose_div` and `choose_modEq_prod_range_choose`
(`Data/Nat/Choose/Lucas.lean` 38, 99); `Nat.Prime.dvd_choose_pow` (`Data/Nat/Multiplicity.lean`
253); `Nat.add_choose_eq` (`Data/Nat/Choose/Vandermonde.lean` 30); `Polynomial.hasseDeriv_mul`
(`Algebra/Polynomial/HasseDeriv.lean` 211; no `expand` or `CharP` statement anywhere in files
mentioning `hasseDeriv`); `Polynomial.isCoprime_X_sub_C_of_isUnit_sub`
(`Algebra/Polynomial/RingDivision.lean` 293; no `iff` form at the pin);
`Commute.commutatorElement_pow_left` (`GroupTheory/Commutator/Basic.lean` 87);
`Module.Flat.directSum_iff` (`RingTheory/Flat/Basic.lean` 207; no `pi` or `prod` flatness
statement in `RingTheory/Flat/`); Tau Ceti `Module.Flat.pi` (`TauCeti/RingTheory/Flat/Pi.lean`
62, `[CommSemiring R] [Finite ι]`, as cited); `TensorProduct.piRightHom`
(`LinearAlgebra/TensorProduct/Pi.lean` 56; no bijectivity statement for finitely presented
modules at the pin, `piRight` is for finite `ι`); `Module.finitePresentation_iff_finite`
(`Algebra/Module/FinitePresentation.lean` 123, one direction only, under `IsNoetherianRing`);
`TensorProduct.equivFinsuppOfBasisRight` (`LinearAlgebra/TensorProduct/Basis.lean` 87);
`Ideal.primaryComponent` (`Algebra/Module/Torsion/PrimaryComponent.lean` 48: `⨆ i, torsionBySet
A M (I ^ i)`); `Module.Baer` (`Algebra/Module/Injective.lean` 70), `Module.Baer.injective` (401,
no `Small`), `Module.Baer.of_injective` (406, `[Small.{v} R]`), `Module.Baer.of_divisible`
(`Algebra/Category/Grp/Injective.lean` 35, over `ℤ` with `DivisibleBy A ℤ`);
`IsAdicComplete.bot` and `of_subsingleton` (`RingTheory/AdicCompletion/Basic.lean` 871, 876; no
nilpotent-ideal statement); `KaehlerDifferential.exact_mapBaseChange_map`
(`RingTheory/Kaehler/Basic.lean` 781); `Algebra.H1Cotangent.exact_δ_mapBaseChange`
(`RingTheory/Kaehler/JacobiZariski.lean` 552); `Algebra.FormallySmooth` as the class with fields
`projective_kaehlerDifferential` and `subsingleton_h1Cotangent` (`RingTheory/Smooth/Basic.lean`
70–71), so formal smoothness gives both hypotheses of 2.7; `Submodule.IsAssociatedPrime`
(`RingTheory/Ideal/AssociatedPrime/Basic.lean` 58: prime and `I = (N.colon {x}).radical`, no
Noetherian hypothesis, as the Conventions say); `TensorProduct.quotTensorEquivQuotSMul`
(`LinearAlgebra/TensorProduct/Quotient.lean` 153); `Derivation.leibniz_pow` and `leibniz_zpow`
(`RingTheory/Derivation/Basic.lean` 139, 508, the latter in `section Field`); the Lie bracket on
`Derivation R A A` and `commutator_coe_linear_map` (`RingTheory/Derivation/Lie.lean` 44; no
commutator with `mulLeft`); `ContinuousMap.continuous_of_continuous_uncurry` (no hypothesis),
`continuous_curry` (`[LocallyCompactSpace (X × Y)]`), `uncurry` (`[LocallyCompactSpace Y]`),
`continuous_uncurry` (both locally compact) and `Homeomorph.curry` (both locally compact)
(`Topology/CompactOpen.lean` 440, 450, 466, 471, 556);
`PrimeSpectrum.isOpen_of_stableUnderGeneralization_of_isConstructible`
(`RingTheory/Spectrum/Prime/ConstructibleSet.lean` 167, prime spectra and constructible sets
only); `Set.powersetCard` (`Data/Set/PowersetCard.lean` 31, the finsets of card `n`) and
`Set.powersetCard.ofFinEmbEquiv` (`Order/Hom/PowersetCard.lean` 38, `(Fin n ↪o I) ≃ powersetCard
I n`, inverse `Finset.orderEmbOfFin`, so the subsets are listed increasingly as 5.2 says);
`Finset.sum_mul_sq_le_sq_mul_sq` (`Algebra/Order/BigOperators/Ring/Finset.lean` 171); the
`BinomialRing` instance for `ℚ≥0`-modules (`RingTheory/Binomial.lean` 276), which is what gives
`Ring.choose (X : ℚ[X]) n` its meaning `X (X − 1) ⋯ (X − n + 1) ⁄ n!`; `PadicInt.mahlerEquiv`
(`NumberTheory/Padics/MahlerBasis.lean` 356); `Algebra.GrothendieckGroup` as `Localization ⊤`
with `of`, `inv_mk`, `mk_div_mk`, `lift` (`GroupTheory/MonoidLocalization/GrothendieckGroup.lean`
36–88; no common-denominator statement); `Submonoid.LocalizationMap.surj` and `eq_iff_exists`
(`GroupTheory/MonoidLocalization/Basic.lean` 437, 460); Tau Ceti `TauCeti.Units.coe_inv_mem_adjoin`
(`TauCeti/RingTheory/Adjoin/Unit.lean` 38, `[IsArtinianRing K]`, as Scope says). No Mathlib
file mentions a symmetric Pascal determinant, integer-valued polynomials as a subalgebra, or the
trace of odd powers of a difference of idempotents.

**Duplication by object.** None found: each target either generalises a pinned statement named
in its `*Needs:*` line (1.4 ← `hasseDeriv_mul`; 1.5 ← `isCoprime_X_sub_C_of_isUnit_sub`; 2.1 ←
Tau Ceti `Flat.pi`; 2.3 ← `finitePresentation_iff_finite`; 2.9 ← `Baer.of_divisible`; 3.1 ←
`leibniz_zpow`; 4.1 ← `continuous_curry`/`Homeomorph.curry`; 4.2 ←
`isOpen_of_stableUnderGeneralization_of_isConstructible`) or has no counterpart at the pins. The
roadmaps named in Scope were opened: AlgebraicKTheory §4.2 (open head, "Semilocal rings and Bass's
bound", stable range one for semilocal rings) owns what 2.* leaves out; OperatorTheory/Majorization
on main has MAJ-A26–MAJ-A29 (Ky Fan sums and inequalities); HomotopyTheoryOfCategories (open head)
Layer 0 items 0.1–0.3 and item 8.4 (semi-simplex category) exist and its suppliers table lists
GrothendieckNotesLemmas as a client of exactly those; DerivedModuleAlgebra on main has §§0.4,
0.7, 0.8 (cotangent complex and its low-degree terms). `roadmaps grep GrothendieckNotesLemmas`
finds the two citations (HomotopyTheoryOfCategories, PCurvature) and nothing else; ownership
against the open pull requests was checked through that index.

**Sources.** Stacks algebra chapter (cache `b035a1f0`): Proposition 89.3, Tag 059K, line 9878,
printed page 210, the four equivalent conditions with (1) ⇒ (2) proved by a presentation and a
diagram chase, as 2.2 says; Lemma 138.9, Tag 031K, line 17350, printed page 370: for `A → B → C`
with `B → C` formally smooth the sequence `0 → Ω_{B/A} ⊗_B C → Ω_{C/A} → Ω_{C/B} → 0` is split
exact, as 2.7 says (the roadmap's hypotheses are the two fields of Mathlib's `FormallySmooth`,
which is the weaker form the proof uses). Stacks dualizing-complexes chapter (fetched,
cache `f69eee17`): Lemma 3.9, Tag 08XW, line 177, printed page 5, part (2): for `R` Noetherian
and `I` injective, the `J`-power torsion submodule is injective, as 2.5 says (Stacks proves it
through essential extensions; the roadmap's Baer route is its own). Chase 1960 (fetched from the
AMS open archive, cache `1ce8c513`): Theorem 2.1, line 139, printed page 460: products of flat
right modules are flat iff every finitely generated left ideal is finitely related, as 2.1's
Check says for a commutative ring. Lucas's theorem is verified against Mathlib's
`Data/Nat/Choose/Lucas.lean` instead of the 1878 paper (see Not verifiable). Avron–Seiler–Simon,
Pólya and Cahen–Chabert: see Not verifiable; the statements 5.4 and 5.5 cite them for were
recomputed below.

**Adversarial table.** One row per statement; values on both sides.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `p ^ e ∣ n ↔ ∀ 0<k<p^e, p ∣ n.choose k` | n=0; e=0; p=2,n=6,e=1 and e=2; p=5,n=10; n=p^e | n=0: both sides true (0.choose k=0). e=0: `1 ∣ n`, RHS vacuous. (2,6,1): 2∣6, C(6,1)=6 even. (2,6,2): 4∤6, C(6,2)=15 odd. (5,10,1): 10,45,120,210 ≡ 0 mod 5. Converse: j=v_p(n)<e, k=p^j: Lucas gives C(n,p^j) ≡ n_j ≢ 0 | true | none |
| 1.2 `(p^a−1).choose k ≡ (−1)^k [ZMOD p]`, k ≤ p^a−1 | a=0; p=3,a=1; p=2,a=2; p=3,k=4 (excluded) | a=0: C(0,0)=1≡1. (3,1): 1,2,1 ≡ 1,−1,1. (2,2): 1,3,3,1 all ≡ 1 ≡ (−1)^k mod 2. Digits all p−1 and C(p−1,j)≡(−1)^j; parity of k ≡ Σk_i for odd p | true | none |
| 1.3 kernel of `hasseDeriv k`, 0<k<p^e, = image of `expand (p^e)` | ZMod 3: X^3 (e=1), X^4; e=0; char 0 | coeff of hasseDeriv k f at n−k is C(n,k)·f_n; C(n,k) prime to p is a unit in a `CharP R p` ring (R nontrivial since p prime); X^3: 3X², 3X = 0, X^3 = expand 3 X; X^4: 4X³ = X³ ≠ 0; e=0: expand 1 g = g. Over ℚ: 3X² ≠ 0 | true | none |
| 1.4 `hasseDeriv k (expand f * g) = expand f * hasseDeriv k g`, k<p^e | ZMod 2: f=g=X, k=1; k=2 (excluded); k=0 | Leibniz: Σ_{i+j=k} D_i(expand f) D_j g, D_i(expand f)=0 for 0<i≤k by 1.3; LHS hasseDeriv 1 (X³)=X², RHS X²·1; k=2: hasseDeriv 2 (X²)=1 vs X²·0=0; k=0: identity | true | none |
| 1.5 `IsCoprime (X − C a) q ↔ IsUnit (q.eval a)` | ℤ, a=1, q=X+1; a=0, q=X+1; zero ring | ⇒: evaluate Bézout at a: v(a)q(a)=1. ⇐: q = c + (X−C a)h, c unit: c⁻¹q − c⁻¹h(X−C a)=1. q.eval 1 = 2 non-unit and ℤ[X]/(X−1,X+1) ≅ ℤ/2; q.eval 0 = 1, (X+1)−X=1. Zero ring: both true | true | none |
| 1.6 symmetric Pascal determinant = 1 | n=0,2,3; shifted index | n=0: 1. n=2: 1·2−1·1=1. n=3: 1(12−9)−1(6−3)+1(3−2)=1. Vandermonde: Σ_k C(i,k)C(j,k)=C(i+j,i), L unitriangular. Shift 1..2: 12−9=3 | true | none |
| 1.7 `(uv)^n = u^n v^n ⁅v,u⁆^{C(n,2)}` | n=0,1,2,3; Heisenberg; S₃; Q₈ | vu = d·uv with d=⁅v,u⁆=vuv⁻¹u⁻¹. n=2: u(vu)v = d u²v², C(2,2)=1. n=3: v²u = d²uv², total d³, C(3,2)=3. Heisenberg corners: (uv)²→3, u²v²→4, d→−1, 3=4−1; n=3: 6=9−3. S₃ (12),(23): d a 3-cycle, (uv)²=d⁻¹≠d. Q₈: d=−1, (ij)²=−1≠1=i²j² (p=2 excluded) | true | none |
| 1.7 prime form, p odd, d^p=1 | p=3 | p ∣ C(p,2)=p(p−1)/2 for odd p, so d^{C(p,2)}=1 | true | none |
| 2.1 `Flat (Π M i) ↔ ∀ i, Flat (M i)`, ι finite; `Flat (M × N) ↔ …` | ι=∅; ℤ×ℤ/2 over ℤ; ι infinite | ι=∅: zero module flat, RHS vacuous. ℤ/2: 2· injective on ℤ, zero on ℤ/2⊗ℤ=ℤ/2, so not flat and the product not flat. Converse of ⇐ via `directSum_iff` + `of_linearEquiv` (Π ≅ ⨁ for finite ι). Infinite ι: Chase Thm 2.1, fails over non-coherent rings | true | none |
| 2.2 `piRightHom` bijective for `M` finitely presented | M=R; ι finite; M=ℚ over ℤ, P n=ℤ/2^n | M=R: both Π P i. ι finite: `piRight` equivalence. ℚ: Π(ℚ⊗ℤ/2^n)=0, ℚ⊗Πℤ/2^n ≠ 0 since (1,1,…) has infinite order | true (Stacks 059K (1)⇒(2)) | none |
| 2.3 Noetherian ↔ every f.g. module in Type v f.p., `Small.{v} R` | ℤ; k[x₁,x₂,…]; R noncommutative | ℤ: f.g. abelian groups presented by a diagonal matrix. k[x_i]: R/(x_i) ≅ k f.g., kernel (x₁,x₂,…) not f.g. ⇐: `Shrink (R ⧸ I)` lies in Type v, f.p. forces I f.g.; left ideals/left modules match `IsNoetherianRing` (left) | true | none |
| 2.4 range of `f.rTensor N` in basis coordinates | ℤ, f=2·, N=ℤ²; f surjective; f=0 | Under `equivFinsuppOfBasisRight`, f.rTensor N = `Finsupp.mapRange f`; (2,4) in range, (2,3) not; f surj: all; f=0: only 0 (0 ∈ range f gives the finitely-many-nonzero direction) | true over CommSemiring | none |
| 2.5 `I.primaryComponent Q` injective, A Noetherian, Q injective | ℤ, ℚ/ℤ, I=(p); Q=ℚ; I=0; I=⊤; Q=ℤ/4 | Prüfer group divisible. ℚ: component 0. I=0: I^1=0 so all of Q. I=⊤: ⊤^n=⊤ for n≥1, component 0. ℤ/4 is its own (2)-component, 2· not surjective, not injective | true (Stacks 08XW (2)) | none |
| 2.6 `IsAdicComplete I M` for I nilpotent | ℤ/4, I=(2); I=0; ℤ, I=(p) | I^N=0: Hausdorff (x ≡ 0 mod 0 ⇒ x=0), precomplete (take f N). ℤ: completion ℤ_p uncountable, `of` not surjective | true | none |
| 2.7 retraction of `mapBaseChange R S T` when `H¹(L_{T/S})=0`, `Ω[T/S]` projective | k→k[t]→k (t↦0); T=S; k[t]/(t²), char≠2 | Jacobi–Zariski `H₁(L_{T/S}) → T⊗Ω_{S/R} → Ω_{T/R} → Ω_{T/S} → 0` (`exact_δ_mapBaseChange`, `exact_mapBaseChange_map`); H₁=0 gives injectivity, projective cokernel splits. k dt → 0 not injective, H₁ = (t)/(t²) ≠ 0. T=S: S⊗Ω ≅ Ω. T=k[t]/(t²): t dt ↦ 0 in T dt/(2t dt) since 2 is a unit; H₁=(t²)/(t⁴)≠0 | true (Stacks 031K for formally smooth) | none |
| 2.8 `q • x ∈ P ↔ q ∈ ℤ`, x indivisible in P | ℤ⊆ℚ, x=1; x=2; ℤ², x=(1,2), q=3/2; x=0 | q=a/b lowest terms: s a + t b = 1 gives (1/b)x = s(qx) + tx ∈ P, so b unit, b=1. (1/2)·1 ∉ ℤ; x=2=2·1 so hypothesis fails and (1/2)·2 ∈ ℤ; (3/2,3) ∉ ℤ²; x=0: hypothesis fails at y=0, m=0 (vacuous, not false) | true | none |
| 2.9 `Baer.of_isPrincipalIdealRing` (no domain) | I=0; I=(r), r≠0; ℤ/4 module ℤ/4 | g on (r): pick q' with r q' = g r, extend x ↦ x q'; agrees on s r. ℤ/4: hypothesis fails at r=2, consistent | true | none |
| 2.9 injective ↔ divisible over a PID; quotients | ℚ/ℤ; ℤ; ℤ/4 over ℤ/4; ℚ→ℚ/ℤ; k(t)/k[t] | ⇒ needs r a nonzerodivisor to define (r)→Q, rs ↦ s q (domain). ℤ: 2· misses 1. ℤ/4: self-injective (Baer on 0,(2),(1)) yet 2· not surjective, and ℤ/2 not injective ((2)→ℤ/2, 2↦1 has no extension: 2c=0≠1); so `IsDomain` is needed for both | true | none |
| 2.10 `a ∉ p` regular on `F ⧸ pF`, F flat | ℤ, p=(2), a=3; p=(4); F=ℤ/2, p=0 | F/pF ≅ A/p ⊗ F, a regular on the domain A/p, flatness keeps injectivity. 3 acts as 1 on ℤ/2. p=(4): 2·2=0 in ℤ/4. ℤ/2 not flat: 2 kills ℤ/2 | true | none |
| 2.10 associated prime P of `F ⧸ (pB)F` has `P ∩ A = p` | ℤ→ℤ, F=ℤ, p=(2); ℤ→ℤ/4=F, p=0; ℤ→ℤ[i], p=(5) | (pB)F = pF. p ⊆ P: pB kills the module, pB ⊆ colon ⊆ P. a ∈ P∖p: P=√(colon ⊥ {x̄}) so a^n x̄ = 0 with x̄ ≠ 0 (else radical = B, not prime), a^n ∉ p regular by the first statement, contradiction. ℤ/4 over ℤ not flat: ann(2)=(2), comap (2)≠(0). ℤ[i]/5 ≅ 𝔽₅×𝔽₅, primes (2±i) both over (5), neither = 5ℤ[i] | true for Mathlib's radical-of-colon notion | none |
| 3.1 `leibniz_prod` | s=∅; s two-element, f constant a | D 1 = 0 = empty sum. D(a²)=2aDa; with ∏ over s instead of s.erase: 2a²Da | true | none |
| 3.1 `leibniz_zpow_units` | n=0,1,−1,−2 on ℚ[x,x⁻¹], u=x | n=0: 0=0·…; n=1: Du; n=−1: 0=D(uu⁻¹)=uD(u⁻¹)+u⁻¹Du gives −u⁻²Du = (−1)·u⁻²·Du; n=−2: −2x⁻³ | true | none |
| 3.2 `⁅D, mulLeft a⁆ = mulLeft (D a)` | k[x], a=x; a ∈ k | (D∘a − a∘D)x' = D(ax')−aDx' = x'Da = mulLeft (Da) x' (commutative). a=x: identity; a∈k: 0 | true | none |
| 3.2 `u D u⁻¹ = D − mulLeft (u⁻¹ Du)` | k[x,x⁻¹], u=x, applied to 1; u ∈ k | u D(u⁻¹x') = Dx' + u x' D(u⁻¹) = Dx' − u⁻¹x' Du. At 1: x·D(x⁻¹) = −x⁻¹ = (D − x⁻¹Dx)1; opposite sign gives +x⁻¹. u∈k: Du=0 | true | none |
| 4.1 curry continuous, X locally compact, Y arbitrary | X=pt; general | Preimage of M(K,V): for x∈K pick basic ⋂M(L_i,U_i) ⊆ V around f₀(x,·), open W_x = {x' : f₀(x',·) ∈ ⋂…}, compact nbhd C_x ⊆ W_x, finite subcover of K by int C_{x_j}; N = ⋂_j⋂_i M(C_{x_j}×L_i, U_i) is open, contains f₀, maps into M(K,V). X=pt: identity on C(Y,Z) | true | none |
| 4.1 curry continuous, X `R1Space` | X=ℚ, Y=[0,1]; X=Y=Z=ℝ | Same argument with K regular (compact R1 ⇒ its Kolmogorov quotient compact Hausdorff ⇒ regular, opens pull back), closed nbhds F_x ⊆ W_x in K are compact. ℚ is Hausdorff, not locally compact: outside Mathlib's `continuous_curry`. ℝ: Mathlib's case | true | none |
| 4.1 uncurry continuous, X R1, Y locally compact | general | Preimage of M(C,U), C ⊆ X×Y compact: (x,y)∈C has opens A×B with g₀(A)(B) ⊆ U (eval continuous, Y locally compact), compact L ⊆ B nbhd of y, closed nbhd F ⊆ A of x in the compact R1 space π₁(C); finite subcover; ⋂M(F_j, M(L_j,U)) open ∋ g₀ maps into M(C,U). Convention: curry f 1 0 = 1 for f(x,y)=x−y | true | none |
| 4.2 openness criterion | Spec ℤ, E={(0)}; E=Spec ℤ∖{(2)}; Sierpiński | Noetherian induction on closed Y: reducible Y=Y₁∪Y₂ ⇒ E∩Y open; irreducible with generic η: η∉E ⇒ E∩Y=∅ (stability); η∈E ⇒ W∩Y ⊆ E, E∩(Y∖W) = V∩(Y∖W) by induction, E∩Y = (W∪V)∩Y. {(0)}: W=Spec ℤ ⊄ E, not open. Complement of (2): W=E works for every x. Sierpiński: closure{1}={0,1}, E={1} stable and open; E={0} not stable | true | none |
| 5.1 right zero ↔ right ideals meet ∧ no group quotients | trivial monoid; finite group; {1,a,b} left zeros; (ℤ/n,·) | ⇒: up=p=vp; f(p)=f(u)f(p) ⇒ f(u)=1. ⇐: pairwise meeting right ideals ⇒ ⋂_u uM ≠ ∅ (uM∩vM is a right ideal), unique minimal right ideal K=kM, uK minimal ⇒ uK=K, u ↦ (k ↦ uk) ∈ Perm K (Type u) trivial ⇒ k right zero. Group: id nontrivial, no p with up=p. Left zeros: aM={a}, bM={b} disjoint; f(a)=f(a)², no right zero. ℤ/n: 0 | true | none |
| 5.2 Cauchy–Binet for minors | n=0; n=1; card ι < n; A=[[1,0,1],[0,1,1]], B=Aᵀ | n=0: 1=1·1. n=1: (AB)_{ik}=Σ_s A_{is}B_{sk}. card ι<n: empty sum 0, rank ≤ card ι so det 0. AB=[[2,1],[1,2]], det 3; minors 1,1,−1, squares sum 3. Order of columns irrelevant (sign cancels), I,K need not be injective | true | none |
| 5.3 Binet–Cauchy over a ring | expand; a=(1,0), b=(0,1), c=a, d=b; a=b | Σ_{i,j}[a_ib_jc_id_j − a_ib_jc_jd_i − a_jb_ic_id_j + a_jb_ic_jd_i] = 2[(Σac)(Σbd) − (Σad)(Σbc)]. Witness: pairs (1,2),(2,1) give 1 each, total 2 = 2(1−0). a=b: 0=0 | true | none |
| 5.3 Lagrange over `RCLike` | a=(1,i), b=i·a | ‖a_ib_j−a_jb_i‖² = |a_i|²|b_j|²+|a_j|²|b_i|²−2Re(a_i b_j ā_j b̄_i); summing: 2(Σ|a|²)(Σ|b|²) − 2Re(S̄S), S=Σā_ib_i. Witness: LHS 0; Σ|a|²=Σ|b|²=2, S=2i, 2(4−4)=0; without conj Σa_ib_i=0 gives 8 | true | none |
| 5.4 `intValued` membership from ℕ; Pólya basis | C(X,2); X/2; X², X³; −1 | X(X−1)/2 ∉ ℤ[X], integer-valued; X/2 at 1 is 1/2; values at ℕ: Newton Σ(Δ^kP)(0)C(X,k) has integer coefficients from values at 0..deg, hence integer-valued on ℤ; X² = 2C(X,2)+C(X,1), X³ = 6C(X,3)+6C(X,2)+C(X,1) (6·X(X−1)(X−2)/6 + 3X²−3X + X = X³); C(−1,2)=1; X/2 integer on evens but not on 1. `Ring.choose X n` is descPochhammer/n! for the ℚ≥0-module instance | true | none |
| 5.5 `tr (P−Q)^{2k+1} = tr P − tr Q` | P=[[1,0],[0,0]], Q=[[0,0],[1,1]]; P=(2),Q=(0); 𝔽₂ | C=(P−Q)² commutes with P,Q; (P−Q)C = (P−Q) − (PQP−QPQ); tr(E·PQP)=tr(E·PQ)=tr(E·QPQ) for E commuting with P,Q (cyclicity), so tr(C^kD)=tr(C^{k−1}D)=…=tr D. Q²=Q; P−Q=[[1,0],[−1,−1]], trace 0=1−1, (P−Q)²=I, even powers trace 2. (2)³=8≠2. Over 𝔽₂ no division used | true | none |
| 5.6 common denominators in `GrothendieckGroup M` | (ℕ,·); Multiplicative ℕ; {1,e}; trivial monoid | surj at ⊤: x=of a/of c₁, y=of b₁/of c₂, then common c=c₁c₂. (ℕ,·): 0 absorbs, of 2 = of 3 (c=0 in eq_iff_exists). Mult ℕ ≅ ℤ: 1 = 3−2, −2 = 0−2. {1,e}: of e = of 1 with c=e. Trivial: 1 = of 1/of 1 | true | none |
| Conventions: `⁅a,b⁆ = a b a⁻¹ b⁻¹`; Pascal from 0; pairs ordered; associated primes radical-of-colon; `curry f x y = f (x,y)` | as in rows 1.7, 1.6, 5.3, 2.10, 4.1 | Heisenberg corner −1; [[1,1],[1,2]]; witness 2; ℤ/4 over ℤ: radical of (4) is (2); curry f 1 0 = 1 | consistent with the pin (`commutatorElement`, `Submodule.IsAssociatedPrime`, `ContinuousMap.curry`) | none |

**Checks.** All 81 Check bullets (three per target) were recomputed in the table rows above; none
is false, vacuous, or a restatement of its definition; each definition (`intValued`) has three
discriminating Checks, and the degenerate cases (n = 0, e = 0, ι = ∅, I = 0, I = ⊤, the zero
ring, p = 2, the trivial monoid, X a point) are covered in the table where the README omits them.

**Declared gaps.** None declared, none needed: the roadmap consumes no roadmap.

## Not verifiable

- Lucas 1878 (*Amer. J. Math.* 1): the DOI landing page is JSTOR; the sources service's fetch of
  the JSTOR PDF returned a "Client Challenge" page (cache `32ed6315`, one page of challenge text),
  and the manifest entry `lucas1878` the fetch recorded points at that page and should be
  corrected to `uncertified` by the worker. The theorem (1.1, 1.2 routes) is Mathlib's
  `Choose.choose_modEq_prod_range_choose`, which was verified instead.
- Avron–Seiler–Simon 1994 (*J. Funct. Anal.* 120): Elsevier, paywalled; recorded `uncertified`
  by the service. The identity 5.5 cites it for was recomputed (table row 5.5).
- Pólya 1915 (*Rend. Circ. Mat. Palermo* 40): Springer, paywalled; recorded `uncertified`. The
  basis theorem was recomputed (row 5.4).
- Cahen–Chabert 1997 (AMS Surveys 48): AMS e-book, no open copy; listed in
  `needs-references.toml`. Same statement as Pólya.

## Source issues

- none
