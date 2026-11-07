# Review of OperatorAlgebraDynamics (pull request #1097 at 423006d)

**Verdict:** needs changes

This is an incremental re-review of the 91 lines changed since 5b920ff. All of them are in `TauCetiRoadmap/OperatorAlgebraDynamics/README.md`: 48 insertions and 43 deletions at lines 12, 764–776, 808–874 and 1043. `Suggested.lean` and `metadata.toml` are byte-identical to 5b920ff. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OperatorAlgebraDynamics'` is empty. Both previous findings are repaired. The two findings below are new. R01 is a failure of the worker's gate. It comes from a citation inherited unchanged from main, which the dependency check now reads differently. R02 is a domain inference that the R01 repair of the previous round introduced in the vacuum-variance computation.

## R01 (P2) — The dependency check fails: the roadmap is on main and cites CStarAlgebras, which is not

Location: `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` lines 42–45: "[CStarAlgebras C1–C2](../CStarAlgebras/README.md) supplies representations, approximate units, multipliers, ideals and quotients; C5 supplies tensor products and analytic inductive limits; C6 … and C7 supplies exactness."

Claim: CStarAlgebras C1–C2, C5, C6 and C7 are suppliers of this roadmap.

Witness: the gate at 423006d reports `depcheck=1 … FAIL` with `UPWARD: OperatorAlgebraDynamics (on main) -> CStarAlgebras (#6) at README lines [42]`, and the dependency check prints `depcheck: 239 roadmaps, 2362 edges, 1 problem(s)`. OperatorAlgebraDynamics is on the content repository's main. CStarAlgebras is not: it is merge-order line 7, open as a new roadmap at 33ddcef. HilbertModules is in the same position at merge-order line 8, but it is stated at lines 46–56 as declared gaps and is not flagged.

This edge is inherited. Main's README has the same bullet at its line 40. At 5b920ff the check placed this roadmap after its last supplier and reported 0 problems; it now reads the roadmap as on main. It is not a false positive, though: it is a supply edge from a merged roadmap to an unmerged one.

Repair: treat CStarAlgebras the way lines 46–56 already treat HilbertModules. Cite the pinned Mathlib for what exists there, and state the rest as declared gaps, one need per slug, with the same slugs added to the plan's `gaps`. The following replacement for lines 42–45 was tested on a scratch copy and gives `depcheck: 239 roadmaps, 2361 edges, 0 problem(s)`:

    - The pinned Mathlib has the multiplier C*-algebra `𝓜(ℂ, A)` (`DoubleCentralizer`,
      `Mathlib.Analysis.CStarAlgebra.Multiplier`) and the increasing approximate unit
      `CStarAlgebra.approximateUnit` (`Mathlib.Analysis.CStarAlgebra.ApproximateUnit`).
      What [CStarAlgebras](../CStarAlgebras/README.md) must provide
      (gap:cstar-ideals-quotients): C1.3's closed ideals and quotient C*-algebras with
      the quotient C*-norm. What CStarAlgebras must provide
      (gap:cstar-multiplier-extension): C1.7's unique strictly continuous extension of a
      nondegenerate star homomorphism `A → M(B)` to `M(A) → M(B)`. What CStarAlgebras
      must provide (gap:cstar-representations): C2.1–C2.2's state extension,
      irreducible representations and restriction of representations to ideals. What
      CStarAlgebras must provide (gap:cstar-tensor-products): C5.1–C5.2's maximal and
      minimal C*-tensor products. What CStarAlgebras must provide
      (gap:cstar-inductive-limits): C5.4's C*-inductive limits and universal unital
      C*-algebra on countably many unitaries. What CStarAlgebras must provide
      (gap:cstar-nuclearity): C6.1–C6.2's nuclearity with CP approximation. What
      CStarAlgebras must provide (gap:cstar-exactness): C7.1's exactness.

