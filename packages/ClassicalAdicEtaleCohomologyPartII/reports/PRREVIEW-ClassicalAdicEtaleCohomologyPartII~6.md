# Review of ClassicalAdicEtaleCohomologyPartII (pull request #1549 at 03b098b)

**Verdict:** accepted

Incremental re-review of the 10 lines changed since 63e60e4 (`TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/README.md` only: five lines of §5.7, each formula with a braced subscript placed in a code span). No finding. The previous report's single finding is repaired, the repair changed nothing but backticks, the gate passes on every scanner and the build, and the mathematics of §5.7 and of its consumers §5.8–5.9 was recomputed on the changed formulas.

## Previous findings

- R01 (r5: TeX-only subscripts outside code spans, gate `tex`, 7 hits) — repaired: `README.md:1117` now reads "goes to `Ẑ_p[1/p]⊗ᴸ_{Ẑ_p}M`" and "On a point it is `−⊗ᴸ_{ℤ_p}ℚ_p`"; `:1131` "`t_{X,ℤ_p}[1/p]`"; `:1138` "`H²ᵈ(X_C,ℤ_p(d))⊗_{ℤ_p}ℚ_p`" and "`t_{X,ℤ_p}⊗ℚ_p`"; `:1141` "`Ẑ_p[1/p]⊗ᴸ_{Ẑ_p}−`"; `:1151` "`⊔_{n∈ℕ}Spa C`". The gate at 03b098b reports `tex=0`. Each changed line has an even backtick count (4, 2, 4, 2, 2), so no span is left open.

## Verified sound

