# FIX-DESIGN-SchrodingerOperatorsAndSpectralTypes~10

This round settles the findings of `REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~9`: three
findings, all P3. Files edited:
- `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md`
- `design/plan.json`
- `sources.toml`

The roadmap is at the design stage, so the package has no `Suggested.lean`. No Lean was elaborated,
and no `#check` scratch file applies. The review's "For the human reviewers" item (the licence of
`teschl`) is not a finding, and nothing was changed because of it.

## F01 (P3) — applied

The finding is right. 1.3's hypothesis is that the projection commutes with every `P_A(B)`, but the
route of 1.7 established only that `W` is invariant under the group. SA-E30 (main,
`SelfAdjointSpectralTheory/README.md` line 1267) gives one direction only: `P_A(B)` commutes with
`U_A(t)`. A bridge from the group to the spectral projections is UnboundedOperators §2.3, UO-B03
(main line 408–410), (i)⇔(iii).

The same gap ran in the opposite direction, and it was repaired too. UO-C03 (main line 552–554)
gives `P_ac(H₁)` commuting with every `P_{H₁}(B)`, not with `e^{−isH₁}`. Two places needed the
step from spectral projections to the group:
- the first step of 1.7 (`W` is invariant under the group);
- 1.9 Pearson ("`e^{isH₁}` commutes with `P_ac(H₁)` (UO-C03)").

UO-B03, (i)⇒(iii), applied to `H₁` and that projection, gives both.

What changed:
- **1.7 route.** "`ℋ_ac(H₁)` reduces `H₁` (UO-C03), so … `W` … reduces `H₂`, as `Ω_±(D_±)` does" →
  - the projection of `ℋ_ac(H₁)` commutes with every `e^{−isH₁}` (UO-C03, then UO-B03 (i)⇒(iii));
  - `e^{−isH₂}W = W` for every real `s`, so `W^⊥` is invariant too;
  - `Q` commutes with every `P_{H₂}(B)` by UO-B03 (iii)⇒(i), with `e^{itQ} = 1 + (e^{it} − 1)Q`;
  - this is 1.3's hypothesis, so `W` reduces `H₂`.

  A one-sentence half-line non-example (the Hardy space) was added.
- **1.7 *Needs:*** gains UO-B03.
- **1.9 Pearson.** The parenthesis now names UO-B03, and its *Needs:* gains UO-B03.
- **Scope bullet** for UnboundedOperators: names strong commutation (UO-B03).
- **Contract** "From TauCetiRoadmap.OperatorTheory/UnboundedOperators": a UO-B03 entry. It uses `C`
  for the second operator, so that `B` stays a Borel set.
- **Layer 1 Dependencies:** "UnboundedOperators Layers 1 and 3, §2.3 (UO-B03) and §4.7".
- **`plan.json`:**
  - `roadmap:OperatorTheory UnboundedOperators UO-B03` is added to targets 1.7b and 1.9a;
  - `UO-B03` is added to the UnboundedOperators supplier's `sections` and described in its `what`.

UnboundedOperators is on main, so the edge points downward.

## F02 (P3) — applied

The finding is right. Plan 1.8b lacked `target:1.2` and SA-E26, and 4.3b lacked `target:4.2`.
Neither was reached transitively: 1.8a needs only 1.1, UO-C03 and `rnDeriv`, and 4.3a needs only
`MemLp`.

`plan.json` changes:
- 1.8b `prerequisites` gains `"target:1.2"` and `"roadmap:OperatorTheory SelfAdjointSpectralTheory SA-E26"`.
- 4.3b gains `"target:4.2"`.

No cycle arises: 1.2 needs 1.1 and UO-C03, and 4.2 needs 4.1, 1.1 and suppliers.

The same pattern elsewhere: a script compared every README *Needs:* line with the union of its
plan targets' prerequisites, taken transitively. It found one more case. Plan 1.1 listed `SA-B44`
and `SA-C25`, where the *Needs:* line has the ranges SA-B44–SA-B45 and SA-C25–SA-C28. These became
`SA-B44-SA-B45` and `SA-C25-SA-C28`, the range form the plan already uses for `SA-E26-SA-E30`.
After the edits the comparison reports no gap.

## F03 (P3) — applied

The finding is right. The book's front matter on the author's page gives the table of contents and
the preface (read only for chapter and section titles, nothing copied):
- Chapter 3 is "Laplace operator on a Riemannian manifold", with §3.5 the divergence theorem and
  §3.6 the Laplace operator;
- the preface says that Chapter 3 focuses on the Laplace–Beltrami operator and the Green formula;
- Chapter 4 is the `L²` theory: §4.1 distributions and Sobolev spaces, §4.2 the Dirichlet Laplace
  operator;
- Chapter 11, §§11.2–11.3, covers Lipschitz functions and essential self-adjointness.

What changed:
- **README 3.1:** "grigoryan09 Ch. 4" → "grigoryan09 Ch. 3".
- **README References:** "`grigoryan09` (Ch. 4, 11)" → "(Ch. 3, 4, 11)".
- **README 3.4** keeps "Ch. 4"; 3.5 and 3.6 keep "Ch. 11".
- **`plan.json`:**
  - 3.1b locator "Ch. 4 (Green formula)" → "Ch. 3 (Green formula)";
  - 3.1a locator "Ch. 3-4" → "Ch. 3", since the Laplacian on smooth functions is Chapter 3's.