Each section named here exists at CStarAlgebras 33ddcef: C1.3 at line 305 (closed ideals and the quotient C*-norm, lines 322–324), C1.7 at line 468 (the extension at lines 474–476), C2.1 at 544, C2.2 at 568, C5.1 at 1112, C5.4 at 1203, C6.1 at 1272 and C7.1 at 1455. The two Mathlib declarations are at the pin: `CStarAlgebra 𝓜(ℂ, A)` at `Mathlib/Analysis/CStarAlgebra/Multiplier.lean:639` and `CStarAlgebra.approximateUnit` at `Mathlib/Analysis/CStarAlgebra/ApproximateUnit.lean:215`.

Alternatively, CStarAlgebras could merge first, as the pull request's dependency block already states; that would make the citation one of a roadmap on main. But the gate fails at this head until either change is made.

## R02 (P3) — The vacuum-variance sentence infers `Ω ∈ D(Φ(f)²)` from second-order differentiability

Location: `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` lines 838–840: "the vacuum variance `⟨Ω,Φ(f)²Ω⟩` of the Stone generator, Ω lying in `D(Φ(f)²)` because `t↦⟨Ω,exp(itΦ(f))Ω⟩` is twice differentiable at t=0".

Claim: twice differentiability at 0 of the vacuum characteristic function puts Ω in the domain of `Φ(f)²`.

Witness: a second derivative at 0 of `t↦∫e^{itλ}dμ_Ω(λ)` gives a finite second moment of `μ_Ω`, so Ω is in `D(Φ(f))`. Membership in `D(Φ(f)²)` needs a finite fourth moment. Counterexample: let `Φ` be multiplication by `λ` on `L²(ℝ)` and `|Ω(λ)|²=c/(1+|λ|⁵)` with `c=0.46774`. The second moment is 0.61803, so the characteristic function is C². The truncated fourth moments are 4.31, 8.62 and 12.92 at cutoffs 10², 10⁴ and 10⁶, so the fourth moment diverges and `Ω∉D(Φ²)`.

The conclusion is true for this Ω, but the stated reason does not prove it.

Repair, either of the following:

- Weaken to what the reason proves. Write "Ω lying in `D(Φ(f))` because `t↦⟨Ω,exp(itΦ(f))Ω⟩` is twice differentiable at t=0, with `‖Φ(f)Ω‖²=‖f‖²/2`", and write the vacuum variance as `‖Φ(f)Ω‖²`.
- Keep `D(Φ(f)²)` and give the right reason. Write "because `exp(−t²‖f‖²/4)` is smooth at t=0, so the spectral measure of Ω for `Φ(f)` is the centred Gaussian of variance `‖f‖²/2`, with every moment finite".

Both versions were tested. On the instance h=ℂ, f=1 the second version gives variance 1/2 and fourth moment 3/4 (finite). On the heavy-tailed instance the first version holds: `Ω∈D(Φ)` and `‖ΦΩ‖²=0.618`.

## Previous findings

- R01 — repaired: line 12 now reads "QuantumFoundations §6.4 owns the bosonic finite-particle domain `D_fin` of `F_s(h)` with the creation and annihilation operators `a(f)` and `a†(f)` on it, the CCR on `D_fin` …, the strong continuity of `f↦π_F(W(f))`"; lines 848–854 match. The repair rewrote lines 835–844; its vacuum-variance clause is the new R02.
- R02 — repaired: lines 768–772 read "(Bratteli–Robinson 2, Theorem 5.2.8, which for nondegenerate σ gives the existence and uniqueness up to *-isomorphism of this algebra, its simplicity and `‖W(f)−1‖=2` for `f≠0`; its nondegeneracy hypothesis enters only through simplicity …)"; line 776 and the references at line 1043 match.

## Verified sound

**Scope of the change.** One commit (423006d3), README only. The previous report's two findings account for every changed passage: the ownership paragraph (line 12), the Weyl-algebra locator (764–776, 1043), and the bosonic Fock section with its Checks (808–874). Lines 838–840 are R02. Lines 42–45 are untouched and are R01 only because the dependency check changed.

