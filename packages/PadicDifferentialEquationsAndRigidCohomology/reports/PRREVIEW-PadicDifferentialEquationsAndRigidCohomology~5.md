# Review of PadicDifferentialEquationsAndRigidCohomology (pull request #1002 at be0376e)

**Verdict:** needs changes

## R01 (P2) — Smooth constant-coefficient rigid cohomology has two owners

**Location:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:7393` (RD.4.10) “Let `X` be a separated `k`-scheme of finite type and `E` an overconvergent `(F-)`isocrystal … The rigid cohomology complex is `RΓ_rig(X/K, E)`”; also RD.5.66(a) (line 10150) and RD.4.38 (line 8085).

**Claim:** CrystallineCohomology, earlier in the merge order, owns `RΓ_rig(Z/K₀)` of smooth finite-type `k`-schemes with constant coefficients, its frame independence, finiteness, Frobenius bijectivity and proper-smooth crystalline comparison. This roadmap owns the same objects (RD.4.8–RD.4.10, RD.5.66(a), RD.4.38) and cites neither that paragraph nor an adapter.

**Witness:** `CrystallineCohomology/README.md:11047` at the head of pull request #857: “Rigid cohomology of smooth strata … Construct RΓ_rig(Z/K₀) with constant coefficients from dagger frames … Prove independence of frames, finite-dimensionality of each H^i … identify the rigid complex with the rational crystalline complex”.

**Repair:** Cite CrystallineCohomology §CR.6.4 *Rigid cohomology of smooth strata* as the owner of the constant-coefficient smooth case. In RD.4.10, add the API bullet “For smooth `X` and the trivial isocrystal, `RΓ_rig(X/K)` is CrystallineCohomology §CR.6.4's `RΓ_rig(X/K₀)` (same frames, same overconvergent de Rham complex), compatibly with Frobenius.” Have RD.5.66(a) and RD.4.38 cite §CR.6.4 for the constant case and state only the extension to coefficients `E` and supports. Add §CR.6.4 smooth strata to the CrystallineCohomology bullet at line 123 and to its supplier contract.

## R02 (P2) — RD.3.27 and RD.0.42 are statable at the pinned Tau Ceti but absent

**Location:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/Suggested.lean:19–21` “The analytic headline results of RD.0 require annular function rings, the Robba and Amice rings, weak completions and their topologies. These carriers are absent from the pins.” RD.3.27 is named at line 15 but not stated.

**Claim:** `lake-manifest.json` now pins Tau Ceti `2fd255d`, which has the Monsky–Washnitzer algebra and the weak completion. The rigid-analytic Quillen–Suslin theorem (RD.3.27) and the existence of Frobenius lifts on `S†` (RD.0.42) are statable there. The file states the algebra behind RD.3.27 and the lemma behind RD.0.42, but not the two theorems themselves.

**Witness:** `TauCeti/RingTheory/Dagger/WashnitzerAlgebra.lean:115` (`TauCeti.Dagger.washnitzerAlgebra`) and `TauCeti/RingTheory/Dagger/WeakCompletion/Basic.lean:190` (`TauCeti.Dagger.weakCompletion`). The two statements below elaborate with `lake env lean`, and `sorry` is the only warning.

**Repair:** Add `public import TauCeti.RingTheory.Dagger.WashnitzerAlgebra` and `public import TauCeti.RingTheory.Dagger.WeakCompletion.Basic`. Add the following two declarations, with `open TauCeti.Dagger IsLocalRing`, and backtick their names in RD.3.27 and RD.0.42:

```lean
/-- RD.3.27: every finite projective module over `K⟨t₁,…,tₙ⟩†` is free. -/
theorem rigid_quillen_suslin {K : Type u} [NontriviallyNormedField K] [IsUltrametricDist K]
    [CompleteSpace K] (n : ℕ) (M : Type u) [AddCommGroup M]
    [Module (washnitzerAlgebra (Fin n) K) M] [Module.Finite (washnitzerAlgebra (Fin n) K) M]
    [Module.Projective (washnitzerAlgebra (Fin n) K) M] :
    Module.Free (washnitzerAlgebra (Fin n) K) M := by
  sorry

/-- RD.0.42: a `σ_K`-semilinear lift of the `q`-power Frobenius to the weak completion `S†`. -/
theorem exists_frobenius_lift_weakCompletion {O : Type u} [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (maximalIdeal O) O] [CharZero O]
    {π : O} (hπ : Irreducible π) {p f : ℕ} [Fact p.Prime] [CharP (ResidueField O) p]
    (σK : O →+* O) (hσK : ∀ a : O, σK a - a ^ (p ^ f) ∈ maximalIdeal O)
    (S : Type u) [CommRing S] [Algebra O S] [Algebra.FiniteType O S] [Algebra.Smooth O S] :
    ∃ φ : weakCompletion π S →+* weakCompletion π S,
      (∀ a : O, φ (algebraMap O _ a) = algebraMap O _ (σK a)) ∧
      ∀ x : weakCompletion π S,
        φ x - x ^ (p ^ f) ∈ Ideal.span {algebraMap O (weakCompletion π S) π} := by
  sorry
```

Replace the docstring sentence with one that names only the carriers still missing at `2fd255d`: annuli, the Robba and Amice rings, and their topologies.

## R03 (P3) — The supplier contracts name superseded pins and understate Tau Ceti

**Location:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:267` “### From Mathlib (pinned at `6b7abb3c…`)”, line 408 “### From Tau Ceti (pinned at `a91d3aaf…`)”, line 69 “Tau Ceti supplies restricted power series and the one-variable Tate algebra with Weierstrass preparation”.

**Claim:** Since the merge of main, the head's `lake-manifest.json` pins Mathlib `1b1ccf4` and Tau Ceti `2fd255d`. At `2fd255d`, Tau Ceti also supplies the following, which the README attributes only to AdicSpacesPartIV:

- multivariable Tate algebras;
- the Monsky–Washnitzer and dagger algebras;
- weak completions;
- universally finite differentials.

**Witness:** `lake-manifest.json` has `"rev": "2fd255d997f47c0b5d834ee416c7015d55444ce5"` (TauCeti) and `"1b1ccf4b088b32fa3f23f2de1127433254a81e1e"` (mathlib). `TauCeti/RingTheory/Dagger/` is absent at `a91d3aa` and has 34 files at `2fd255d`.

**Repair:**

- Set both headings to the manifest revisions.
- Add the following to “From Tau Ceti”, each next to the AdicSpacesPartIV §§F1.1–F1.9 citations it accompanies (RD.0.42, RD.3.26–RD.3.28):
  - `TauCeti.Dagger.washnitzerAlgebra` (`TauCeti/RingTheory/Dagger/WashnitzerAlgebra.lean:115`);
  - `TauCeti.Dagger.IsDaggerAlgebra` (`TauCeti/RingTheory/Dagger/DaggerAlgebra.lean:65`);
  - `TauCeti.Dagger.weakCompletion` (`TauCeti/RingTheory/Dagger/WeakCompletion/Basic.lean:190`);
  - `TauCeti.Dagger.Omega` (`TauCeti/RingTheory/Dagger/Omega/Basic.lean:79`).
- Rewrite line 69 to list these.

## R04 (P3) — RD.0.56's Checks do not exclude the trivial predicate

**Location:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:2277–2278` “`ℤ` has the unimodular extension property … Over the zero ring every vector is unimodular and equal to `Pi.single 0 1`.”

**Claim:** All four Checks still hold if `HasUnimodularExtension R` is replaced by `True`. No Check exhibits a ring that lacks the property.