**The change is cosmetic.** `git show 63e60e4:…/README.md` and the README at 03b098b are byte-identical after deleting every backtick character (`diff` of the two with `` ` `` stripped: no output). `Suggested.lean` and `metadata.toml` are unchanged (`git diff --stat 63e60e4 HEAD` on the folder: README only, 5 insertions, 5 deletions). No heading, section number, `*Needs:*` line, supplier citation or Lean name changed, so no citation or dependency edge moved. The three-dot diff `origin/main...HEAD` outside the roadmap folder is empty. The worktree is clean at 03b098b6cd19906d37c263ac9a4f11da64411d4f; the folder holds `README.md`, `Suggested.lean`, `metadata.toml` only.

**Gate and direction.** The worker's gate at 03b098b (`gate.md`): every count 0 including `tex=0`, `build=0`, `imports=0`, `statement-hygiene=0`, `readme-ids-missing=0`, `depcheck=0`, `outside-folder=0`, result OK. Rerun from the brief's command (scanners and depcheck): the same line with every count 0, OK. The dependency check rerun from the brief's command printed

```text
depcheck: 239 roadmaps, 2350 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. Merge order unchanged from the previous report: ArithmeticGaloisDuality, ClassicalAdicEtaleCohomology, PadicHodgeTheory and AdicSpacesPartV precede this roadmap; EtaleCohomologyFoundations, EnhancedDerivedSheaves and DerivedModuleAlgebra are on main. The worker's resolver and overlap tools report no unresolved citation, no dropped id, no other open pull request changing this roadmap; the closest open roadmaps in vocabulary (ClassicalAdicEtaleCohomology, AInfCohomology, AdicCoefficientsAndComparisons, ArcTopologyAndDescent, DiamondEtaleCohomology) were compared in the previous reports and no changed line touches their objects.

**Lean (unchanged file, elaborated again).** A scratch importer of the worker-built module (`import TauCetiRoadmap.ClassicalAdicEtaleCohomologyPartII.Suggested`, `#check @name` for all eight declarations, `#print axioms monomial_root_duality`, and the witness `a • x = of (a ^ (p ^ m) * of.symm x)` by `rfl`), run with `lake env lean` from the worktree: exit 0, all eight declarations public, every elaborated type equal to `signatures.md` and to README §3.7 (`p n m` explicit, `Fact (Nat.Prime p)` only on `monomialRootModuleModule` and `monomial_root_duality`, no section variables so no binder can be lost), axioms `propext, sorryAx, Classical.choice, Quot.sound`, the `rfl` witness closes. One-tactic probe on a scratch copy with the `sorry` replaced by `simp`: "`simp` made no progress" at line 103, so the headline is not padding. Header `module` / `public import Mathlib` / `@[expose] public section`, no `set_option`, no sorried data, `theorem` only; Mathlib pin `1b1ccf4b`, Tau Ceti pin `2fd255d9` (`lake-manifest.json`). The module docstring still names §5.7 as not statable with the carriers it lacks (completed pro-étale integral global sections and the derived rationalization), which the README text at 03b098b still requires.

**Seeded sample.** None of the fifteen seeded targets (0.2, 0.3, 0.5, 1.3, 1.6, 2.8, 2.9, 3.2, 3.9, 4.3, 5.4, 5.8, 7.2, 7.3, 7.4) lies in the changed lines; they were checked in the earlier full reviews. Two of them cite or depend on §5.7 and were reopened at the source: §5.8 (`*Needs:* §5.7`) cites Z Theorem 5.5.4, p. 82, Z line 3968: the source states the perfect Galois-equivariant pairing `RΓ(X_C,ℤ_p)⊗ᴸRΓ(X_C,ℤ_p(d))→ℤ_p` through `t_{X,ℤ_p}` for smooth proper pure-d X, exactly the README's hypotheses, and the README's "target shift −2d" is the degree of the trace; §5.4 cites Z Theorem 5.4.4, pp. 79–80, Z line 3831 (page marker for p. 80 at line 3850), smooth proper pure-d X, degreewise perfect Galois-equivariant mod-p pairing, as the README states. §5.7's own locators: Z Definition 5.5.3 at line 3964 (`t_{X,ℤ_p}=lim_n t_{X,ℤ/pⁿ}`, p. 82), the paragraph before Definition 5.5.5 at lines 3972–3975 (`RΓ(X_C,ℚ_p)=RΓ(X_C,ℤ_p)[1/p]` for qcqs X by coherence of the pro-étale topos), Definition 5.5.5 at lines 3976–3978 (`t_{X,ℚ_p}:=t_{X,ℤ_p}[1/p]`); §5.9's Z Theorem 5.5.6 at lines 3979–3987 (pp. 82–83). All exact.

### Adversarial pass

Rows for the five changed lines were recomputed at this head; rows marked "previous report" carry the values computed at c1ef9e9, fadef01 and 63e60e4 for statements the diff leaves untouched.

| Statement | Instances tried | Values on one side | Values on the other side | Result; change |
|---|---|---|---|---|
| `Ẑ_p[1/p]⊗ᴸ_{Ẑ_p}M` and `−⊗ᴸ_{ℤ_p}ℚ_p` on a point (`README.md:1117`) | M=ℤ_p/p; M=ℤ_p; M=[ℤ_p →p ℤ_p] | ℚ_p flat over ℤ_p so Tor₁=0: `ℚ_p⊗ℤ_p/p=0`; `ℚ_p⊗ℤ_p=ℚ_p`; the two-term complex rationalizes to [ℚ_p →p ℚ_p], acyclic | wrong model "Serre quotient by p-power torsion" agrees on these three but not on ℚ_p/ℤ_p (not killed by any pⁿ, yet `ℚ_p⊗ℚ_p/ℤ_p=0`); ECF §F.4.5 Checks `ℤ_ℓ/ℓ↦0`, `ℤ_ℓ↦` a line (main line 1072) | the stated functor is derived scalar extension and excludes the wrong model; none |
| `t_{X,ℤ_p}[1/p]` as a theorem about the rationalized trace (`README.md:1131`) | ℙ¹_C, d=1, class c₁ and c₁/pᵏ | README: H² of the rationalized derived trace sends `c₁⊗1↦1`, `c₁⊗p⁻ᵏ↦p⁻ᵏ` | Z Definition 5.5.5 (line 3978): `t_{X,ℤ_p}[1/p]` on `H²ᵈ(X_C,ℤ_p(d))[1/p]` gives the same values | README's theorem equals Z's definition on every class; none |
| `H²ᵈ(X_C,ℤ_p(d))⊗_{ℤ_p}ℚ_p` and `t_{X,ℤ_p}⊗ℚ_p` (`README.md:1138`) | ℙ¹_C; X with torsion T in H²ᵈ⁻¹ or H²ᵈ | flatness: `H²ᵈ(RΓ⊗ᴸℚ_p)=H²ᵈ(RΓ)⊗ℚ_p` (no Tor term from H²ᵈ⁻¹); `T⊗ℚ_p=0`; on ℙ¹: ℚ_p·c₁, trace 1 | without flatness a Tor₁(H²ᵈ⁺¹,ℚ_p)… term would enter; ℚ_p flat so none; Z line 3978 identifies `H²ᵈ(X_C,ℚ_p(d))=H²ᵈ(X_C,ℤ_p(d))[1/p]` | agree; none |
| `Ẑ_p[1/p]⊗ᴸ_{Ẑ_p}−` as the sequential colimit along p (`README.md:1141`) | the coefficient sheaf itself; a point | `colim(Ẑ_p →p Ẑ_p →p …)=Ẑ_p[1/p]` (each term is Ẑ_p, transition p, so an element a at stage k is a/pᵏ); on a point `colim(ℤ_p →p ℤ_p →…)=ℚ_p` | EDS §0.3 (main line 455–459): derived tensor preserves colimits in either variable, so `Ẑ_p[1/p]⊗ᴸM=colim_k M` along p; Z line 3973–3975 then gives commutation with RΓ on a coherent topos for M bounded below | agree; none |
| non-quasi-compact Check `⊔_{n∈ℕ}Spa C` (`README.md:1151`) | M=Ẑ_p | left: `RΓ(⊔Spa C,Ẑ_p)=∏_nℤ_p` in degree 0 (product over components; `H⁰(Spa C,Ẑ_p)=ℤ_p`), and `(∏_nℤ_p)⊗ℚ_p={(a_n): ∃N, pᴺa_n∈ℤ_p for all n}` | right: `∏_n H⁰(Spa C,Ẑ_p[1/p])=∏_nℚ_p ∋ (p⁻ⁿ)_n`, whose denominators are unbounded, so no N works | the Check is a true negative control for the qcqs hypothesis; none |
| §5.7 comparison, quasi-compact case; bounded-below hypothesis; hypotheses of the integral trace; "never level by level" Check; `*Needs:*` and Layer 5 Dependencies | previous report (63e60e4) | values as tabulated there (Spa C and ℙ¹_C agree; `ℤ/pⁿ⊗ℚ_p=0` for all n versus trace c₁↦1; d=0 trace identity) | as tabulated there | untouched by this diff (the lines changed only by code spans); none |
| §5.8 integral derived duality (seeded, cites §5.7) | ℙ¹_C; [ℤ_p →p ℤ_p]; the point | ℙ¹: degrees 0 and 2 free of rank 1, paired into ℤ_p[−2] with matrix (1); two-term complex: H¹=ℤ_p/p, RHom(−,ℤ_p) has Ext¹=ℤ_p/p and no Hom from the torsion; point: 1⊗1↦1 at every level | Z Theorem 5.5.4 (line 3968): perfect pairing of perfect complexes, so the dual retains the Ext term, which is what the README's "not a degreewise perfect pairing into ℤ_p on torsion" says | agree; none |
| §5.9 route via rationalization | previous report (63e60e4) | perfectness of `RΓ(ℤ_p(d))` (Z Lemma 5.5.1, line 3902) gives `RHom(P,ℤ_p)⊗ℚ_p=RHom_{ℚ_p}(P⊗ℚ_p,ℚ_p)`; ℙ¹ matrix (1); two points diag(1,1) | Z Theorem 5.5.6 proof (line 3986): from the isomorphism, Theorem 5.5.4 and ℚ_p a field | agree; none |
| ECF §F.4.5 supplier paragraph; EDS §§0.3–0.4; CAEC §1.3 `Ẑ_p` | previous report (63e60e4) | main ECF lines 1041–1081, EDS lines 455–503, #875 README line 437 | README `:190`, `:1117`, `:1156`, `:1195` | unchanged; none |
| `Suggested.lean` header, visibility, §3.7 scalar action and Ext clause | rerun at this head | eight `#check`s public; axioms `[propext, sorryAx, Classical.choice, Quot.sound]`; `a • x = of (a^(p^m) * of.symm x)` by `rfl`; `simp` no progress | README `:779`: a^(p^m)·x; §3.7 statement | agree; not padding; none |
| RZ.0–RZ.5 citations, gap destinations, branched-cover route; Conventions; Layers 0–4; §§5.1–5.6; Layer 7; supplier contracts | previous reports (fadef01, c1ef9e9) | values as tabulated there (ℙ¹ trace 1; O_C/p vs O_C/𝔪; H¹=O_C/(ζ_{pᵐ}−1); diag(1,1); nodal curve H²=Λ(−1); S_f=D∖{a}; …) | as tabulated there | unchanged by this diff; none |

**Ownership.** Unchanged from the previous report: §5.7 owns the pro-étale derived rationalization on rigid spaces and `ℚ_p(r)`, `RΓ(X_C,ℚ_p(r))` through it; HodgeTateAndCanonicalSubgroups §6.34 is a lisse-sheaf operation on the pro-Kummer-étale site, ClassicalAdicEtaleCohomology plans no rational coefficients, EtaleCohomologyFoundations §F.4.5 is the scheme version with ℓ invertible and is cited, not restated. No changed line introduces a new object. Ownership against open pull requests whose files the brief does not list was checked only through the roadmap service's index in the previous rounds.

**Shape and policy.** Code spans with Unicode mathematics inside are the README's existing convention (`:1114` `` `t_{X,ℤ_p}:H²ᵈ(X_C,ℤ_p(d))→ℤ_p` `` predates this diff) and the house examples use the same form; gate `latex=0`, `tex=0`, `prnum=0`, `round-labels=0`, `long-fences=0`. §5.7 keeps its statement, five API bullets, proof route, five Checks and `*Needs:*` line.

## Not verifiable

- H, Heuer, *A p-adic Simpson correspondence for smooth proper rigid varieties*, Proposition 2.18: settled as uncertified; §7.7 is cited by locator only and lies outside this diff.

## Source issues

- none