**Ownership split, resolved at the heads (R01 of the previous report).**
- QuantumFoundations at 824bab8 (#1771), README:
  - §6.3 is at line 724 and §6.4 at line 740.
  - Line 15 lists under Layer 6 the bosonic creation and annihilation operators on the finite-particle domain of D8's symmetric Fock space, the CCR there and on `D(N)`, Fock irreducibility and vacuum cyclicity, the Segal-field normalization adapter, and the norm-topology continuity of the Fock Weyl operators. It adds the parenthesis "D8's regularity is continuity along each real line".
  - Line 55 says that D8 supplies the antisymmetric Fock space with its operators and faithful CAR representation, regular representations, and the symmetric Fock representation with its field operators and vacuum characteristic function `exp(−‖h‖²/4)`. It also says "D8 constructs no bosonic creation or annihilation operators and no finite-particle domain".
  - Line 742 defines `a(f)η=√n·b̄_n(f)η` and `a†(f)η=√(n+1)P₊^(n+1)(f⊗η)` on `D_fin`, and identifies the closure of `(a(h)+a†(h))/√2` with D8's Stone generator `Φ_D8(h)`.
  - So every attribution at lines 12 and 848–854 names a statement that section makes, and nothing this head keeps for D8 is claimed there.
- The sibling revision #1137, now at 2ccd93b, states the same split at its lines 110–129 and 2955–2962. Its own review (PRREVIEW-OperatorAlgebraDynamics~15, at 0e44b61) records that its description has #1097 merge first. The two revisions of this folder therefore agree on ownership, and the textual conflict has a stated order.
- RelativisticQuantumFieldTheory at b6720a9 (#1772) is consistent with the split:
  - Line 19 consumes D8 for the Fock carriers and invariant-domain fields, with the anchor `#d8-car-weyl-algebras-and-free-equilibrium-states`. That anchor still resolves: the heading at line 665 is unchanged.
  - Line 3516 uses QuantumFoundations' finite-particle domain.
- No line of this README still constructs `D_fin`, `Φ₀` or bosonic `a†`. The only hits for `D_fin` are lines 12 and 849, both deferrals. The `a†` hits at 676–699 are the fermionic operators on `Λⁿ(h)`, which D8 keeps.
- D8 uses no QuantumFoundations result. The phrase "the Segal-field adapter of QuantumFoundations §6.4" (line 843) is a mention: QuantumFoundations line 15 calls it "the Segal-field normalization adapter", and it sits in §6.4 (line 742).

**Bratteli–Robinson 2, Theorem 5.2.8 (R02 of the previous report).** The parenthesis is consistent with the ℓ²(V) argument at lines 779–794. Instance V=ℝ, σ=0:
- The universal algebra is commutative.
- The character `W(t)↦1` gives a nonzero C*-algebra ℂ, generated by nonzero elements satisfying both relations and not isomorphic to it. So for a degenerate σ, uniqueness in the book's sense fails, and it fails exactly as simplicity does.
- `‖W(1)−1‖=2` still holds, through `λ(1)` acting as the bilateral shift.

For a nondegenerate σ, simplicity makes every nonzero representation faithful, which is the book's uniqueness. "Enters only through simplicity" is therefore accurate for the universal algebra. The locator itself is under Not verifiable.

**Fock section (lines 808–874).** Every identity was recomputed; the values are in the table. The Attal locators in the changed lines were read in the cache: Def. 8.20, p. 18 (`attal-fock` line 654), Prop. 8.21, p. 18 (line 661), (8.18), p. 19 (line 695), and Prop. 8.23, p. 19 (lines 699–707). Prop. 8.23 gives `W_{tu}=exp(it·(a*(u)−a(u))/i)`. At `u=if/√2`, antilinearity of `a` turns this into `(a*(f)+a(f))/√2`, which is the formula of line 842. Attal's Prop. 8.24 (lines 711–720) gives the unnormalised field variance `|z|²`, which matches the README's "translation by `if` … vacuum variance `‖f‖²`".

**Gate.** My rerun at 423006d:
`gate OperatorAlgebraDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`, exit 1. The single failure is R01. My run printed no build field; the worker's gate reports `build=0`, and the elaboration below agrees.

**Dependency check** (verbatim): `UPWARD: OperatorAlgebraDynamics (on main) -> CStarAlgebras (#6) at README lines [42]` and `depcheck: 239 roadmaps, 2362 edges, 1 problem(s)`, exit 1. With the R01 repair applied to a scratch copy: `depcheck: 239 roadmaps, 2361 edges, 0 problem(s)`, exit 0.

**Elaboration.** `lake env lean TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` from the pull-request worktree prints exactly four `declaration uses sorry` warnings (lines 55, 72, 107, 116) and nothing else, in 9.6 s.

**Elaborated signatures.** I elaborated the worker's `SignatureCheck.lean` once. Its first 125 lines are byte-identical to `Suggested.lean` (checked by `diff`), followed by `#check @name` for all six declarations. The six types equal those in `signatures.md` and those the previous reports compared with README lines 127, 145, 148–150 and D7:
- `continuous_action` under `[IsTopologicalGroup G]`;
- `IsCovariant` without the group topology, which is intended, since covariance is algebraic;
- `exists_integratedOperator` with `U.IsUnitary`, strong continuity, `[μ.InnerRegularCompactLTTop]` and `Integrable f μ`;
- `IsKMS` with `[PartialOrder A] [StarOrderedRing A]`;
- `kms_invariant` with `β ≠ 0`;
- `kms_entire_identity` for every real β.

Nothing changed.

**Headline theorems and padding.** The file is unchanged since a5d7f8b. The four statable headlines are stated, the module docstring names the rest with their missing carriers, and the one-tactic probe of PRREVIEW-OperatorAlgebraDynamics~10 stands: no Lean statement was touched.

**Seeded sample.** The worker's sample came with no targets ("none found by heading"). The README flags no locator as unverified (`grep -c unverified` gives 0). The changed lines carry two kinds of locator: the four Attal locators above, verified, and Bratteli–Robinson 2, Theorem 5.2.8, which is under Not verifiable.

**Overlaps** (`scratch/overlaps.md`):
- #1137 conflicts textually; the merge order is stated and ownership agrees (above).
- #1187 touches `Suggested.lean` only through the Tau Ceti pin bump and is not a revision of this roadmap.
- No id this README cites is dropped by an open pull request, and no id is defined only by an open revision.
- QuantumFoundations is a new roadmap (merge-order line 207). It is cited here only in the scope deferral, never as a supplier.

**Library declarations opened at the pin:**
- `DoubleCentralizer` (`Mathlib/Analysis/CStarAlgebra/Multiplier.lean:68`);
- `instCStarRing : CStarRing 𝓜(𝕜, A)` (`:589`);
- `CStarAlgebra 𝓜(ℂ, A)` (`:639`);
- `Filter.IsIncreasingApproximateUnit` (`Mathlib/Analysis/CStarAlgebra/ApproximateUnit.lean:143`);
- `CStarAlgebra.approximateUnit` (`:215`).

No quotient C*-algebra of a closed ideal exists under `Mathlib/Analysis/CStarAlgebra/` at the pin (grep for `Quotient`), so the gap `cstar-ideals-quotients` in the R01 repair asks for nothing the pin has.

**Cross-roadmap citations resolved: 19.**
- QuantumFoundations 824bab8: §6.3 (line 724), §6.4 (line 740), and lines 15, 55, 742 and 744.
- #1137 at 2ccd93b: lines 110–129 and 2955–2962.
- RelativisticQuantumFieldTheory b6720a9: lines 19 and 3516.
- CStarAlgebras 33ddcef: C1.3 (305), C1.4 (380), C1.7 (468), C2.1 (544), C2.2 (568), C5.1 (1112), C5.4 (1203), C6.1 (1272) and C7.1 (1455).
- `scratch/citations.md` lists no unresolved citation.

**Adversarial table.** Rows for the changed statements carry values computed this round with an exact pure-Python model of `F_s(ℂ)` truncated at 60 sectors. The other rows cite the previous reports.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Ownership split, line 12 and lines 848–854 | QuantumFoundations 824bab8 lines 15, 55, 742; #1137 2ccd93b lines 110–129; this README | QF line 55: "D8 constructs no bosonic creation or annihilation operators and no finite-particle domain"; QF line 742 defines `a`, `a†` on `D_fin`, the CCR and norm continuity; #1137 states the same split; this README has `D_fin` only at lines 12 and 849, both deferrals | one owner for each object at all three heads | none |
| Bratteli–Robinson Theorem 5.2.8 remark (lines 768–772): nondegeneracy enters only through simplicity | V=ℝ, σ=0; V=ℝ², σ=ad−bc | σ=0: universal algebra commutative, the quotient `W(t)↦1` is ℂ, generated by nonzero Weyl elements and not isomorphic, so uniqueness and simplicity fail together; `‖W(1)−1‖=2` via the bilateral shift (sup over 1000 circle points of `|w−z|` at `z=e^{0.7i}`: 1.999998); nondegenerate: simple, every nonzero representation faithful | consistent; locator not verifiable | none |
| Product law `W_F(f)W_F(g)=exp(−i·Im⟨f,g⟩/2)W_F(f+g)` (lines 824, 835–837) | h=ℂ, f=1, g=i, k=0.3+0.2i on `e(k)` | max sector error 2.3·10⁻¹⁶; `Im⟨1,i⟩=1` | the Weyl relation of `(h_ℝ,Im⟨·,·⟩)` | none |
| Translation by `if` gives the relation at `2·Im` (lines 845–847) | same instance, `u=if` | phase `0.5403023−0.8414710i = exp(−i·Im⟨1,i⟩)`, the relation `exp(−i·(2Im)/2)` | correct | none |
| Vacuum variance `‖f‖²/2` (lines 837–839) | ‖f‖=1, 2 | `−φ''(0)` = 0.49999994, 1.9999990 (expected 0.5, 2); translation by `if`: 0.9999997, 3.999996 (= ‖f‖²) | value correct | none |
| Domain clause "Ω ∈ `D(Φ(f)²)` because twice differentiable" (lines 839–840) | `|Ω(λ)|²=c/(1+|λ|⁵)`, c=0.46774; Gaussian N(0,1/2) | heavy tail: second moment 0.61803 (C² characteristic function), truncated fourth moments 4.31, 8.62, 12.92 (diverge); Gaussian: fourth moment 0.75 | the inference fails; the conclusion holds here | R02 |
| `(1/i)d/dt W_F(tf)e(g)` at 0 equals `(⟨f,g⟩e(g)+d/ds e(g+sf))/√2` (lines 840–842) | f=0.7−0.4i, g=0.5+0.3i, step 10⁻⁶ | max error against `(a(f)+a†(f))e(g)/√2` over 30 sectors 8.2·10⁻¹¹; `a(f)e(g)−⟨f,g⟩e(g)` error 1.4·10⁻¹⁷; `attal-fock` lines 699–707 give `(a*(u)−a(u))/i`, which at `u=if/√2` is `(a*(f)+a(f))/√2` | correct | none |
| Strong continuity of `t↦W_F(tf)` (lines 826–829) | h=ℂ, f=1, vacuum; general `e(g)` | `‖W_F(tf)Ω−Ω‖²=2−2exp(−t²/4)` = 0.442, 0.00499, 0.0000500 at t=1, 0.1, 0.01; `‖W_F(tf)‖=1` and totality give the ε/3 argument | correct | none |
| `Φ(f)` as Stone generators "constructed above" (lines 830–831) | line 778 | Stone's theorem in regular representations; regularity of `π_F` is the preceding clause | resolves inside D8, no forward reference | none |
| Check h=0 (lines 857–858) | `F_s(0)` | `Symⁿ(0)=0` for n≥1, so `F_s(0)=ℂ`; `e(0)=(1,0,0,…)=Ω`; generator of the constant 1 is 0; Weyl algebra of V=0 is `ℂ·W(0)=ℂ` | correct | none |
| Check h=ℂ, f=1, g=i (lines 861–865) | `W_F(1)W_F(i)` vs `W_F(i)W_F(1)` on `e(k)` | ratio 0.5403023−0.8414710i = `exp(−i)`; `Im⟨i,1⟩=−1` | correct; opposite sign gives `exp(i)` | none |
| Check variance of `Φ(1)` (lines 866–870) | h=ℂ, f=1 | second derivatives −0.49999994 and, for `if`, −0.9999997; `exp(−‖f‖²/2)=exp(−‖f‖'²/4)` for `⟨·,·⟩'=2⟨·,·⟩`, whose `Im` is `2·Im` | correct | none |
| References entry, line 1043 | lines 768–776 | same theorem, same three claims | consistent | none |
| CStarAlgebras supplier bullet, lines 42–45 | depcheck at this head; scratch copy with the gap form | 1 problem (UPWARD at line 42) / 0 problems | gate fails | R01 |
| ℓ²(V) representation: product and star laws, `λ(0)=1`, invariant shift, approximate eigenvectors, `‖W(f)−z‖=2`, `‖W(f)−W(g)‖=2`, canonical trace, linear independence, nonseparability at V=ℝ, σ=0 (lines 779–806) | as PRREVIEW-OperatorAlgebraDynamics~14 | that report's values (`exp(−i)` both sides at `V=ℝ²`; defect `√(2/N)=0.5` at N=8; `sup|w−z|=1.99999`) | unchanged text, carried | none |
| `exists_integratedOperator`, `IsKMS` (β=0, β<0, convention), `kms_invariant`, `kms_entire_identity`, `continuous_action`, `IsCovariant` | as PRREVIEW-OperatorAlgebraDynamics~8 and ~5 | those reports' values (`δ₁`: `T ξ=π(f 1)ξ`; non-unitary `U n=2ⁿ` gives `‖T‖=2>1`; Gibbs sign on `M₂(ℂ)`; rotation counterexample at β=0) | unchanged file, carried | none |
| D8 CAR targets and Checks (lines 665–762), Bogoliubov relations, D5 Checks | as PRREVIEW-OperatorAlgebraDynamics~5 | that report's values (`E₁₂` family, `‖f_N−f_M‖²≤4^(−M)/3`, `√2` separation, particle–hole automorphism) | unchanged text, carried | none |

## Not verifiable

- Bratteli–Robinson, *Operator Algebras and Quantum Statistical Mechanics 2*, Theorem 5.2.8 (lines 768–776, 1043). The manifest settles it as `uncertified` (paywalled), so it is cited by locator alone. Two open arXiv texts cite the same theorem in the same direction:
  - arXiv:1601.04809 (line 179 of its text) cites it for the Weyl CCR algebra defined by `W(f)*=W(−f)` and `W(f)W(g)=e^{−iσ(f,g)/2}W(f+g)`.
  - Neeb, arXiv:0911.4412 cites "[BR97, Thm. 5.2.8]" for the discontinuity of `f↦W(f)` on every ray, which is `‖W(f)−1‖=2`.

  Neither citing sentence mentions simplicity, so that attribution rests on the locator.
- Bratteli–Robinson 2, §5.2.1 (line 834) and Renault, LNM 793: paywalled, unchanged this round.

## Source issues

- none