**Witness:** Over `R = C(S², ℝ)`, `(x₀, x₁, x₂)` is unimodular (`Σ xᵢ² = 1`). A matrix `P` with `P x = e₀` would give `tangentSections ≅ R³/Rx ≅ R²`, contradicting AlgebraicKTheory §0.5 (main), `tangentSections_stablyFree_not_free`.

**Repair:** Add the Check: “Over `R = C(S², ℝ)` the coordinate vector `(x₀, x₁, x₂)` is unimodular, since `Σ xᵢ² = 1`, but it is equivalent to no `Pi.single 0 1`. Its complement is the stably free, non-free tangent-section module of AlgebraicKTheory §0.5, so by (b) `R` lacks the unimodular extension property.”

## R05 (P3) — RD.2.45 has no source locator

**Location:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:5447` “`V` decomposes uniquely as `V = ⊕_{b ∈ ℚ_{≥0}} V(b)`, where `V(0)=V^{P_L}` … `Swan(V) = Σ_b b·dim V(b)`.”

**Claim:** This Theorem cites no text anywhere: not in its statement, Hypotheses, proof sketch or *Needs* (lines 5445–5470).

**Witness:** Lines 5445–5470 name only supplier sections (LocalFieldsRamification Layers 3–4, ArithmeticGaloisRepresentations §§3.1–3.2) and no source with a theorem or page.

**Repair:** Add a *Sources.* line giving the break decomposition and Swan conductor with exact locators. For example: Katz, *Gauss Sums, Kloosterman Sums, and Monodromy Groups*, Ann. of Math. Stud. 116 (1988), Chapter 1 (Proposition 1.1 and the Swan conductor), and Serre, *Local Fields*, Chapter VI §2 (Hasse–Arf integrality). Take the pages from the texts read.

## R06 (P3) — A docstring line starting with `theorem` creates a phantom declaration

**Location:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/Suggested.lean:14–15` “the commutative algebra behind the rigid-analytic Quillen–Suslin / theorem RD.3.27 (finite free resolutions, RD.0.55, …”

**Claim:** The declaration scanners read line 15 as a declaration named `RD.3.27`.

**Witness:** The change summary for this head lists “+ RD.3.27” among 18 added Lean declarations; the file has 17. The signature check of that entry fails with “Unknown identifier `RD`”.

**Repair:** Rewrap the docstring so that no line begins with `theorem`. End line 14 with “Quillen–Suslin theorem” and start line 15 with “RD.3.27 (finite free resolutions, RD.0.55, and unimodular vectors over polynomial”.

## R07 (P3) — The description omits the new commutative-algebra ownership

**Location:** The pull request description, summary block: “**What this roadmap builds.** Over a complete discretely valued field K … develops the Robba ring and its variants, dagger algebras, and differential and Frobenius modules …”

**Claim:** The head adds ownership of algebra over arbitrary commutative rings, with 13 `Suggested.lean` declarations for it:

- finite free resolutions with two out of three;
- Serre's theorem over `R[t]`;
- the Horrocks–Quillen theorem;
- the unimodular-extension criterion.

The description does not mention this.

**Witness:** `README.md:155` “**Projective modules over polynomial rings.** This roadmap owns the algebra to which the rigid-analytic Quillen–Suslin theorem §RD.3.27 reduces …”

**Repair:** Append to “Approach and generality”: “It also owns, over arbitrary commutative rings, the algebra behind the rigid-analytic Quillen–Suslin theorem (§RD.3.27). This covers finite free resolutions with two out of three, base change and Serre's theorem over `R[t]` (§RD.0.55), and unimodular vectors over `R[t]` with the stably-free criterion (§RD.0.56); `Suggested.lean` states them.”

## Verified sound

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| `HasFiniteFreeResolutionLE` (RD.0.55 Def.) | `ℤ/2`, `ℚ` over `ℤ`; zero ring | `ℤ/2`: LE 0 false (`2·1̄ = 0`), LE 1 true (`ker = 2ℤ ≅ ℤ`); `ℚ`: false for all `n` (not f.g.); zero ring: all free | Pass |
| RD.0.55(a) two out of three | `0→2ℤ→ℤ→ℤ/2→0`; `0→I→R→R/I→0`, `R = ℤ[√−5]`, `I = (2, 1+√−5)` | lengths `0, 0, 1`; `I`: `I⊕Rᵃ≅Rᵃ⁺¹` gives `I≅R` via `∧ᵃ⁺¹`, but `a²+5b²=2` unsolvable; so neither `I` nor `R/I` has an FFR | Consistent both ways |
| RD.0.55(b) `isStablyFree`, iff | `I ⊂ ℤ[√−5]`; `ℤⁿ`; tangent module `P` over `C(S²,ℝ)` | `I`: both sides false; `ℤⁿ`: both true; `P`: stably free, FFR `0→R→R³→P→0` of length 1 | Pass |
| RD.0.55(c), flat case | `ℤ → ℚ`, `M = ℤ/2`, `n = 1` | `ℚ ⊗ ℤ/2 = 0`; length ≤ 1 via `k = 0`, kernel `0` free | Pass |
| RD.0.55(c), regular case | `S=ℤ[t]`, `g=t`, `A=ℤ⟦t⟧` or `ℤ[t]/(t²)`; `S=ℤ`, `g=2`, `A=0`, `N=ℤ/2` | `ℤ⟦t⟧`: `0→A→A→ℤ→0` exact; `t·t=0` breaks `hgA`, no FFR (`ℚ[t]/(t²)` at `(t)`); `A=0`: `hinj` fails (`1↦0`, `1∉2ℤ`) | Each hypothesis needed; pass |
| RD.0.55(d) Serre | `R=ℤ`, `N=ℤ[t]/(2,t)`; `R=ℤ/4` | Koszul ranks `1,2,1`, Euler characteristic `0`; over `ℤ/4`, `ℤ/2` has a periodic resolution, so `h` fails | Pass |
| `UnimodularEquiv`, `HasUnimodularExtension` | `ℤ`, `(2,5)`; `C(S²,ℝ)`, `(x₀,x₁,x₂)`; `Fin 1` | `P=[[3,−1],[−5,2]]`, `det=1`, `P(2,5)=(1,0)`; the sphere vector is not completable; unit `u`, `P=[u⁻¹]` | Definition right; Checks miss the non-example (R04) |
| RD.0.56(a) | `B=ℤ`, `f=(t²+1,t)`; `n=1` | `[[1,−t],[0,1]]f=(1,t)`, `[[1,0],[−t,1]](1,t)=(1,0)=f(0)`; a monic unit of `ℤ[t]` is `1` | Pass; the domain hypothesis is Lang's, and no general-ring form is claimed |
| RD.0.56(b) | zero ring, `ℤ`, `C(S²,ℝ)` | both sides: true, true, false | Pass |
| RD.3.27 (R02) | `n=1`; over `ℚ_p` at `ρ=1`, `g=t−1/p` and `g=t−1` | PID gives freeness; `t−1/p` is monic yet a unit: `ℚ_p[t]/(g)=ℚ_p`, `ℚ_p⟨t⟩/(g)=0`; for `t−1`, both are `ℚ_p` | Step 1 rightly uses Weierstrass `g`; elaborates at `2fd255d` |
| RD.0.42 (R02) | `S=O_K[x]`, `φ(x)=x^q` and `x^q(1+πx)` | `φ(x)−x^q = 0` and `πx^{q+1}`, both in `πS†` | Two lifts; elaborates at `2fd255d` |
| RD.4.10/RD.5.66/RD.4.38 vs CR.6.4 (R01) | `G_m` over `k` | CR.6.4 Check: `H¹` spanned by `dlog t`, Frobenius `p·dlog t`; here `(h⁰,h¹,h²)=(1,1,0)` | Same object computed in both |
| RD.2.45 (R05) | Artin–Schreier `z^p−z=t^{−1}` | break `1`, `Swan = 1`; lines 5445–5470 cite no text | Locator missing |
| RD.5.1 | Kedlaya-FF Lemma 3.2 p. 6 (line 213); Prop. 3.3 p. 7 (line 237) | hypotheses match; `A=2, D=3, B=5, σ=id`: `X=5` gives `10+5−15=0`; printed form gives `X=−15`, residual `20` | Pass; the README's correction is right |
| RD.5.2–RD.5.4, RD.5.8 | Prop. 4.1 p. 9 (346); Lemma 4.2 p. 10 (385); Thm. 5.1 p. 11 (427); Thm. 1.1 p. 2 (45) | `ℓ ≥ 0`, multiplicity 1, rank-one slope-`ℓ` submodule; `g` induces `f`; `F^a`-isocrystals, `X` smooth separated finite type | Pass |
| RD.3.27, RD.0.55, RD.0.56 locators | Kedlaya-FF Lemma 6.1 p. 12 (486); Lemmas 6.2–6.3 p. 13; Props. 6.4–6.5 p. 14; Prop. 6.6, Thm. 6.7 p. 15 | Lang XXI.3.4, 2.7, 2.8, 2.1, 3.6 cited at lines 545, 557, 566, 577, 578: same numbering as the README | Pass |
| RD.2.28 (Construction) | Kedlaya-Overview Def. 4.7.2, Rem. 4.7.3 p. 26 (1016, 1022); Kedlaya-LocalMonodromy §6.5 arXiv p. 82 (3341) | `d(log t)=dt/t`; `τ` acts only if `|τ*(t)−t|_r<1`; `l_{t^q(1+x)} = q·l_t + log(1+x)` gives `φ(z)=qz+log(φ(t)/t^q)` | Pass |
| `arabia_controlled_lifting`, `katz_cyclic_vector` | rows of the third review (unchanged statements) | `S=R, I=0, C=0` gives `E=B`; `x²−2` mod 7 has roots 3, 4; `ℚ(t)`, `v=(1,t)`, `det 1`; `δ=0` forces `D=0` | Pass |

- **Previous review.** The fourth review (at `4d3f9ec`) raised no finding, so there was nothing to re-check.
- **Gate.** The worker's gate passes at `be0376e`. My rerun with the default merge order reports only `depcheck: UPWARD … -> CongruenceSpectralGap (#157)`, which is the move the worker makes. The prescribed depcheck on the moved order printed `depcheck: 206 roadmaps, 1914 edges, 0 problem(s)` with no UPWARD, CYCLE or `moved:` line. The diff outside the folder is empty.
- **Elaboration.**
  - `lake env lean` on `Suggested.lean` gives 12 `declaration uses 'sorry'` warnings and nothing else.
  - One-tactic probes (`rfl | simp | infer_instance | aesop`) fail on all 12 theorems.
  - The `#check @` types of the 17 declarations match RD.0.39, RD.0.55, RD.0.56 and RD.1.7 in generality; no binder is dropped.
- **Source locators.** I checked 16 locators: Kedlaya-FF (arXiv:math/0110125v4) §§1–6 (13), Kedlaya-Overview (arXiv:math/0501361v2) §4.7 (2) and Kedlaya-LocalMonodromy (arXiv:math/0110124v4) §6.5 (1). I also checked Lang's numbering against the 5 citations of it in Kedlaya-FF.
- **Library declarations.** Opened at the pins:
  - Mathlib: `Algebra/Module/StablyFree/Basic.lean:34`, `LinearAlgebra/Unimodular.lean:46, 78`.
  - Tau Ceti: `RingTheory/Dagger/WashnitzerAlgebra.lean:115, 532, 639`; `Dagger/WeakCompletion/Basic.lean:190`; `Dagger/DaggerAlgebra.lean:65`; `Dagger/Noetherian.lean:184`; `Dagger/Omega/Basic.lean:79`.
  - Tau Ceti `Algebra/Module/PseudoCoherent/FiniteProjectiveDimension.lean:69` (`IsFPD` is about projective resolutions, so a different object) and `Algebra/Module/StableEquivalent.lean`.
  - All 16 Tau Ceti names in the README occur at `2fd255d`.
- **Citations and ownership.**
  - Resolved: RestrictedPowerSeries §§1.1, 4.2–4.4, 5.4 (main); AlgebraicKTheory §§0.5, 4.1 (main); AdicSpacesPartIV F1.5 (main); CrystallineCohomology §CR.6.4 (open head). The 5 leads from `roadmaps resolve` are this file's own Lean names.
  - No roadmap owns Quillen–Suslin, Serre's FFR theorem or the unimodular extension property. AlgebraicKTheory §4.1 owns stable range only, so this roadmap owns RD.0.55–RD.0.56.
- **Overlap check.**
  - Read: CrystallineCohomology, PadicHodgeTheory, FiniteFlatGroupsAndIntegralPadicHodgeTheory, AInfCohomology and RelativeFarguesFontainePartII (open); AdicSpacesPartIV, NewtonPolygons and ClassicalArithmeticCompletion (main). The third list is empty.
  - Owners of shared objects:
    - smooth constant-coefficient rigid cohomology: both CrystallineCohomology §CR.6.4 and this roadmap (R01);
    - Robba carriers and the slope filtration: NoncommutativeAndEquivariantIwasawa §F.6 (cited here and by FiniteFlat R07.4.8);
    - radius annuli: this roadmap (PadicHodgeTheory consumes);
    - the §RD.0.54 rings: this roadmap (RelativeFarguesFontainePartII excludes them);
    - dagger algebras, weak completions and the MW lifting: AdicSpacesPartIV F1.
  - The others share nothing.

## Not verifiable

- Lang, *Algebra*, 3rd edition, Chapter XXI, Theorems 2.1, 2.7, 2.8, 3.4 (including its integral-domain hypothesis) and 3.6: no legal open copy exists. I cross-checked the numbering only against Kedlaya-FF's citations.
- Kedlaya, *A p-adic local monodromy theorem*, Annals p. 182 (RD.2.28): the sources service refused the Annals host. I read §6.5 in arXiv v4 instead, at p. 82.
- The seeded sample names labels only. I checked the changed passages (Definition, Theorem) and the Kedlaya-based Lemmas, Theorems and the RD.2.28 Construction.
- Arabia and van der Put (RD.0.39, RD.0.41, RD.0.42): I did not re-read them this round, since the statements are unchanged.

## Source issues

- **Gap** in Kedlaya-FF (arXiv:math/0110125v4) at Proposition 6.5, proof, pp. 14–15: the source says the ideal `I` is `J ⊗_{B[t]} A` and base-changes `J`'s resolution, without stating flatness of `A` over `B[t]`; it should be justified by flatness, or by Tor vanishing along a regular `g` as in RD.3.27 step 3; affects the proof.
- **Gap** in Kedlaya-FF at Proposition 6.4, proof, p. 14: the source says Lang XXI.3.4 applies to the polynomial tuple, which is known to be unimodular only over `A`; it should first show unimodularity over `B[t]` via `B[t]/(g) ≅ A/gA` (Weierstrass division); affects the proof.
- **Error** in Kedlaya-FF at Proposition 3.3, proof, p. 7: the source says the splitting equation is `−X + AX^σD⁻¹ = B`; it should be `−X + AX^σD⁻¹ = −BD⁻¹`, since `A=2, D=3, B=5, σ=id` forces `X=5`; affects the proof.
- **Misprint** in Kedlaya-FF at §6, definition of the leading term, p. 12: the source says the series is indexed from `i = 1`; it should be indexed from `i = 0`; affects nothing.
- **Misprint** in Kedlaya-FF at the Introduction, p. 2: the source says `X` is a smooth separated `k`-scheme of finite type over `K`; it should say over `k`; affects nothing.
