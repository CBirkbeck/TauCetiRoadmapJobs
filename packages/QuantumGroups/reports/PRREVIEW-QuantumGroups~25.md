# Review of QuantumGroups (pull request #1705 at 96014ab)

**Verdict:** needs changes

This is an incremental re-review of the 3 lines changed since `7c3e850`, the head the previous review read. The change is in §8.7 only: one Check is added and the locator sentence of the *Needs:* line is rewritten. Nothing outside the folder changed, and `Suggested.lean` is untouched. Locations are in `TauCetiRoadmap/QuantumGroups/README.md` unless stated otherwise.

The head repairs the §8.7 locator finding (previous R04). It touches none of the other three. All three need action outside the folder files:

- R01 needs `origin/main` merged into the branch, which changes the pins.
- R02 and R03 need the pull request's description changed.

No repair report reached this review, so no finding below is settled as "not actionable".

## R01 (P2) — 140 of the README's 143 Tau Ceti names do not exist at the branch's pinned Tau Ceti

**Location:**

- The branch's `lake-manifest.json` pins Tau Ceti `358314d4`, Mathlib `f6090c70` and toolchain `v4.35.0-rc3`. Main (`3090489`) pins `2fd255d9`, `1b1ccf4b` and `v4.36.0-rc2`.
- Affected text: the `From Tau Ceti` contract (`:155`–`:192`), §§3.1, 4.1 and all of Layer 8, including the changed §8.7 *Needs:* line (`:1781`), and `Suggested.lean:24`, `:26`–`:34`, `:66`–`:69` and `:70`–`:77`.

**Claim:** every Tau Ceti declaration the folder cites exists at the pinned Tau Ceti.

**Witness:** a namespace-aware scan of declarations finds 3 of the 143 backticked `TauCeti.*` names at `358314d4`: `HopfAlgebra.antipode_antipode`, `Sl2Std` and `TemperleyLieb`. It finds all 143 at `2fd255d9`. The §8.7 file `QuantumGroups/UqSl2/ClassicalSpecialization.lean` exists only at `2fd255d9`.

**Detail.**