- **`sources.toml`, `grigoryan09`:**
  - `locator`: "Ch. 3 (…Green formula), Ch. 4 (§§4.1–4.2 …), Ch. 11 (§§11.2–11.3 …)";
  - `version_note` records that the numbering was checked against the table of contents and preface
    on the author's page;
  - `status` stays `uncertified`, because the text itself was not read.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.7: group invariance ⇒ `Q` commutes with every `P_{H₂}(B)` | `H₂ = M_x ⊕ 7` on `L²(ℝ) ⊕ ℂ`, `W = L² ⊕ 0`, `Q = 1 ⊕ 0` | `e^{−isH₂} = e^{−isx} ⊕ e^{−7is}` commutes with `Q`; `P_{H₂}(B) = 1_B(x) ⊕ 1_B(7)` commutes with `Q` | true | none |
| 1.7: the same, degenerate cases | `H₁ = 0` on `ℂ` (`ℋ_ac = 0`); `H₁ = H₂ = M_x` | `W = 0`, `Q = 0`; `Ω = 1`, `W = ℋ`, `Q = 1`; both commute trivially | true | none |
| Group of a projection | `Q² = Q` | `e^{itQ} = Σ (it)ⁿQⁿ/n! = 1 + (e^{it} − 1)Q`; at `t = π`, `1 − 2Q`, so commuting with the group gives commuting with `Q` | true | none |
| UO-B03 (iii)⇒(i) at `C = Q` | spectral projection of `Q` at `{1}` | `P_Q({1}) = Q`, including `Q = 0` and `Q = 1` | true | none |
| Necessity of all real `s` | `H₂ = M_x`, `W` = Hardy space of the upper half-plane | `e^{iax}` is bounded by `e^{−a Im z} ≤ 1` there for `a ≥ 0`, so `W` is invariant for `s = −a ≤ 0`; for `s > 0` the support of the Fourier transform leaves `[0, ∞)`, and `W` does not reduce `M_x` | the half-line hypothesis is insufficient | sentence added |
| 1.7: invariance of `ℋ_ac(H₁)` under `e^{−isH₁}` | `H₁ = M_x ⊕ diag(1/2)`, `x = (1_{[0,1]}, 0)` | `e^{−isH₁}x = (e^{−isλ}1_{[0,1]}, 0)`, still of measure `Leb\|[0,1]` | true | UO-B03 cited |
| 1.9: `e^{isH₁}` commutes with `P_ac(H₁)` | the same `H₁` | `P_ac = 1 ⊕ 0`; `e^{isH₁} = e^{isλ} ⊕ e^{is/2}` commutes | true | UO-B03 cited |
| Contract wording "`Q` commutes with `e^{isA}` iff with every `P_A(B)`" | `A = diag(1,2)`, `Q` projection onto `(1,1)/√2` | `e^{isA}` with `s = π` is `diag(−1, 1)`, which does not commute with `Q`; `P_A({1}) = diag(1,0)` does not commute with `Q` either | consistent in both directions | none |
| Plan 1.8b with 1.2, SA-E26 | dependency closure | 1.2 → 1.1, UO-C03; SA-E26 is on main | acyclic | added |
| Plan 4.3b with 4.2 | dependency closure | 4.2 → 4.1, 1.1, QuantumFoundations §8.2, UO-A07, UO-C02, UO-D06, SA-E47 | acyclic | added |
| `grigoryan09` locators | front matter on the author's page | Green formula: Ch. 3; `H¹`/Dirichlet Laplacian: Ch. 4 §§4.1–4.2; essential self-adjointness: Ch. 11 §11.3 | README 3.4 and 3.5/3.6 already correct | 3.1, References, plan 3.1a/3.1b, manifest |

No Check or worked example uses the changed passages. The Checks of 1.7, 1.8, 1.9 and 4.3 do not
involve the commutation step or the plan prerequisites, so none needed recomputation.

## Checks run

Supplier-order gate (the prescribed command):

```
candidate: SchrodingerOperatorsAndSpectralTypes is not in the merge order yet; checked as if placed after QuantumFoundations (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2246 edges, 0 problem(s)
```

The gate shows no UPWARD or CYCLE line.

`roadmaps resolve` on the edited README found no cross-roadmap citation and no Lean name missing.

The worker's earlier lead, `CompactFormPair.eigenvalue_eq_rayleighMinMax`, is not an error. It is
declared on main in `TauCetiRoadmap/VariationalMethods/Suggested.lean` line 171 (README line 788),
and the README attributes it to VariationalMethods 4.4.

## Notes for the maintainer

- No new target, no new object, and no change to any name that other roadmaps cite.
- The only new supplier section is UnboundedOperators UO-B03, on main. Ownership against open pull
  requests did not arise, because nothing new is owned here.
- No source was requested. No `needs-references.toml` was written.
- `grigoryan09` remains uncertified. Only its front matter (table of contents and preface) was read,
  from the author's page.