- **Missing at `358314d4`:** `TauCeti/QuantumGroups/` (43 files at main's pin), `Algebra/Coalgebra/Star.lean`, `Algebra/HopfAlgebra/{Star,Cancellation}.lean`, `Algebra/Category/FiniteHopfModuleCat/` and `CategoryTheory/Monoidal/Pivotal/Spherical.lean`.
- **Correction to the previous witness:** `Algebra/Coalgebra/Comodule/Finite/{Monoidal,RightRigid,Rigid}.lean` do exist at `358314d4`, for example `instRightRigidCategory` at `RightRigid.lean:262` and `instRigidCategory` at `Rigid.lean:47`. §3.3's citations of them are therefore sound at the branch pin.
- **The docstring contradicts itself across pins:**
  - `Suggested.lean:26`–`:34` ("Proved in the pinned Tau Ceti … `TauCeti.UqSl2`") and `:66`–`:69` (`clebschGordanRecouplingEquiv`) are false at `358314d4`.
  - `:76` ("the pinned Tau Ceti has none of these modules") is false at `2fd255d9`.

**Repair:**

1. Merge `origin/main` into the branch. The branch changes neither `lake-manifest.json` nor `lean-toolchain`, so the merge brings main's pins. Then re-run the gate with its build.
2. At `2fd255d9` the §8.5 sphericity headline becomes statable from real-bodied carriers, set out with file and line in the previous report's R01:
   - `TauCeti.FiniteHopfModuleCat.rigidCategory`, fed `TauCeti.UqSl2.antipode_bijective`;
   - `unitEvalNatIso` and `unitEvalNatIso_isMonoidal` at `g = (kUnit q)⁻¹`;
   - `TauCeti.PivotalCategory`.

   State `theorem uqSl2_sphericalCategory (q : ℂ) [Fact (q ≠ 0)] (hq : q - q⁻¹ ≠ 0) : TauCeti.SphericalCategory (TauCeti.FiniteHopfModuleCat ℂ (TauCeti.UqSl2 q))` with the `TauCeti.*` imports it needs.
3. Delete `Suggested.lean:70`–`:77`, list the new headline under "Stated here", and name it in §8.5.

Re-raised: R01 of the previous review. The head leaves the pins unchanged.

## R02 (P2) — §§0.2–0.3 are also claimed by two open roadmaps, and #1649 still hands the unitary Temperley–Lieb category to one of them

**Location:**

- `:33`–`:42`: "Section 0.2 is the single home of C*-categories … §0.3 is the single home of the unitary Temperley–Lieb category … CategoricalOperatorAlgebras CA1a–CA2a and TemperleyLiebOperatorAlgebras Layer 3 … consume these objects from §§0.2–0.3".
- Also `:1796`–`:1802`.

**Claim:** §§0.2–0.3 have a single owner, and the two named roadmaps consume them.

**Witness:**

- CategoricalOperatorAlgebras (#888, head now `3375f9e`), `README.md:44`–`:46`: CA1a and CA2a "have their single home here; QuantumGroups consumes CA1a and CA2a". `:2303`–`:2309` lists QuantumGroups as consuming "the balanced unitary dual functor, signed self-duality, standard solutions and intrinsic dimension".
- TemperleyLiebOperatorAlgebras (#867, `ba43cc7`), `:72`–`:76`: Layer 3 is "the single home" of the unitary tensor category "with its standard solutions, simple objects and fusion rules".

**Detail.** The other QuantumGroups revision (#1649, now `b3b2d26`) has moved part of the way towards this head:

- Its `README.md:42`–`:44` and `:1702`–`:1704` give the C*-categories, standard solutions, intrinsic dimension, dual functor and signed self-dualities to QuantumGroups, with CategoricalOperatorAlgebras consuming them.
- But `:49`–`:51` still leaves "the unitary Temperley–Lieb category (TemperleyLiebOperatorAlgebras 1.3, 2.1 and Layer 3)" to TemperleyLiebOperatorAlgebras, against this head's §0.3.

This head's allocation is the admissible one. QuantumGroups is on main, so it comes before both open roadmaps (merge order lines 229 and 245). A roadmap on main never names an open roadmap as its supplier. What is missing is the coordination: neither open roadmap is told to change.

**Repair:** state in this pull request's description:

- §0.2 and §0.3 own these objects;
- #888 (`:40`–`:46`, `:2303`–`:2309` and its CA2a construction of the balanced dual functor) and #867 (`:72`–`:76` and its Layer 3) are to cite QuantumGroups §0.2 and §0.3 instead of building them;
- #1649's assignment of the unitary Temperley–Lieb category to TemperleyLiebOperatorAlgebras (`:49`–`:51`) is superseded.

No folder file changes.

Re-raised: R02 of the previous review.

## R03 (P3) — The description describes a different head, and no order is stated against the conflicting #1649

**Location:** the title "QuantumGroups: construct the ribbon category RepUqg", and the description's "Add Q9 to build `RepUqg`", "Prerequisites: #1125 and #1124 must merge first" and "Only the roadmap README changes".

**Claim:** the description matches the head, and no other open revision of the folder conflicts with it unannounced.

**Witness:**

- This head has no Q9, no `RepUqg` and no braiding (no match in the README). It changes `Suggested.lean`, which states four headlines.
- The overlap listing reports that #1649 (`b3b2d26`) "and #1705 conflict in `README.md`, `Suggested.lean`". Neither description names an order.

**Repair:**

- Retitle and redescribe the pull request for what the head is: Layer 0 foundations, Layers 1–7, Layer 8 on Tau Ceti's rank-one theory, and four `Suggested.lean` headlines.
- Drop the #1125/#1124 prerequisites.
- State which revision prevails (close #1649, or rebase one onto the other), in the same paragraph as R02's ownership sentence.

No folder file changes.

Re-raised: R03 of the previous review.

## Previous findings

- R01 — not repaired: the pins are still Tau Ceti `358314d4`, Mathlib `f6090c70` and `v4.35.0-rc3`. 3 of 143 README `TauCeti.*` names exist there, and the changed §8.7 *Needs:* line still cites `QuantumGroups/UqSl2/ClassicalSpecialization.lean`, which that pin lacks.
- R02 — not repaired: `:33`–`:42` is unchanged. #888 (`3375f9e`) `:44`–`:46` still reads "have their single home here; QuantumGroups consumes CA1a and CA2a", and #867 `:72`–`:76` still claims Layer 3.
- R03 — not repaired: the title is still "construct the ribbon category RepUqg" and the description still says "Add Q9 to build `RepUqg`". #1649 (`b3b2d26`) still conflicts in both files.
- R04 — repaired: `:1781` now reads "Virelizier §4.1, p.13, writes its L(m) … in the divided-power basis `u_i=F^i u_0/(i)_q!` … the ladder basis here is `v_i=q^(i(i−1)/2)u_i`, in which these coefficients become `[i+1]_q` and `[m−i+1]_q`."

## Verified sound

**Head, gate and order.**

- **Head:** `96014abd`, clean worktree. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty, and `git diff --stat 7c3e850a HEAD` is `README.md | 3 ++-` only.
- **Gate:** I re-ran `gate … --base origin/main` on this head. Every scanner is 0 and the result is `OK`. The worker's gate on this head records `build=0`.
- **Dependency check:** the required command prints `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration and signatures:**
  - `lake env lean TauCetiRoadmap/QuantumGroups/Suggested.lean` exits 0 with exactly four `declaration uses sorry` warnings, at `:121`, `:153`, `:164` and `:174`.
  - The `#check @` file for all six declarations elaborates to the types in `scratch/signatures.md`. The flagged `[StarModule ℂ A]` absent from `AlgebraicHaar` is used by no field.
- **Padding probe:** on a scratch copy, `first | rfl | infer_instance | trivial | simp | decide | exact ⟨_, rfl⟩` fails on all four headlines, with unsolved goals at `:134`, `:157`, `:168` and `:179`. There is no padding.

**The changed passage (§8.7), checked against the source and the supplier.**

- **Relations:** `virelizier` lines 348–353 (§2.3, p.8) give `KE=q²EK`, `KF=q⁻²FK` and `EF−FE=(K−K⁻¹)/(q−q⁻¹)`, the README's relations at `:1381`. Line 350 defines `(t)_q=(q^(2t)−1)/(q²−1)` and `(n)_q!=∏_(m=1)^n (m)_q`.
- **The §4.1 formulas:** `virelizier` lines 638–642, on p.13 (page marker line 608, running head line 609), give the basis `F^i w_0/(i)_q!` and the action `F w_i=(i+1)_q w_(i+1)`, `E w_i=q^(1−n)(n−i+1)_q w_(i−1)` and `K w_i=q^(n−2i)w_i`. These match `:1781` under the renaming n→m, w→u.
- **Identities, verified by hand:**
  - `(t)_q=q^(t−1)[t]_q` with the README's `[r]_q=(q^r−q^(−r))/(q−q⁻¹)` (`:1370`).
  - `F v_i=q^(i(i−1)/2−i(i+1)/2)(i+1)_q v_(i+1)=q^(−i)q^i[i+1]_q v_(i+1)`.
  - `E v_i=q^((i−1)+(1−m))(m−i+1)_q v_(i−1)=[m−i+1]_q v_(i−1)`.
  - Both agree with §8.2's ladder at `:1468`–`:1469` (ε=+1) and with `ladderMatrixE` and `ladderMatrixF` at main's Tau Ceti (`QuantumGroups/UqSl2/ClassicalSpecialization.lean:98`, `:104`: entries `[m−i]_v` at `(i,i+1)` and `[i]_v` at `(i,i−1)`).
- **L(n) is L_m^+:** Virelizier's L(n) has highest weight `q^n`, which is L_m^+ (§8.2's ε=+1).
- **Notation:** using `u_i` for the divided-power basis keeps it apart from the coordinate basis `w_j` of V(m) at `:1757`. The `w_i` suggested in the previous report would have clashed with it.
- **References:** the Virelizier entry (`:1844`–`:1847`) covers §§2.3–4.1, and `sources.toml` records the key `virelizier` with its legal URL.
- **§8.2's locator:** `:1492` still cites Example 3.3 for the type-1 inputs. That is right, since Example 3.3 (`virelizier` lines 552–555, p.11) constructs L(n) in the basis `F^i v_0`.
- **Citations:** `roadmaps grep` finds no roadmap on main or at an open head citing §8.7 or Q8 item 7. The overlap listing reports no dropped id in either direction. §8.7's suppliers (§8.2, Tau Ceti, Mathlib, RepresentationTheory/LieHighestWeight Layer 0 on main, `README.md:319`) are unchanged.

**Library declarations opened this round.**

- **Tau Ceti `2fd255d9`:** `QuantumGroups/UqSl2/ClassicalSpecialization.lean:98`, `:104`, `:109`, `:275`, `:509`; `Algebra/Lie/Sl2/Standard.lean:151`.
- **Tau Ceti `358314d4`:** `Algebra/Lie/Sl2/Standard.lean:177`; `Algebra/Coalgebra/Comodule/Finite/{Monoidal.lean:70,78; RightRigid.lean:97,186,218,262; Rigid.lean:47}`.
- **Overall:** namespace-aware declaration scans of both Tau Ceti trees covered all 143 README names.

**Ownership.** I compared the §§0.2–0.3 claims against the sibling checkouts of #888 (`3375f9e`) and #867 (`ba43cc7`), and against #1649 (`b3b2d26`) read through `roadmaps show` and its checkout. The result is R02. The change adds no new object, so nothing else needed an ownership check.

**Seeded sample.** None of the sampled targets (0.1, 0.2, 1.1, 2.3, 3.1, 3.2, 4.1, 4.2, 4.3, 5.2, 6.1, 6.2, 7.2, 8.3, 8.4) lies in the changed passage. Their text is unchanged since the previous review, which checked them at their locators (`kustermansvaes` pp.840 and 853; `longoroberts` Lemma 3.3, Theorems 3.8 and 3.11; `nt` 1.4.2, 1.6.6, 1.7.3, 1.7.7, 2.2.10–2.2.20 and 2.7.1; `bmt` 2.2, 2.8, 2.9 and 3.6; `malacarne` 4.1; `virelizier` 2.4, 3.13 and 3.14). The README flags no locator as unverified.

**Headlines.**

- **Stated:** `schur_orthogonality` (§3.1), and `compactType_iff`, `haar_modular_automorphism` and `haar_trace_iff_antipode_involutive` (§4.1).
- **Named in the docstring as not statable:** Haar existence, Peter–Weyl, completions and coamenability, `SUq(2)` and `O_F^+`, Tannaka–Krein, Layer 7, §§3.2–3.4, the §8.5 pentagon and §8.6.
- **§8.5 sphericity:** statable once R01 is repaired.

**Adversarial table.** q=1/2 unless stated. Rows marked "new" are computed this round for the changed statements. Rows marked "r23" are carried unchanged from the previous report for statements the diff leaves untouched.

| Statement | Instances | Values on each side | Result | Row |
| --- | --- | --- | --- | --- |
| 8.7 locator: §4.1 divided-power action (`:1781`) | m=2 | F: `(1)_q=1`, `(2)_q=5/4`; E: `q⁻¹(2)_q=5/2=q+q⁻¹`, `q⁻¹(1)_q=2=q⁻¹` | matches the source and the Check | new |
| 8.7 basis change `v_i=q^(i(i−1)/2)u_i` | m=2: v₂=u₂/2 | `F v₁=(5/4)u₂=(5/4)·2v₂=(5/2)v₂=[2]v₂`; `E v₂=(1/2)·2u₁=v₁=[1]v₁`; `E v₁=(5/2)v₀=[2]v₀` | ok | new |
| 8.7 basis change, larger m | m=3: v₃=u₃/8 | `(3)_q=21/16`; `F v₂=q·(3)_q·q⁻³v₃=4·21/16=21/4=[3]`; `E v₁=q⁻²(3)_q=21/4=[3]`; `E v₃=q³·q⁻²·(1)_q u₂=v₂` | ok | new |
| 8.7 `(t)_q=q^(t−1)[t]_q` | t=1, 2, 3 | 1=1; `5/4=(1/2)(5/2)`; `21/16=(1/4)(21/4)` | ok | new |
| 8.7 new Check: wrong-basis control | read u_i as v_i; inverse scaling `v_i=q^(−i(i−1)/2)u_i` | `F v₁=5/4≠5/2`; inverse gives `(1+q²)q=5/8≠5/2` | both wrong models excluded | new |
| 8.7 new Check: specialization at 1 | divided-power and ladder at q=1 | `1, 1+1=2` / `1+1=2, 1`; `[1],[2]=1,2` / `[2],[1]=2,1`; v=1, m=2 Check: F 1,2,0, E 0,2,1 | ok | new |
| 8.7 relation check on Virelizier's basis | `EF−FE` on `u_i` | `q^(1−m)[(i+1)_q(m−i)_q−(m−i+1)_q(i)_q]=[i+1][m−i]−[i][m−i+1]=[m−2i]`, the K-term | ok; no source error | new |
| 8.7 supplier at branch pin (R01) | `ClassicalSpecialization.lean` at `358314d4`; at `2fd255d9` | absent; `ladderMatrixE` `:98` | fails at branch pin | new (R01) |
| 0.1 legs `U_12U_13=(id⊗Δ)U` | H=ℂ, A=C(C₂), sign u | `u⊗u` both sides; two ι₂ legs give `1≠u⊗u` | ok | r23 |
| 0.1 isometry only for injective φ | φ=ε, T=1[s] | `‖T‖=1`, `T_ε=0` | ok | r23 |
| 0.1 W σ-semilinear | y=1⊗1, c=u⊗1 | `W(yc)=1⊗u`, `W(y)c=u⊗1` | ok | r23 |
| 0.2 C*-identity | T=diag(2,1) | `‖T†T‖=4=‖T‖²`; Hilbert–Schmidt `√17≠5` | ok | r23 |
| 0.2 standard vs rescaled | ℂ², (2R, R̄/2) | norm product 2=d; traces scale 4 and 1/4 | ok | r23 |
| 0.2 `d≥1`, equality iff invertible | SU_(1/2)(2) fundamental; character | `d=5/2`; `(5/2)²=1+21/4`; character d=1 | ok | r23 |
| 0.2 composite standard | Hilb_f, ℂ²⊗ℂ³ | `‖composite‖²=6=d(X)d(Y)` | ok | r23 |
| 0.3 cup, projection, reflection | d=5/2 | `‖∪‖²=5/2`, `tr₂p=4/25`, `tr₂(1−p)=21/25`; linear reflection −5/2 | ok | r23 |
| 0.3 truncated fusion | m=3; m=4 | d=1, `1⊗1=0`; d=√2, `[4]=0`, dims 1, √2, 1 | ok | r23 |
| 0.3 sign comparison | δ=−5/2 | `e²=δe`; `pp′p=4/25 p` | ok | r23 |
| 2.3 regular corepresentation | C₂; S₃; trivial group | dims 2, 6; `Λ(2)↦2⊗1` | ok | r23 |
| 3.1 `schur_orthogonality` | SU_(1/2)(2), `F̃=diag(2,1/2)` | `h(a*a)=1/5`, `h(c*c)=4/5`, `h(aa*)=4/5`, `h(u₁₂u₁₂*)=1/5` | ok | r23 |
| 3.1 normalization | character, F̃=2 | `Tr 2=2≠1/2` | ok | r23 |
| 3.2 Plancherel, characters | a+c; f_z | `1/5+4/5=1`; `f₁*f₁(a)=4=f₂(a)`; Vandermonde det 3 | ok | r23 |
| 3.2 `θ=f₁*·*f₁` | fundamental u | `θ(a)=4a`, `h(a*θa)=4/5=h(aa*)` | ok | r23 |
| 3.3 dual metrics | ū, `F̃ūF̃⁻¹`, `FuF⁻¹` | invariant metrics F̃, F̃⁻¹, F⁻² | ok | r23 |
| 3.3 pivotal traces | F=diag(2,1/2), f=diag(1,0) | `tr F=tr F⁻¹=5/2`; 2 vs 1/2 | ok | r23 |
| 3.4 modular and scaling groups | a, c | `σ_(−i)(a)=4a`; `τ_(−i)(c)=c/4=S²(c)` | ok | r23 |
| 4.1 `compactType_iff` | ℂ; ℂ[C₂]; zero ring; ℂ[x] | true/true; `|a|²+|b|²`; zero ring excluded by `Nontrivial`; false/false | ok | r23 |
| 4.1 `haar_modular_automorphism` | ℂ[S₃]; SU_(1/2)(2) | θ=id; θ(a)=4a vs θ⁻¹ 1/20; uniqueness via `h(x*x)=0` | ok | r23 |
| 4.1 `haar_trace_iff_antipode_involutive` | ℂ[S₃]; SU_(1/2)(2) | trace and `S²=id`; `1/5≠4/5` and `S²(c)=c/4≠c` | ok | r23 |
| 4.3 coamenability | ℤ; F₂ | Følner `2/(2N+1)`; `‖Σλ‖=2√3<4` | ok | r23 |
| 5.1 relations iff unitarity | entries of `u*u`, `uu*` | a=0, c=1: `1/4≠1` | ok | r23 |
| 5.1 antipode | c, c* | `S(c)=−c/2`, `S(c*)=−2c*`, `S²(c)=c/4` | ok | r23 |
| 5.2 cup invariance | F=I | `uuᵗ=1` | ok | r23 |
| 5.2 signed cup | F=[[0,1],[−2,0]] | `FF̄=−2I`, `‖E‖²=5` | ok | r23 |
| 6.1 reconstruction | Rep(C₂); Rep(S₃) | dim 2; 6 vs diagonal 4 | ok | r23 |
| 6.3 cancellation ⇒ group | monoid {1,0}; C(C₂) | `0·1=0·0` not injective; Haar 1/2 | ok | r23 |
| 7.1 Haar moments | q=1/2; q=±1 | 4/5, 16/21; 1/2, 1/3 | ok | r23 |
| 7.1 q=−1 model | t=0, z=1 | a=σ₃, c=0; `ac=−ca` | ok | r23 |
| 7.2 normal form | F=[[0,1],[−q⁻¹,0]] | `FF̄=−2I`; dims 1, 5/2, 21/4, 85/8 | ok | r23 |
| 8.1 PBW sign, relations | KF; L₁⁺ | `KF=4FK`; `EF−FE=diag(1,−1)` | ok | r23 |
| 8.2 ladders | L₂⁺; L₁⁻ | weights 1/4, 1, 4; `5/2, 0, −5/2`; L₁⁻ diag(−1,1) | ok | r23 |
| 8.3 Casimir | L₀⁺, L₁⁺, L₂⁺ | 10/9, 17/9, 65/18 | ok | r23 |
| 8.4 type 1 vs local finiteness | L₀⁻; Verma M(1) | K=−1; F not locally nilpotent | ok | r23 |
| 8.5 Clebsch–Gordan | m=n=j=1; Δ(E²) | `α₁=−1/2`; `q[2]=5/4=1+q²` | ok | r23 |
| 8.5 pivotal traces, sphericity (R01) | L₁⁺; L₀⁻; q=±1 | `tr K⁻¹=5/2=tr K`; −1, −1; 1/2 vs 2 | statement ok; statability R01 | r23 |
| 8.6 invariant metric | m=1 | `h₁=1/2`, `⟨Ev₁,v₀⟩=1=q⁻¹h₁` | ok | r23 |
| 8.7 classical ladder | m=2 | F 1, 2, 0; E 0, 2, 1; `[E,F]=diag(2,0,−2)`; `v_j↦C(2,j)w_j` | ok | r23 |
| `Suggested.lean:24` `StarCoalgebra` (R01) | `358314d4`; `2fd255d9` | absent; `Algebra/Coalgebra/Star.lean:46` | fails at branch pin | r23 |
| §§0.2–0.3 single owner (R02) | #888 `:44`–`:46`; #867 `:72`–`:76`; #1649 `:49`–`:51` | all three name another owner | fails | r23, updated heads |

## Not verifiable

- **Timmermann**, *An Invitation to Quantum Groups and Duality* (EMS 2008), is `uncertified` and cited by locator alone. None of its locators is in the changed passage. The previous report lists them.
- **Elaboration at main's pins:** the Lean commands this review may run use the branch's pins. R01's sphericity statement is checked by reading the declarations at `2fd255d9`, not by elaborating it.
- **Descriptions of #888, #867 and #1649** were not read. Their README texts were read at the heads named in R02 and R03.
- **Ownership against open pull requests** was checked against the sibling checkouts the brief lists, `roadmaps grep`/`show` and the overlap listing. Pull requests outside those were not searched.

## Source issues

- none
